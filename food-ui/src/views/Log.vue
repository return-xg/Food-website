<template>
  <div>
    <div class="main">
<div class="card" v-for="i in 8" :key="i">
  <div class="imgs">
  <img src="/image/2.jpg" alt="">
  </div>
  <h3>椰蓉果酱面包</h3>
  <span>食·色</span>
</div>
  </div></div>
</template>

<script>
  export default { 
  }
</script>

<style lang="scss" scoped>
.main{
  width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap:wrap
}
.card{
  width: 280px;
  height: 250px;
  margin: 10px 20px 0 0; 
  h3{
    text-align: center;
    font-size: 18px;
    font-weight: 600;
    margin: 10px 0 10px 0;
  }
  span{
    display: block;
    font-size: 12px;
    color: gray;
    text-align: center;
    font-weight: 300;
  }
}
.imgs{
  width: 230px;
  height: 170px;
  overflow: hidden;
  margin-left: 25px;
  img{
    
    cursor: pointer;
    transition: all 1.5s;
  }
  img:hover{
    transform: scale(1.4);
  }
}
</style>