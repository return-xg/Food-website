<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1" @click.native="index = 1">我的日志</el-menu-item>
      <el-menu-item index="2" @click.native="index = 2">待审核</el-menu-item>
      <el-menu-item index="3" @click.native="index = 3">草稿箱</el-menu-item>
      <el-button size="mini" type="danger">发布新日志</el-button>
    </el-menu>
    <div class="shuju" v-show="index == 1">
      您还没有发布新日志噢，快点击这里<a href="#">发布新日志</a>吧！
    </div>
    <div class="shuju" v-show="index == 2">您没有处于待审核的日志！</div>
    <div class="shuju" v-show="index == 3">您没有未发布的日志！</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      index: 1,
    };
  },
};
</script>

<style lang="scss" scoped>
.el-menu {
  position: relative;
}
.el-button {
  position: absolute;
  right: 50px;
  top: 15px;
  font-size: 16px;
}
.el-menu-item {
  font-size: 1.2rem;
}
.shuju {
  font-size: 1.3rem;
  margin: 50px 100px;
  color: #999ba6;
  a:hover {
    color: #ff6767;
  }
}
</style>
