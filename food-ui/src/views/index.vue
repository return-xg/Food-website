<template>
  <div>
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
  </div>
  <div>
    <el-row :gutter="20">
      <el-col :span="24">
        <div>
          <el-select style="width: 120px" v-model="timeRange" placeholder="请选择时间范围" @change="fetchUserGrowthData">
            <el-option label="全部" value="all"></el-option>
            <el-option label="最近半年" value="halfYear"></el-option>
            <el-option label="最近一个月" value="oneMonth"></el-option>
            <el-option label="最近一周" value="oneWeek"></el-option>
          </el-select>
        </div>
        <div ref="chart" style="width: 100%; height: 400px;"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getUserGrowthByDate } from '@/api/recipe/recipe.js';
import * as echarts from 'echarts'; // 引入ECharts

export default {
  data() {
    return {
      like: true,
      value1: 4154.564,
      value2: 1314,
      title: "增长人数",
      timeRange: 'all',
      chartInstance: null,
    };
  },
  mounted() {
    this.initChart();
    this.fetchUserGrowthData();
  },
  methods: {
    initChart() {
      this.chartInstance = echarts.init(this.$refs.chart);
    },
    async fetchUserGrowthData() {
      const response = await getUserGrowthByDate({ timeRange: this.timeRange });
      if (response.code === 200) {
        this.renderChart(response.data);
      }
    },
    renderChart(data) {
      const dates = data.map(item => item.date);
      const userCounts = data.map(item => item.user_count);

      const option = {
        title: {
          text: '用户增长趋势'
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
          data: userCounts,
          type: 'line'
        }]
      };

      this.chartInstance.setOption(option);
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
