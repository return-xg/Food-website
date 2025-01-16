<template>
  <div>
    <my-header />
    <el-container>
      <el-aside width="120px">
        <el-menu
          background-color="#f8f8f8"
          :default-active="$route.path"
          active-text-color="#ff6767"
          router
        >
          <el-menu-item index="/mine/hyzx">
            <span slot="title">用户中心</span>
          </el-menu-item>
          <el-menu-item index="/mine/cp">
            <span slot="title">菜谱</span>
          </el-menu-item>
<!--          <el-menu-item index="/mine/ht">-->
<!--            <span slot="title">话题</span>-->
<!--          </el-menu-item>-->
<!--          <el-menu-item index="/mine/rz">-->
<!--            <span slot="title">日志</span>-->
<!--          </el-menu-item>-->
<!--          <el-menu-item index="/mine/cd">-->
<!--            <span slot="title">菜单</span>-->
<!--          </el-menu-item>-->
          <el-menu-item index="/mine/sc">
            <span slot="title">收藏</span>
          </el-menu-item>
<!--          <el-menu-item index="/mine/zhsz">-->
<!--            <span slot="title">账户设置</span>-->
<!--          </el-menu-item>-->
        </el-menu>
      </el-aside>
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </div>
</template>

<script>
import MyHeader from "../components/Index/MyHeader.vue";
export default {
  components: { MyHeader },
};
</script>

<style lang="scss" scoped>
.el-main {
  margin: 0;
  padding: 0;
}

.el-aside {
  height: 100vh;
  background-color: #f8f8f8;
  margin-left: 0;
  padding-left: 0;
  margin-top: 0; /* 确保菜单顶到最上面 */
  .el-menu {
    width: 120px;
    margin-left: 0;
    padding-left: 0;
    margin-top: 0; /* 确保菜单顶到最上面 */
    .el-menu-item {
      font-size: 1.1rem;
      text-align: center;
      border-bottom: 1px solid #e0e0e0;
      height: 42px;
      width: 120px;
      line-height: 42px;
      margin-top: 0; /* 确保菜单顶到最上面 */
    }
  }
}
.el-menu.el-menu--vertical{
  width: 120px;
  margin-left: 0;
  padding-left: 0;
  margin-top: 0; /* 确保菜单顶到最上面 */
}
</style>
