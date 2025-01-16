<template>
  <div>
    <div class="w">
      <div class="foot">
        <div class="foot1">
          <router-link to="#">食光趣享 - 让吃更美好</router-link>
        </div>
        <div class="foot2">
<!--          <router-link to="">关于我们·</router-link>-->
<!--          <router-link to="">联系我们·</router-link>-->
<!--          <router-link to="">加入我们·</router-link>-->
<!--          <router-link to="">服务声明·</router-link>-->
<!--          <router-link to="">友情链接·</router-link>-->
<!--          <router-link to="">网站地图·</router-link>-->
        </div>
        <div class="foot3">
          <span>友情链接：</span>&nbsp;
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
      </div>
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
}
.foot{
  border-top: 1px solid orangered;
}
.foot1 :first-child{
  display: inline-block;
  color: orangered;
  font-size: 14px;
  font-weight: 700;
  margin:20px 0 20px 0;
}
.foot1 > img {
  display: inline-block;
  width: 200px;
  height: 80px;
  position: absolute;
  right: 300px;
}
.foot2{
  font-size: 12px;
  font-weight: 500;
  margin-bottom: 20px;
}
.foot3{
font-size: 12px;
  font-weight: 500;
  margin-bottom: 20px;
  width: 710px;
  a{
    flex-wrap:wrap;
    display: inline-block;
    margin-top: 5px;
    margin-right: 11px;
  }
}
.foot4{
  position: relative;
  margin-bottom: 10px;
  span{
    font-size: 12px;
    font-weight: 500;
  }
}
.jing{
  width: 70px;
  height: 30px;
  position: absolute;
  right: 230px;
  top: -15px;
}
</style>
