<template>
  <div class="center-nei" v-if="data">
    <div v-if="data.data.length == 0" class="center-he-1">
      抱歉没搜到你想要的食材
    </div>
    <div class="center-he" v-for="(item, i) in data.data" :key="i" v-else>
      <div class="center-img">
        <img :src="item.mpic.split(',')[0]" alt="" />
      </div>
      <router-link :to="'/xiangqing/'+item.mname" class="fooler-top">{{ item.mname }}</router-link>
    </div>
    <i></i><i></i>
    </div>
</template>

<script>
export default {
  data() {
    return {
      count: 1,
      data: "",
    };
  },
  mounted() {
    this.ship();
    console.log(this.sc);
  },
  props: ["sc"],
  watch: {
    sc() {
      this.ship();
    },
  },

  methods: {
    ship() {
      let url = `http://8.136.145.197:3000/menu/name`;
      // let url = `http://8.136.145.197:3000/menu/name?mname=龙`;
      let params=`mname=${this.sc}`
      this.axios.post(url,params).then((res) => {
        this.data = res.data;
        console.log(this.data);
      });
    },
  },
};
</script>

<style scoped>
i {
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
.center-he-1 {
  width: 640px;
  height: 460px;
  margin-top: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #666;
  font-size: 22px;
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


