<template>
  <div>
    <div class="w">
      <div class="d1">
        <h2>收件人</h2>
        <el-input v-model="shoujianren"></el-input>
      </div>
      <div class="d2">
        <h2>省/市/区</h2>
        <div id="app">
          <el-cascader
            size="large"
            :options="options"
            v-model="selectedOptions"
            @change="handleChange"
          >
          </el-cascader>
        </div>
      </div>
      <div class="d3">
        <h2>详细地址</h2>
        <el-input v-model="dizhi"></el-input>
      </div>
      <div class="d4">
        <h2>手机号码</h2>
        <el-input v-model="shouji"></el-input>
      </div>
      <div class="d5">
        <h2>邮政编码</h2>
        <el-input v-model="youzheng"></el-input>
      </div>
     <button class="btn">保存修改</button>
    </div>
  </div>
</template>

<script>
import {
  provinceAndCityData,
  regionData,
  provinceAndCityDataPlus,
  regionDataPlus,
  CodeToText,
  TextToCode,
} from "element-china-area-data";
export default {
  data() {
    return {
      options: regionData,
      selectedOptions: [],
      shoujianren: "",
      dizhi:"",
      shouji:"",
      youzheng:"",
    };
  },
  methods: {
    handleChange(value) {
      console.log(value);
    },
  },
};
</script>

<style lang="scss" scoped>
.w{
  width: 1200px;
  margin: 0 auto;
  padding-left: 10px;
}
h2{
  margin: 10px 0;
  font-size: 15px;
  color: #888;
}
.w>div{
  margin-top: 20px;
}
.btn{
  width: 180px;
  height: 38px;
  background: #ff6767;
  border: 1px solid #ff6767;
  font-size: 16px;
  color: white;
  border-radius: 5px;
  margin-top: 20px;
}
</style>