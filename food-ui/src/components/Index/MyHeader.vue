<template>
  <div class="my-header">
    <div class="left-header">
      <span><router-link to="/index">首页</router-link></span>
      <span><a>菜谱</a></span>
      <span><a>食材</a></span>
      <span><a>健康</a></span>
      <span><a>专题</a></span>
      <span><a>笔记</a></span>
      <span><a>社区</a></span>
      <span><a>活动</a></span>
      <span><a>搜索</a></span>
    </div>

    <div class="logrs1" v-if="$store.state.loginname">
      <div>
        <el-upload
          class="avatar-uploader"
          action="http://8.136.145.197:9000/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
        >
          <img
            v-if="imageUrl"
            :src="'http://8.136.145.197:9000/' + imageUrl"
            class="avatar"
          />
          <i v-else class="el-icon-user-solid avatar-uploader-icon"></i>
        </el-upload>
      </div>
      <div class="loname">
        欢迎：<span>{{ $store.state.loginname }}</span>
      </div>
      <button class="tuichu" @click="tuichu">退出登录</button>
    </div>
    <div class="logrs" v-else>
      <router-link to="login">登录/注册</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      imageUrl: sessionStorage.getItem("src"),
    };
  },
  mounted() {},
  methods: {
    tuichu() {
      this.$store.commit("logout");
      sessionStorage.removeItem("src");
    },
    handleAvatarSuccess(res, file) {
      // this.imageUrl = URL.createObjectURL(file.raw);
      console.log(res.data[0].filename);
      sessionStorage.setItem("src", res.data[0].filename);
      this.imageUrl = sessionStorage.getItem("src");
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
  },
};
</script>

<style scoped>
.tuichu {
  background-color: #ff7875;
  height: 30px;
  width: 90px;
  color: #fff;
  border: 0;
  border-radius: 5px;
}
.my-header {
  width: 100%;
  height: 45px;
  background-color: #333333;
  display: flex;
  justify-content: space-between;
}
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
  color: #c4c7c6;
}
.left-header span a:hover {
  color: white;
  text-decoration: none;
}
.logrs {
  width: 120px;
  height: 45px;
  display: flex;
  justify-content: space-between;
  align-items: center;
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
.logrs1 {
  width: 250px;
  height: 45px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
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
</style>
