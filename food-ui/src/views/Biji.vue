<template>
  <div>
    <div class="hot" v-for="i in 4" :key="i">
        <div class="user">
          <img src="/image/1.jpg" alt="" />
          <div class="name" style="display:inline-block">
            <span>沙尔贝贝</span>
            <span>8小时前</span>
          </div>
        </div>
        <div class="content">
          <div>#早餐# 早上好！宝宝们</div>
          <img src="/image/1.jpg" />
          <img src="/image/1.jpg" />
          <img src="/image/1.jpg" />
          <img src="/image/1.jpg" />
          <span>10个喜欢, 11条评论</span>
        </div>
      </div>
  </div>
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
.hot{
  width: 450px;
  height: 230px;
  float: left;
  margin: 20px 50px 0 50px;
  // display: flex;
  // justify-content: space-between;
}
.user img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin: 0 10px 0 0;
}
.name span{
  display: block;
}
.name :first-child{
  color: black;
  font-size: 16px;
  margin-bottom: 5px;
}
.name :last-child{
  color: grey;
  font-size: 10px;
}

.content div {
  display: block;
  margin: 10px 0 10px 5px;
}
.content img {
  width: 100px;
  height: 100px;
  margin-right: 5px;
  float: left;
}
.content span {
  clear: both;
  float: left;
  margin: 10px 0 10px 0;
  font-size: 12px;
  color: gray;
  line-height: 100%;
}
</style>