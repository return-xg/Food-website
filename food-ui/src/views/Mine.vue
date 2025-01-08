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
            <span slot="title">会员中心</span>
          </el-menu-item>
          <el-menu-item index="/mine/cp">
            <span slot="title">菜谱</span>
          </el-menu-item>
          <el-menu-item index="/mine/ht">
            <span slot="title">话题</span>
          </el-menu-item>
          <el-menu-item index="/mine/rz">
            <span slot="title">日志</span>
          </el-menu-item>
          <el-menu-item index="/mine/cd">
            <span slot="title">菜单</span>
          </el-menu-item>
          <el-menu-item index="/mine/sc">
            <span slot="title">收藏</span>
          </el-menu-item>
          <el-menu-item index="/mine/zhsz">
            <span slot="title">账户设置</span>
          </el-menu-item>
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
MyHeader;
</script>

<style lang="scss" scoped>
.el-main {
  margin: 0;
  padding: 0;
}

.el-aside {
  height: calc(100vh - 45px);
  background-color: #f8f8f8;
  .el-menu {
    .el-menu-item {
      font-size: 1.1rem;
      text-align: center;
      border-bottom: 1px solid #e0e0e0;
      height: 42px;
      line-height: 42px;
    }
  }
}
</style>
