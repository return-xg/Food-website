<template>
  <div>
    <div class="w">
      <div class="photo">
        <h2>头像</h2>
        <img src="../assets/LoginTu/rouqin.webp" alt="" class="tu" />
      </div>
      <div class="shangchuan">
        <input type="file" />
      </div>
      <div class="six">
        <h2>性别</h2>
        <el-radio-group v-model="radio1" size="mini" fill="#ff8d8d">
          <el-radio-button label="男" class="el1"></el-radio-button>
          <el-radio-button label="女" class="el1"></el-radio-button>
          <el-radio-button label="保密" class="el1"></el-radio-button>
        </el-radio-group>
      </div>
      <div class="dizhi">
        <h2>家乡</h2>
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
      <div class="email">
        <h2>电子邮件</h2>
        <el-input v-model="email"></el-input>
      </div>
      <div class="qianming">
        <h2>个人签名</h2>
        <el-input v-model="qianming"></el-input>
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
      radio1: "男",
      email: "",
      qianming: "",
      options: provinceAndCityData,
      selectedOptions: [],
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
.w {
  width: 1200px;
  margin: 0 auto;
  padding-left: 10px;
}
h2 {
  margin: 10px 0;
  font-size: 15px;
  color: #888;
}
.photo > img {
  width: 120px;
  height: 120px;
}
.shangchuan input {
  font-size: 14px;
  margin: 8px 0;
  border: 1px solid gray;
  height: 24px;
  line-height: 24px;
  padding: 3px 0;
}
.el1 {
  margin-right: 10px;
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