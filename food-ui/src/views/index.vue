<template>
  <div>
    <!-- 统计信息部分 -->
    <el-row :gutter="20">
      <el-col :span="6">
        <div>
          <el-statistic
              group-separator=","
              :precision="2"
              :value="value2"
              :title="title"
          ></el-statistic>
        </div>
      </el-col>
      <el-col :span="6">
        <div>
          <el-statistic title="男女比">
            <template slot="formatter">
              456/2
            </template>
          </el-statistic>
        </div>
      </el-col>
      <el-col :span="6">
        <div>
          <el-statistic
              group-separator=","
              :precision="2"
              decimal-separator="."
              :value="value1"
              :title="title"
          >
            <template slot="prefix">
              <i class="el-icon-s-flag" style="color: red"></i>
            </template>
            <template slot="suffix">
              <i class="el-icon-s-flag" style="color: blue"></i>
            </template>
          </el-statistic>
        </div>
      </el-col>
      <el-col :span="6">
        <div>
          <el-statistic :value="like ? 521 : 520" title="Feedback">
            <template slot="suffix">
              <span @click="like = !like" class="like">
                <i
                    class="el-icon-star-on"
                    style="color:red"
                    v-show="!!like"
                ></i>
                <i class="el-icon-star-off" v-show="!like"></i>
              </span>
            </template>
          </el-statistic>
        </div>
      </el-col>
    </el-row>

    <div style="width: 3500px">
      <!-- 用户增长图表时间选择部分 -->
      <el-row :gutter="20">
        <el-col :span="4" :offset="10">
          <div>
            <el-select style="width: 120px" v-model="userGrowthTimeRange" placeholder="请选择用户增长时间范围"
                       @change="handleUserGrowthTimeRangeChange">
              <el-option label="全部" value="all"></el-option>
              <el-option label="最近半年" value="halfYear"></el-option>
              <el-option label="最近一个月" value="oneMonth"></el-option>
              <el-option label="最近一周" value="oneWeek"></el-option>
            </el-select>
          </div>
        </el-col>
      </el-row>
      <!-- 图表部分 -->
      <el-row :gutter="20">
        <el-col :span="12">
          <div ref="userGrowthChart" style="width: 100%; height: 400px;"></div>
        </el-col>
      </el-row>
    </div>

    <!-- 食谱数量图表时间选择部分 -->
    <div style="width: 3500px">
      <el-row :gutter="20">
        <el-col :span="4" :offset="10">
          <div>
            <el-select style="width: 120px" v-model="recipeCountTimeRange" placeholder="请选择食谱数量时间范围"
                       @change="handleRecipeCountTimeRangeChange">
              <el-option label="全部" value="all"></el-option>
              <el-option label="最近半年" value="halfYear"></el-option>
              <el-option label="最近一个月" value="oneMonth"></el-option>
              <el-option label="最近一周" value="oneWeek"></el-option>
            </el-select>
          </div>
        </el-col>
      </el-row>
      <!-- 图表部分 -->
      <el-row :gutter="20">
        <el-col :span="12">
          <div ref="recipeCountChart" style="width: 100%; height: 400px;"></div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import {getRecipeCountByDate, getUserGrowthByDate} from '@/api/recipe/recipe.js';
import * as echarts from 'echarts'; // 引入ECharts

export default {
  data() {
    return {
      like: true,
      value1: 4154.564,
      value2: 1314,
      title: "增长人数",
      userGrowthTimeRange: 'all', // 用户增长时间范围
      recipeCountTimeRange: 'all', // 食谱数量时间范围
      userGrowthChartInstance: null,
      recipeCountChartInstance: null,
      userGrowthData: [],
      recipeCountData: [],
    };
  },
  mounted() {
    console.log('userGrowthChart:', this.$refs.userGrowthChart);
    console.log('recipeCountChart:', this.$refs.recipeCountChart);
    this.initCharts();
    this.fetchUserGrowthData();
    this.fetchRecipeCountData();
  },
  methods: {
    initCharts() {
      this.$nextTick(() => { // 确保 DOM 已经更新
        console.log('初始化用户增长图表:', this.$refs.userGrowthChart); // 添加日志输出
        this.userGrowthChartInstance = echarts.init(this.$refs.userGrowthChart);
        console.log('初始化食谱数量图表:', this.$refs.recipeCountChart); // 添加日志输出
        this.recipeCountChartInstance = echarts.init(this.$refs.recipeCountChart);
      });
    },
    async fetchUserGrowthData() {
      try {
        const response = await getUserGrowthByDate({ timeRange: this.userGrowthTimeRange });
        console.log('用户增长数据:', response); // 添加日志输出
        if (response.code === 200) {
          this.userGrowthData = response.data;
          console.log('用户增长数据已更新:', this.userGrowthData); // 添加日志输出
          this.renderChart(this.userGrowthChartInstance, '用户增长趋势', this.userGrowthData);
        } else {
          console.error('获取用户增长数据失败:', response.message);
        }
      } catch (error) {
        console.error('请求用户增长数据时出错:', error);
      }
    },
    async fetchRecipeCountData() {
      try {
        const response = await getRecipeCountByDate({ timeRange: this.recipeCountTimeRange });
        if (response.code === 200) {
          this.recipeCountData = response.data;
          this.renderChart(this.recipeCountChartInstance, '食谱增长趋势', this.recipeCountData);
        } else {
          console.error('获取食谱数量数据失败:', response.message);
        }
      } catch (error) {
        console.error('请求食谱数量数据时出错:', error);
      }
    },
    renderChart(chartInstance, title, data) {
      const dates = data.map(item => item.date);
      const counts = data.map(item => item.count);
      console.log('日期数据:', dates); // 添加日志输出
      console.log('数量数据:', counts); // 添加日志输出

      const option = {
        title: {
          text: title
        },
        tooltip: {
          trigger: 'axis'
        },
        xAxis: {
          type: 'category',
          data: dates
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          data: counts,
          type: 'line'
        }]
      };

      chartInstance.setOption(option);
    },
    handleUserGrowthTimeRangeChange() {
      this.fetchUserGrowthData();
    },
    handleRecipeCountTimeRangeChange() {
      this.fetchRecipeCountData();
    }
  }
};
</script>

<style lang="scss">
.like {
  cursor: pointer;
  font-size: 25px;
  display: inline-block;
}
</style>
