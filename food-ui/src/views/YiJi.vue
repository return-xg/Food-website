<template>
  <div>
    <div class="center-nei">
      <p>食材宜忌仅供参考，请勿用于疾病治疗。</p>
      <div class="center-neirong">
        <h1><i></i> 宜与韭菜搭配的食材</h1>
        <div class="center-bottom">
          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#">鸡蛋</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>补肾行气</p>
          </div>

          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#">鹌鹑蛋</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>缓解肾虚腰痛阳痿</p>
          </div>

          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#">基围虾</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>补益肝肾的作用</p>
          </div>

          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#"> 明虾</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>补益肝肾的作用</p>
          </div>
          
          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#"> 北极虾</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>补益肝肾的作用</p>
          </div>

          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#"> 海虾</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>补益肝肾的作用</p>
          </div>

          <div class="center-bottom-1">
            <div class="center-bottom-1-1">
              <div><span>+</span><a href="#"> 青鱼</a></div>
              <a href="#">查看菜谱</a>
            </div>
            <p>治疗脚气</p>
          </div>


        </div>
      </div>


      <div class="center-neirong-2">
        <h1><i></i> 忌与韭菜搭配的食材</h1>
        <div class="center-top">
          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">牛奶</a></div>
            </div>
            <p>牛奶中含钙。牛奶与含草酸多的韭菜混合食用,就会影响钙的吸收。</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">蜂蜜</a></div>
            </div>
            <p>同食会阻碍血液循环。</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">鸡蛋</a></div>
            </div>
            <p>补肾行气</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">牛排</a></div>
            </div>
            <p>同食容易中毒。</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">牛肉</a></div>
            </div>
            <p>中毒</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">牛里脊</a></div>
            </div>
            <p>中毒</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">菠菜</a></div>
            </div>
            <p>腹泻</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">蒜薹</a></div>
            </div>
            <p>影响消化</p>
          </div>

          <div class="center-top-1">
            <div class="center-top1-1">
              <div><span>+</span><a href="#">虾皮</a></div>
            </div>
            <p>影响营养的吸收</p>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props:["sc"]
};
</script>

<style lang="scss" scoped></style>
<style scoped>
.center-nei {
  width: 640px;
  margin-top: 10px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.center-nei {
  font-size: 14px;
}
.center-neirong {
  width: 640px;
  margin-top: 10px;
}
.center-neirong h1 {
  height: 20px;
  padding: 15px 35px;
  position: relative;
  font-size: 16px;
  color: #2cc7c5;
  font-weight: 800;
}
.center-neirong h1 > i {
  position: absolute;
  left: 8px;
  top: 13px;
  width: 20px;
  height: 20px;
  background: url("../assets/LoginTu/yiji.jpg") no-repeat;
}
.center-bottom {
  width: 638px;
  height: 360px;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.center-bottom-1{
  width: 300px;
}
.center-bottom-1 p {
  color: #999;
}
.center-bottom-1-1 {
  width: 300px;
  height: 30px;
  display: flex;
  justify-content: space-between;
}
.center-bottom-1-1 span,.center-bottom-1-1 a{
  font-size:16px
}
.center-bottom-1-1 > a {
  font-size: 12px;
  line-height: 20px;
  height: 20px;
  border: 1px solid #2cc7c5;
  color: #2cc7c5;
  padding: 0 20px;
  border-radius: 10px;
  text-decoration: none;
  margin-top: 4px;
}


.center-neirong-2 {
  width: 640px;
  margin-top: 10px;
}
.center-neirong-2 h1 {
  height: 20px;
  padding: 15px 35px;
  position: relative;
  font-size: 16px;
  color: #bb1f20;
  font-weight: 800;
}
.center-neirong-2 h1 > i {
  position: absolute;
  left: 8px;
  top: 13px;
  width: 20px;
  height: 20px;
  background: url("../assets/LoginTu/yiji.jpg")no-repeat 0 -20px;
}
.center-top {
  width: 638px;
  height: 360px;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.center-top-1{
  width: 300px;
}
.center-top-1 p {
  color: #999;
}
.center-top1-1 {
  width: 300px;
  height: 30px;
  margin-top: 10px;
}
.center-top-1-1 span,.center-bottom-1-1 a{
  font-size:16px
}
</style>
