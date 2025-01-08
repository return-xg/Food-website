<template>
  <div>
    <div class="w">
      <div class="d1">
        <h2>当前密码</h2>
        <el-input v-model="oldmima"></el-input>
      </div>
      <div class="d2">
        <h2>新密码</h2>
        <el-input v-model="newmima"></el-input>
      </div>
      <div class="d3">
        <h2>确认密码</h2>
        <el-input v-model="newmima"></el-input>
      </div>
      <button class="btn">保存修改</button>
    </div>
  </div>
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
.w{
  width: 1200px;
  margin: 0 auto;
  padding-left: 10px;
}
h2{
  margin: 10px 0;
  font-size: 15px;
  color: #888;
}
.w>div{
  margin-top: 20px;
}
.btn{
  width: 180px;
  height: 38px;
  background: #ff6767;
  border: 1px solid #ff6767;
  font-size: 16px;
  color: white;
  border-radius: 5px;
  margin-top: 20px;
}
</style>