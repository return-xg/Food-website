<template>
  <div>
    <!-- 统计信息部分 -->
    <div class="statistic-container">
      <el-row :gutter="200">
        <el-col :span="9">
          <div class="statistic-item">
            <el-statistic
                group-separator=","
                :precision="0"
                :value="value1"
                :title="title1"
            ></el-statistic>
          </div>
        </el-col>
        <el-col :span="9">
          <div class="statistic-item">
            <el-statistic
                group-separator=","
                :precision="0"
                :value="value2"
                :title="title2"
            ></el-statistic>
          </div>
        </el-col>
        <el-col :span="9">
          <div class="statistic-item">
            <el-statistic
                group-separator=","
                :precision="0"
                decimal-separator="."
                :value="value3"
                :title="title3"
            ></el-statistic>
          </div>
        </el-col>
      </el-row>
    </div>

    <div>
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
  </div>
</template>

<script>
import {getRecipeCountByDate, getUserGrowthByDate, userNum, recipeNum, reviewNum} from '@/api/recipe/recipe.js';
import * as echarts from 'echarts'; // 引入ECharts

export default {
  data() {
    return {
      like: true,
      value1: null,
      value2: null,
      value3: null,
      title1: "用户量",
      title2: "食谱收录量",
      title3: "互动量",
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
    this.fetchStatisticsData(); // 调用获取统计数据的方法
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
        const response = await getUserGrowthByDate({timeRange: this.userGrowthTimeRange});
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
        const response = await getRecipeCountByDate({timeRange: this.recipeCountTimeRange});
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
    },
    async fetchStatisticsData() {
      try {
        const userNumResponse = await userNum();
        const recipeNumResponse = await recipeNum();
        const reviewNumResponse = await reviewNum();

        this.value1 = userNumResponse;

        this.value2 = recipeNumResponse;

        this.value3 = reviewNumResponse;
      } catch (error) {
        console.error('请求统计数据时出错:', error);
      }
    }
  }
};
</script>

<style lang="scss">
.statistic-container {
  display: flex;
  justify-content: center; /* 修改为居中对齐 */
}

.statistic-container .el-row {
  display: flex;
  justify-content: space-between;
}

.statistic-container .el-col {
  flex: 1;
  max-width: 33.33%; // 确保每列占据三分之一的宽度
  box-sizing: border-box; // 确保内边距和边框不会影响宽度
}

.statistic-item {
  width: 100px;
  text-align: center;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
}
</style>
