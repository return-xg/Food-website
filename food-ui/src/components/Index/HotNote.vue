<template>
  <div>
    <!-- 热门笔记 -->
    <!-- 完成人 -->
    <div class="w">
      <div class="hotnote">
        <div class="subnav">
          <router-link @click.native="a==true;b==1" to="/biji" class="zuo">热门笔记</router-link>
          <router-link @click.native="a==false;b=2" to="/log" class="zuo">精华日志</router-link>
          <router-link to="" class="you">全部笔记</router-link>
          <router-link to="" class="you">全部日志</router-link>
          <router-link to="" class="you">社区首页</router-link>
        </div>
        <router-view />
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      a: true,
      b:1,
      c:1
    }
  },
};
</script>
<style lang="scss" scoped>
.w {
  width: 1200px;
  margin: 0 auto;
}

.zuo{
  font-size: 20px;
  font-weight:800;
  margin-right: 10px;
}
.you{
  font-size: 20px;
  font-weight:800;
  margin-right: 10px;
  float: right;
}
.subnav {
  border-bottom: 1px solid gray;
}
.hotnote{
  display:table;
  margin-top: 40px;
}
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
