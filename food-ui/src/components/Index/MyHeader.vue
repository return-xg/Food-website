<template>
  <div class="navbar">
    <div class="right-menu">
      <div class="left-header">
        <span><router-link to="/common/index">首页</router-link></span>
        <span><router-link to="/ShiPu">食谱</router-link></span>
        <span><a>食材</a></span>
        <span><a>健康</a></span>
        <span><a>专题</a></span>
        <span><a>笔记</a></span>
        <span><a>社区</a></span>
        <span><a>活动</a></span>
      </div>
<!--      自带搜索按钮-->
<!--      <template v-if="appStore.device !== 'mobile'">-->
<!--        <header-search id="header-search" class="right-menu-item" />-->
<!--      </template>-->
      <div class="avatar-container">
        <el-dropdown @command="handleCommand" class="right-menu-item hover-effect" trigger="click">
          <div class="avatar-wrapper">
            <img :src="userStore.avatar" class="user-avatar" />
            <el-icon><caret-bottom /></el-icon>
          </div>
          <template #dropdown>
            <el-dropdown-menu>
              <router-link to="/mine">
                <el-dropdown-item>个人中心</el-dropdown-item>
              </router-link>
              <el-dropdown-item divided command="logout">
                <span>退出登录</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ElMessageBox } from 'element-plus'
import useAppStore from '@/store/modules/app'
import useUserStore from '@/store/modules/user'
import useSettingsStore from '@/store/modules/settings'

const appStore = useAppStore()
const userStore = useUserStore()
const settingsStore = useSettingsStore()

function toggleSideBar() {
  appStore.toggleSideBar()
}

function handleCommand(command) {
  switch (command) {
    case "setLayout":
      setLayout();
      break;
    case "logout":
      logout();
      break;
    default:
      break;
  }
}

function logout() {
  ElMessageBox.confirm('确定注销并退出系统吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    userStore.logOut().then(() => {
      location.href = '/index';
    })
  }).catch(() => { });
}

const emits = defineEmits(['setLayout'])
function setLayout() {
  emits('setLayout');
}

function toggleTheme() {
  settingsStore.toggleTheme()
}
</script>

<style lang='scss' scoped>

.left-header span {
  width: 500px;
  height: 45px;
}

.left-header span {
  width: 20px;
  padding: 15px;
  height: 45px;
  line-height: 45px;
  font-size: 14px;
}
.left-header span a {
  color: #0a0a0a;
}
.left-header span a:hover {
  color: white;
  text-decoration: none;
}

.logrs div {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
}
.logrs a {
  background-color: #f1f1f1;
  height: 30px;
  text-align: center;
  line-height: 30px;
  font-size: 14px;
  width: 75px;
  border-radius: 4px;
  color: #666;
  text-decoration: none;
}

.logrs1 div:first-child {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.loname {
  font-size: 14px;
  color: #fff;
  margin: 0 20px;
}

.avatar-uploader {
  background: #fff;
}
.avatar-uploader .el-upload {
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 18px;
  color: #8c939d;
  width: 40px;
  height: 40px;
  line-height: 40px;
  text-align: center;
}
.avatar {
  width: 40px;
  height: 40px;
  display: block;
}







.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: var(--navbar-bg);
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background 0.3s;
    -webkit-tap-highlight-color: transparent;

    &:hover {
      background: rgba(0, 0, 0, 0.025);
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .topmenu-container {
    position: absolute;
    left: 50px;
  }

  .errLog-container {
    display: inline-block;
    vertical-align: top;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;
    display: flex;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: var(--navbar-text);
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background 0.3s;

        &:hover {
          background: rgba(0, 0, 0, 0.025);
        }
      }

      &.theme-switch-wrapper {
        display: flex;
        align-items: center;

        svg {
          transition: transform 0.3s;

          &:hover {
            transform: scale(1.15);
          }
        }
      }
    }

    .avatar-container {
      margin-right: 40px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        i {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}
</style>
