<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1" @click.native="index = 1">个人资料</el-menu-item>
      <el-menu-item index="2" @click.native="index = 2">修改密码</el-menu-item>
    </el-menu>
    <div class="shuju" v-show="index == 1">功能完善中</div>
    <div class="shuju" v-show="index == 2">功能完善中</div>
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
.el-menu-item {
  font-size: 1.2rem;
}
.shuju {
  font-size: 1.3rem;
  margin: 50px 100px;
}
</style>
