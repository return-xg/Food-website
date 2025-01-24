<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1" @click.native="index = 1"
        >我收藏的菜谱</el-menu-item>

    </el-menu>
    <div class="shuju" v-show="index == 1">您还没有收藏任何菜谱。</div>

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
