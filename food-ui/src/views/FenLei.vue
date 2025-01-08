<template>
  <div class="food-header">
    <div class="header">
      <div class="logo">
        <router-link to="/">
          <img src="../assets/LoginTu/1.png" alt=""
        /></router-link>
        <span>食材分类</span>
      </div>
    </div>
    <div class="header2">
      <router-link to="/">首页</router-link>
      <router-link
        to="/fenlei/1"
        :class="{ active: this.$route.params.fl == '1' }"
        >肉禽类</router-link
      >
      <router-link
        to="/fenlei/2"
        :class="{ active: this.$route.params.fl == '2' }"
        >果品</router-link
      >
      <router-link
        to="/fenlei/3"
        :class="{ active: this.$route.params.fl == '3' }"
        >水产类</router-link
      >
      <router-link
        to="/fenlei/4"
        :class="{ active: this.$route.params.fl == '4' }"
        >蔬菜类</router-link
      >
      <router-link
        to="/fenlei/5"
        :class="{ active: this.$route.params.fl == '5' }"
        >药食</router-link
      >
      <router-link
        to="/fenlei/6"
        :class="{ active: this.$route.params.fl == '6' }"
        >米面</router-link
      >
      <router-link
        to="/fenlei/7"
        :class="{ active: this.$route.params.fl == '7' }"
        >豆乳</router-link
      >
      <router-link
        to="/fenlei/8"
        :class="{ active: this.$route.params.fl == '8' }"
        >调味品</router-link
      >
    </div>

    <div class="center-lei clear" v-if="data">
      <div class="center-lei-nei" v-for="(item,i) in data.data" :key="i">
        <router-link :to="`/sfoodmaterial/${item.iname}/jiucai`">{{ item.iname }}</router-link>
      </div>
    </div>

      <!-- 底部 -->
    <div class="w">
      <div class="footer">
        <div class="foot1">
          <span>美食天下 - 让吃更美好!</span>
          <img src="../assets/LoginTu/mobile.png" alt="" />
        </div>
        <div class="foot2">
          <ul>
            <li><a href="" target="_blank">关于我们·</a></li>
            <li><a href="" target="_blank">联系我们·</a></li>
            <li><a href="" target="_blank">加入我们·</a></li>
            <li><a href="" target="_blank">服务声明·</a></li>
            <li><a href="" target="_blank">友情链接·</a></li>
            <li><a href="" target="_blank">网站地图</a></li>
          </ul>
        </div>
        <div class="foot3">
          <span>友情链接：</span>
          <a href="https://www.yuyuemama.com/" target="_blank">愉悦妈妈</a>
          <a href="http://www.zul.cn/" target="_blank">自游乐</a>
          <a href="https://life.iqiyi.com/" target="_blank">爱奇艺生活</a>
          <a href="https://www.zhms.cn/" target="_blank">中华美食网</a>
          <a href="https://www.pcbaby.com.cn/" target="_blank">太平洋亲子网</a>
          <a href="http://www.canyin88.com/" target="_blank">红餐网</a>
          <a href="https://www.mama.cn/" target="_blank">妈妈网</a>
          <a href="http://www.qqbaobao.com/" target="_blank">亲宝网</a>
          <a href="https://www.city8.com/" target="_blank">中国地图</a>
          <a href="http://www.39yst.com/" target="_blank">民福康健康</a>
          <a href="http://www.boqii.com/" target="_blank">波奇网</a>
          <a href="https://www.258jituan.com/" target="_blank">企业服务平台</a>
          <a href="http://www.cy8.com.cn/" target="_blank">餐饮杰</a>
        </div>
        <div class="foot4">
          <p>
            版权所有 © 2004-2022美食天下 保留所有权利-
            <img src="" />
            京公网安备11010502031041号/京ICP证090244号/京ICP备10020153号
          </p>
          <img src="../assets/LoginTu/cyberpolice.gif" alt="" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["fl"],
  data() {
    return {
      data: "",
    };
  },
  mounted() {
    this.fenlei()
  },
  methods:{
    fenlei(){
    let url = `http://8.136.145.197:3000/ingredient/lei?classification=${this.fl}`;
    console.log(url);
    this.axios.get(url).then((res) => {
      console.log(res);
      this.data = res.data;
    });
    }
  },
  watch:{
    fl(){
      this.fenlei()
    }
  }
};
</script>

<style lang="scss" scoped>
.w {
  width: 990px;
  margin: 100px auto 0px;
}
.footer {
  border-top: 1px solid gray;
  margin: 10px 0 20px 0;
}
.foot1 {
  position: relative;
}
.foot1 > span {
  color: #ff5500;
  font-size: 14px;
  font-weight: 900;
}
.foot1 > img {
  display: inline-block;
  width: 200px;
  height: 80px;
  position: absolute;
  left: 710px;
}
.foot2 > ul {
  display: flex;
  flex-direction: row;
  margin-top: 15px;
  margin-bottom: 20px;
}
.foot3 {
  width: 710px;
}
.foot3 > a {
  flex-wrap: wrap;
  margin: 0px 5px 0 10px;
  margin-top: 5px;
}
.foot4 {
  margin-top: 20px;
  position: relative;
}
.foot4 > img {
  display: block;
  width: 70px;
  margin: 30px;
  position: absolute;
  left: 670px;
  top: -40px;
}
a {
  color: black;
}
a:hover {
  color: orangered;
}

</style>
<style scoped>
.clear::before,.clear::after{
  content: '';
  display: table;
  clear: both;
}
.header {
  width: 990px;
  height: 60px;
  margin: 0 auto;
  padding-top: 10px;
  display: flex;
  justify-content: space-between;
}
.logo {
  width: 500px;
  height: 50px;
}
.logo img {
  width: 100px;
  height: 50px;
  vertical-align: middle;
  margin-right: 10px;
}
.logo > span {
  display: inline-block;
  width: 60px;
  line-height: 25px;
  border-radius: 4px;
  background-color: #ff838b;
  color: #fff;
  text-align: center;
  font-weight: 800;
}

.header2 {
  width: 950px;
  height: 15px;
  border-top: 1px solid red;
  border-bottom: 1px solid red;
  margin: 5px auto 0;
  padding: 10px 20px;
}
.header2 > a {
  color: #333;
  font-size: 14px;
  margin: 0 10px;
  text-decoration: none;
}
.header2 > a.active {
  color: #ff8da6;
}

.center-lei {
  width: 996px;
  margin: 40px auto;
}
.center-lei-nei {
  width: 100px;
  line-height: 60px;
  border: 1px solid #eee;
  margin: 5px 20px 10px 20px;
  float: left;
  text-align: center;
  font-size: 20px;
  border-radius: 2px;
  transition: 0.3s;
}
.center-lei-nei:hover {
  background-color: #f8f8f8;
  transform: translate(0px, -5px);
}
</style>
