<template>
  <div>
    <div class="center-nei">
      <h3>营养价值</h3>
      <p>
        1、含水量高达85%，热量较低，是铁、钾和维生素A的上等来源，也是维生素C的一般来源。
        2、很有丰富的维生素类。一束韭菜的β-胡萝卜素刚好是一天所需的能量，不过维生素C则为一天所需摄取量的三分之一，维生素E含量也是三分之一。
        3、含有较多的粗纤维。
        4、独特辛香味是其所含的硫化物形成的，这些硫化物有一定的杀菌消炎作用，有助于人体提高自身免疫力，还能帮助人体吸收维生素B1及维生素A。
      </p>
      <h3>食用功效</h3>
      <p>
        1、补肾温阳
        2、益肝健胃
        3、行气理血
        4、润肠通便
      </p>
      <h3>适用人群</h3>
      <p>阴虚火旺、有眼病和胃肠虚弱的人不宜多食。</p>
      <h3>禁忌人群</h3>
      <p>一般人群均能食用。适宜便秘、产后乳汁不足女性、寒性体质等人群。</p>
    </div>
  </div>
</template>

<script>
export default {
  props:["sc"]
};
</script>

<style scoped>
.center-nei {
  width: 640px;
  margin-top: 15px;
}
.center-nei p {
  font-size: 18px;
}
.center-nei h3 {
  font-size: 20px;
  font-weight: 800;
  margin: 15px 0 10px;
}
</style>
