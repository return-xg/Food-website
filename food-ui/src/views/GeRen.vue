<template>
  <div>
    <my-header />
    <div class="w">
      <div class="nav">
        <router-link to="/mydata/ziliao">个人资料</router-link>
        <router-link to="/mydata/dizhi">收货地址</router-link>
        <router-link to="/mydata/mima">修改密码</router-link>
      </div>
    </div>
    <router-view/>
  </div>
</template>

<script>

import MyHeader from '../components/Index/MyHeader.vue'
  export default {
  components: { MyHeader },
    
  }
</script>

<style lang="scss" scoped>
.w{
  width: 1200px;
  margin: 0 auto;
  padding-left: 10px;
}
.nav{
  border-bottom: 2px solid orangered;
  a{
    font-size: 20px;
    font-weight: 500;
    margin-right: 25px;
  }
}
</style>