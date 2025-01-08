<template>
  <div class="food-header">
    <div class="header">
      <div class="logo">
        <router-link to="/">
          <img src="../../assets/LoginTu/1.png" alt=""
        /></router-link>
        <span>食材</span>
      </div>
      <div class="header-center">
        <router-link
          to="/yuanliao"
          :class="{ active: $route.name == 'yuanliao' }"
          >食材分类</router-link
        >
        <router-link
          to="/yingyang"
          :class="{ active: $route.name == 'yingyang' }"
          >营养排行</router-link
        >
        <router-link to="/shiliao" :class="{ active: $route.name == 'shiliao' }"
          >食疗食补</router-link
        >
      </div>
      <div class="header-right">
        <el-input
          class="input-with-select"
          v-model="sos"
          @keyup.enter.native="goMose"
        >
          <el-button
            @click="ssuo"
            slot="append"
            icon="el-icon-search"
            type="info"
            >搜索</el-button
          >
        </el-input>
      </div>
    </div>
    <div class="header2">
      <router-link
        to="/"
        @click.native="data1 = 1"
        :class="{ active: data1 == 1 }"
        >首页</router-link
      >
      <router-link
        to="/fenlei/1"
        @click.native="data1 = 2"
        :class="{ active: data1 == 2 }"
        >肉禽类</router-link
      >
      <router-link
        to="/fenlei/2"
        @click.native="data1 = 3"
        :class="{ active: data1 == 3 }"
        >果品</router-link
      >
      <router-link
        to="/fenlei/3"
        @click.native="data1 = 4"
        :class="{ active: data1 == 4 }"
        >水产品</router-link
      >
      <router-link
        to="/fenlei/4"
        @click.native="data1 = 5"
        :class="{ active: data1 == 5 }"
        >蔬菜</router-link
      >
      <router-link
        to="/fenlei/5"
        @click.native="data1 = 6"
        :class="{ active: data1 == 6 }"
        >药食</router-link
      >
      <router-link
        to="/fenlei/6"
        @click.native="data1 = 7"
        :class="{ active: data1 == 7 }"
        >米面</router-link
      >
      <router-link
        to="/fenlei/6"
        @click.native="data1 = 8"
        :class="{ active: data1 == 8 }"
        >豆乳</router-link
      >
      <router-link
        to="/fenlei/7"
        @click.native="data1 = 9"
        :class="{ active: data1 == 9 }"
        >调味品</router-link
      >
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data1: 1,
      sos: "",
    };
  },
  methods: {
    ssuo() {
      this.$router.push("/sousuo/" + this.sos);
    },
    goMose() {
      const target = "/sousuo/" + this.sos;
      if (this.$route.path != target) {
        this.$router.push("/sousuo/" + this.sos);
      }
    },
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
</style>

<style src="../../assets/css/foodheader.css" scoped></style>
