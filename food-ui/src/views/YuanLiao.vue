<template>
  <div>
    <food-header />
    <div class="center-nei">
      <div class="center-nei-left"><router-link to="/fenlei/1">肉禽类</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/2">果品类</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/3">水产品类</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/4">蔬菜类</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/5">药食</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/6">米面</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/7">豆乳</router-link></div>
      <div class="center-nei-left"><router-link to="/fenlei/8">调味品</router-link></div>
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
import FoodHeader from "@/components/Index/FoodHeader.vue";
export default {
  components: { FoodHeader },
};
</script>

<style lang="scss" scoped>
.w {
  width: 990px;
  margin: 0 auto;
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
  left: 700px;
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
.center-nei {
  width: 990px;
  height: 600px;
  margin: 50px auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.center-nei-left:nth-child(1) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/rouqin.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(1):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(2) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/guopin.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(2):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(3) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/shuichanpin.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(3):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(4) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/shucai.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(4):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(5) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/yaoshi.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(5):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(6) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/mimian.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(6):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(7) {
  width: 220px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url("../assets/LoginTu/douru.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(7):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left:nth-child(8) {
  width: 220px;
  height: 280px;
  display: flex;
  justify-content: center;
  align-items:center;
  background: url("../assets/LoginTu/tiaowei.webp") no-repeat;
  background-size: 100% 100%;
  transition: 0.3s;
}
.center-nei-left:nth-child(8):hover {
  transform:translate(0,-5px);
  box-shadow: 1px 4px 5px #666;
}


.center-nei-left > a {
  width: 186px;
  line-height: 40px;
  text-align: center;
  font-size: 25px;
  color: #fff;
  font-weight: 800;
  background-color: rgb(46, 54, 46,0.7);
}
</style>
