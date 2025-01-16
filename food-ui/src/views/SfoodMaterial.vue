<template>
  <div>
    <food-header />
    <div class="header">
      <h1>{{sc}}</h1>
      <span>为你介绍{{sc}}营养与选购，以及{{sc}}的做法</span>
    </div>
    <div class="center">
      <div class="center-left">
        <div class="tap-header">
          <div class="tap-left">
            <router-link
              @click.native="
                a = true;
                b = 1;
              "
              :class="{ active: b == 1 }"
              :to="`/sfoodMaterial/${sc}/jiucai`"
              >{{sc}}的做法</router-link
            >
            <router-link
              @click.native="
                a = false;
                b = 2;
              "
              :class="{ active: b == 2 }"
              :to="`/sfoodMaterial/${sc}/tiyan`"
              >认识与选购</router-link
            >
            <router-link
              :to="`/sfoodMaterial/${sc}/yiji`"
              @click.native="
                a = false;
                b = 3;
              "
              :class="{ active: b == 3 }"
              >食用宜忌</router-link
            >
            <router-link
              @click.native="
                a = false;
                b = 4;
              "
              :to="`/sfoodMaterial/${sc}/useful`"
              :class="{ active: b == 4 }"
              >营养功效</router-link
            >
          </div>
          <div class="tap-right" v-if="a">
            <router-link
              @click.native="c = 1"
              :class="{ active: c == 1 }"
              :to="`/sfoodMaterial/${sc}/jiucai`"
              >最优</router-link
            >
            <router-link
              @click.native="c = 2"
              :class="{ active: c == 2 }"
              :to="`/sfoodMaterial/${sc}/new`"
              >最新</router-link
            >
          </div>
        </div>
        <router-view />
      </div>

      <div class="center-right">
        <div class="right-top" v-if="$route.path == '/sfoodMaterial/useful'">
          <a href="#">{{sc}}的营养成分</a>
        </div>
        <div class="table-cf" v-if="$route.path == '/sfoodMaterial/useful'">
          <ul>
            <li><a href="#">热量</a><span>26大卡</span></li>
            <li><a href="#">胡萝卜素</a><span>1410微克</span></li>
            <li><a href="#">钾</a><span>247毫克</span></li>
            <li><a href="#">维生素A</a><span>235毫克</span></li>
            <li><a href="#">叶酸</a><span>61.2毫克</span></li>
            <li><a href="#">钙</a><span>42毫克</span></li>
            <li><a href="#">磷</a><span>38毫克</span></li>
            <li><a href="#">镁</a><span>25毫克</span></li>
            <li><a href="#">维生素C</a><span>24毫克</span></li>
            <li><a href="#">钠</a><span>8.1毫克</span></li>
            <li><a href="#">碳水化合物</a><span>4.6毫克</span></li>
            <li><a href="#">蛋白质</a><span>2.4毫克</span></li>
            <li><a href="#">铁</a><span>1.4毫克</span></li>
            <li><a href="#">膳食纤维</a><span>1.38毫克</span></li>
            <li><a href="#">硒</a><span>0.96毫克</span></li>
            <li><a href="#">维生素E</a><span>0.8毫克</span></li>
            <li><a href="#">烟酸</a><span>0.43毫克</span></li>
            <li><a href="#">锰</a><span>0.4克</span></li>
            <li><a href="#">锌</a><span>0.2毫克</span></li>
            <li><a href="#">脂肪</a><span>0.09毫克</span></li>
            <li><a href="#">维生素B6</a><span>0.08毫克</span></li>
            <li><a href="#">维生素B2</a><span>0.02毫克</span></li>
            <li><a href="#">铜</a><span>0.08毫克</span></li>
            <li><a href="#">维生素B1</a><span>0.02毫克</span></li>
            <li><a href="#">维生素B12</a><span>0</span></li>
            <li><a href="#">胆固醇</a><span>0</span></li>
            <li><a href="#">碘</a><span>0</span></li>
          </ul>
        </div>

        <div class="right-bottom">
          <a href="#">您可能还喜欢的食材</a>
        </div>
        <div class="table-ul">
          <ul>
            <li><router-link to="/sfoodmaterial/白菜/jiucai">白菜</router-link></li>
            <li><router-link to="/sfoodmaterial/油菜/jiucai">油菜</router-link></li>
            <li><router-link to="/sfoodmaterial/芹菜/jiucai">芹菜</router-link></li>
            <li><router-link to="/sfoodmaterial/菠菜/jiucai">菠菜</router-link></li>
            <li><router-link to="/sfoodmaterial/蒜苗/jiucai">蒜苗</router-link></li>
            <li><router-link to="/sfoodmaterial/虾/jiucai">虾</router-link></li>
            <li><router-link to="/sfoodmaterial/青椒/jiucai">青椒</router-link></li>
            <li><router-link to="/sfoodmaterial/生菜/jiucai">生菜</router-link></li>
            <li><router-link to="/sfoodmaterial/茼蒿/jiucai">茼蒿</router-link></li>
            <li><router-link to="/sfoodmaterial/香菜/jiucai">香菜</router-link></li>
            <li><router-link to="/sfoodmaterial/豆苗/jiucai">豆苗</router-link></li>
            <li><router-link to="/sfoodmaterial/芦笋/jiucai">芦笋</router-link></li>
            <li><router-link to="/sfoodmaterial/苋菜/jiucai">苋菜</router-link></li>
            <li><router-link to="/sfoodmaterial/芥菜/jiucai">芥菜</router-link></li>
            <li><router-link to="/sfoodmaterial/莴笋/jiucai">莴笋</router-link></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 底部 -->
    <div class="w">
      <div class="footer">
        <div class="foot1">
          <span>食光趣享 - 让吃更美好!</span>
        </div>
        <div class="foot2">
          <ul>
