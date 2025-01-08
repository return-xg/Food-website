<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1" @click.native="index = 1"
        >我收藏的菜谱</el-menu-item
      >
      <el-menu-item index="2" @click.native="index = 2">话题</el-menu-item>
      <el-menu-item index="3" @click.native="index = 3">日志</el-menu-item>
      <el-menu-item index="4" @click.native="index = 4">菜单</el-menu-item>
      <el-menu-item index="5" @click.native="index = 5">专题</el-menu-item>
    </el-menu>
    <div class="shuju" v-show="index == 1">您还没有收藏任何菜谱。</div>
    <div class="shuju" v-show="index == 2">您还没有收藏任何话题。</div>
    <div class="shuju" v-show="index == 3">您还没有收藏任何日志。</div>
    <div class="shuju" v-show="index == 4">您还没有收藏任何菜单。</div>
    <div class="shuju" v-show="index == 5">您还没有收藏任何专题。</div>
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
  color: #999ba6;
}
</style>
