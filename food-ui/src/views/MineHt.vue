<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1">我的话题</el-menu-item>
      <el-button size="mini" type="danger">发布新话题</el-button>
    </el-menu>
    <div class="shuju">
      您还没有发布话题噢，快点击这里<a href="#">发布新话题</a>吧！
    </div>
  </div>
</template>

<script>
export default {};
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
