<template>
  <div class="food-header">
    <my-header />
    <div class="header">
      <div class="logo">
        <router-link to="/common/index"> <img src="../assets/loge.jpg" /></router-link>
        <span>食谱</span>
      </div>
    </div>
    <div class="header2">
      <router-link to="/ShiPu" @click.native="data = 1" :class="{ active: data == 1 }"
      >默认排序</router-link
      >
      <router-link to="shipu2" @click.native="data = 3" :class="{ active: data == 3 }"
      >按人气</router-link
      >
      <router-link to="shipu3" @click.native="data = 4" :class="{ active: data == 4 }"
      >按热度</router-link
      >
    </div>
    <seniority :aaa="mname" />
  </div>
</template>

<script>
import Seniority from "../components/Index/Seniority.vue";
import MyHeader from "@/components/Index/MyHeader.vue";

export default {
  components: {MyHeader, Seniority },
  data() {
    return {
      mname: "",
      input: "",
      data: 1,
    };
  },
  mounted() {
    console.log(this.$route.name);
  },
};
</script>

<style lang="scss" scoped></style>
<style>
.food-header {
  user-select: none;
}
.el-input__inner {
  height: 25px !important;
}

.header {
  width: 990px;
  height: 60px;
  margin: 0 auto;
  padding-top: 10px;
  display: flex;
  justify-content: space-between;
}
.logo {
  width: 160px;
  height: 50px;
}
.logo img {
  width: 50px;
  height: 45px;
  vertical-align: middle;
  margin-right: 10px;
}
.logo > span {
  display: inline-block;
  width: 40px;
  line-height: 20px;
  border-radius: 4px;
  background-color: #ff838b;
  color: #fff;
  text-align: center;
  font-weight: 800;
}

.header-center {
  width: 280px;
  line-height: 45px;
  text-align: center;
  margin-left: 200px;
}
.header-center > a {
  margin: 0 10px;
  color: #464746;
  font-size: 16px;
  font-weight: 800;
  text-decoration: none;
}
.header-right {
  width: 250px;
  height: 30px;
  margin-top: 10px;
  display: flex;
  align-items: center; /* 垂直居中对齐 */
}
.header-center > a.active {
  color: #ff8da6;
}
.header2 {
  width: 1000px;
  height: 40px;
  border-top: 1px solid red;
  border-bottom: 1px solid red;
  margin: 5px auto 0;
  padding: 10px 20px;
}
.header2 > a {
  color: #333;
  font-size: 14px;
  margin: 0 10px;
  text-decoration: none;
}
.header2 > a.active {
  color: #ff8da6;
}
.input-with-select {
  height: 30px;
  right: 10px;
}
.button {
  height: 30px;
}
</style>
