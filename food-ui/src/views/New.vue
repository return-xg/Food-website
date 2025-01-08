<template>
  <div class="center-nei">
    <div class="center-he" v-for="item in data" :key="item.mid">
      <div class="center-img">
        <img :src="item.mpic.split(',')[0]" alt="" />
      </div>
      <router-link :to="'/xiangqing/'+item.mname" class="fooler-top">{{item.mname}}</router-link>
    </div>
    <i></i><i></i>
  
  </div> 
</template>

<script>
export default {
  props: ["sc"],
  data() {
    return {
      data1: 1,
      data:"",
    };
  },
  mounted() {
    let url = `http://8.136.145.197:3000/menu/name`;
      // let url = `http://8.136.145.197:3000/menu/name?mname=龙`;
      let params=`mname=${this.sc}`
    this.axios.post(url,params).then((res) => {
      // this.data = res.data;
      // console.log(this.data);
       let arr=[]
       res.data.data.forEach(function( item, index){ 
        // console.log(item,index)
        if(item.mid>=3&&item.mid<=12){
          arr.push(item)
        }
       })
       this.data=arr
       console.log(this.data)
    });
  },
};
</script>

<style scoped>
i{
  width: 200px;
  height: 100px;
}
.center-nei {
  width: 640px;
  margin-top: 15px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}
.center-he {
  width: 200px;
  height: 260px;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.center-he:nth-child(-n + 3) {
  margin-top: 0px;
}
.fooler-top {
  font-size: 20px;
  margin: 10px 0;
}
.fooler-bottom {
  color: #a9a9a9;
}
.fooler-bottom:hover {
  color: #ba2636;
}
.center-img {
  width: 200px;
  height: 200px;
  overflow: hidden;
}
.center-img > img {
  display: block;
  width: 100%;
  height: 100%;
  transform: scale(1);
  transition: all 0.6s;
}
.center-img > img:hover {
  cursor: pointer;
  transform: scale(1.2);
}
.my-pager span:hover {
  border: 1px solid #ff6767;
}
</style>
<style lang="scss" scoped>
.my-pager {
  width: 640px;
  padding: 10px;
  user-select: none;
  justify-content: center;
  display: flex;
  margin-top: 20px;
  span {
    padding: 10px 15px;
    background-color: #f8f8f8;
    margin: 0 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #333;
    //激活样式

    &.active {
      background-color: #ff6767;
      color: white;
      border-color: #ff6767;
    }

    //不可用样式
    &.disabled {
      color: lightgray;
      border-color: lightgray;
      //指针事件：没有 ;即删除所有鼠标相关事件
      pointer-events: none;
    }
  }
}
</style>