<!--            <li><a href="" target="_blank">关于我们·</a></li>-->
<!--            <li><a href="" target="_blank">联系我们·</a></li>-->
<!--            <li><a href="" target="_blank">加入我们·</a></li>-->
<!--            <li><a href="" target="_blank">服务声明·</a></li>-->
<!--            <li><a href="" target="_blank">友情链接·</a></li>-->
<!--            <li><a href="" target="_blank">网站地图</a></li>-->
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
  data() {
    return {
      a: true,
      b: 1,
      c: 1,
    };
  },
  mounted() {
    console.log(this.sc);
  },
  props: ["sc"],
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
.header {
  width: 996px;
  margin: 10px auto;
}
.header > h1 {
  font-size: 25px;
  font-weight: 800;
}
.header > span {
  display: block;
  padding: 10px 0;
  color: #999;
  font-size: 12px;
}
.center {
  width: 996px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}
.center-left {
  width: 640px;
}
.tap-header {
  width: 640px;
  height: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.tap-left {
  width: 400px;
  font-size: 18px;
}
.tap-left a {
  margin: 0px 10px;
}
.tap-left a:nth-child(1) {
  margin-left: 0 !important;
}

.tap-left a.active {
  color: #ff6767;
}
.tap-right {
  width: 90px;
}
.tap-right a {
  margin: 0 10px;
}
.tap-right a.active {
  color: #ff6767;
}
.center-right {
  width: 330px;
}
.right-top {
  width: 302px;
  height: 50px;
  border-bottom: 2px solid #ff6767;
  display: flex;
  align-items: center;
}
.right-top a {
  color: #ff6767;
  font-size: 18px;
}
.table-cf {
  width: 330px;
  margin-bottom: 10px;
}
.table-cf ul {
  width: 302px;
  height: 554px;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  align-content: flex-start;
}
.table-cf ul > li {
  display: flex;
  padding: 10px 0;
  justify-content: space-between;
  width: 150px;
  border-bottom: 1px dashed #eee;
}
.table-cf ul > li span {
  color: #999;
  font-size: 14px;
}
.table-cf ul > li a {
  font-size: 14px;
}
.table-cf ul > li:nth-child(2n-1) {
  border-right: 1px dashed #eee;
}
.right-bottom {
  width: 330px;
  height: 50px;
  border-bottom: 2px solid #ff6767;
  display: flex;
  align-items: center;
}
.right-bottom a {
  color: #ff6767;
  font-size: 18px;
}

.table-ul {
  margin-top: 20px;
  width: 330px;
  height: 255px;
}
.table-ul ul {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.table-ul li {
  margin-bottom: 15px;
  width: 88px;
  display: block;
  border: 1px solid #eee;
  line-height: 34px;
  font-size: 16px;
  text-align: center;
}
.table-ul li:hover {
  border: 1px solid #ff6767;
}
</style>
