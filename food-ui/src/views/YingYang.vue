<template>
  <div>
    <food-header/>

    <div class="center-nei">
      <div class="center-nei-left">
        <h3>矿物质</h3>
      </div>
      <div class="center-nei-right">
        <table border="1px"  width="804px" height="300px" cellspacing="0px">
          <tr>
            <td><a href="">钙</a></td>
            <td><a href="">铁</a></td>
            <td><a href="">磷</a></td>
            <td><a href="">钾</a></td>
            <td><a href="">钠</a></td>
            <td><a href="">碘</a></td>
          </tr>
          <tr>
            <td><a href="">能量</a></td>
            <td><a href="">镁</a></td>
            <td><a href="">锌</a></td>
            <td><a href="">硒</a></td>
            <td><a href="">蛋白质</a></td>
            <td><a href="">铜</a></td>
          </tr>
          <tr>
            <td><a href="">氟</a></td>
            <td><a href="">脂肪</a></td>
            <td><a href="">氯</a></td>
            <td><a href="">硫</a></td>
            <td><a href="">锰</a></td>
            <td><a href="">钼</a></td>
          </tr>
          <tr>
            <td><a href="">铬</a></td>
            <td><a href="">钴</a></td>
            <td><a href="">硼</a></td>
            <td><a href="">钒</a></td>
            <td><a href="">碳水化物</a></td>
          </tr>
        </table>
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
import FoodHeader from '@/components/Index/FoodHeader.vue'
  export default {
  components: { FoodHeader },

  }
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
.center-nei{
  width: 990px;
  height: 300px;
  margin: 50px auto;
  display: flex;
}
.center-nei-left{
  width: 186px;
  height: 300px;
  display: flex;
  align-items: center;
  background-color: #f8f8f8;
  border:1px solid #eaeaea;
}
.center-nei-left>h3{
  width: 186px;
  height: 40px;
  text-align: center;
  font-size:25px;
  color:#666;
  font-weight: 800;
}
.center-nei-right{
  width: 804px;
  height: 300px;
}
.center-nei-right td{
  text-align:center;
  width: 133px;
  height: 70px;
}
.center-nei-right td:hover{
  background-color: #f8f8f8;
}
.center-nei-right td a{
  font-size:20px;
  font-weight: 800;
}
</style>
