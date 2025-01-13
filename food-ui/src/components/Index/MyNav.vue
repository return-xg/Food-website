<template>
  <div class="nav">
    <!-- logo -->
    <div class="nav-logo">
      <img src="../../assets/loge.jpg" />
    </div>
    <!-- 导航选项 -->
    <el-row class="nav-item" align="middle" type="flex">
      <el-col :span="4">
        <router-link
          to="/index"
          :class="{ active: index == 1 }"
          @click.native="index = 1"
          >首页</router-link
        >
      </el-col>
      <el-col :span="4">
        <router-link
          to="/shipu"
          :class="{ active: index == 2 }"
          @click.native="index = 2"
          >菜谱</router-link
        >
      </el-col>
      <el-col :span="4">
        <router-link
          to="/yuanliao"
          :class="{ active: index == 3 }"
          @click.native="index = 3"
          >食材</router-link
        >
      </el-col>
      <el-col :span="4">
        <router-link
          to="/yingyang"
          :class="{ active: index == 4 }"
          @click.native="index = 4"
          >健康</router-link
        >
      </el-col>
      <el-col :span="4">
        <router-link
          to="/log"
          :class="{ active: index == 5 }"
          @click.native="index = 5"
          >专题</router-link
        >
      </el-col>
      <el-col :span="4">
        <router-link
          to="/mine"
          :class="{ active: index == 6 }"
          @click.native="index = 6"
          >我的</router-link
        >
      </el-col>
    </el-row>
    <!-- 搜索框 -->
    <div class="nav-input">
      <el-input
        placeholder="请输入内容"
        v-model="input"
        size="small"
        @keyup.13.native="goShipu"
      >
        <el-button slot="append" icon="el-icon-search" @click="goShipu"
          >搜索</el-button
        >
      </el-input>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      input: "",
      index: 1,
    };
  },
  methods: {
    goShipu() {
      // 搜索内容为空时,阻止跳转
      if (this.input.trim() == 0) {
        return;
      }
      this.$router.push(`/shipu/${this.input}`);
    },
  },
};
</script>

<style lang="scss" scoped>
.nav {
  margin: 0 auto;
  width: 1200px;
  display: flex;
  justify-content: space-between;
  .nav-logo {
    width: 20%;
    img {
      width: 80px;
    }
  }
  .nav-input {
    margin: auto 0;
    width: 25%;
    button {
      padding-left: 5px;
      padding-right: 5px;
    }
  }
  .nav-item {
    width: 40%;
    div {
      text-align: center;
      font-size: 1.3rem;

      a {
        display: inline-block;
        padding: 10px 0;
        text-decoration: none;
        color: #333333;
        &:hover {
          color: #ff6767;
        }
        &.active {
          color: #ff6767;
        }
      }
    }
  }
}
</style>
