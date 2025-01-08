<template>
  <div>
    <!-- 时令食材 -->
    <!-- 完成人： -->
    <div class="shiling">
      <span>时令食材</span>
      <div class="s1">
        <router-link to="/fenlei/1">肉禽类</router-link>
        <router-link to="/fenlei/2">果品</router-link>
        <router-link to="/fenlei/3">水产品</router-link>
        <router-link to="/fenlei/4">蔬菜</router-link>
        <router-link to="/fenlei/5">药食</router-link>
        <router-link to="/fenlei/6">米面</router-link>
        <router-link to="/fenlei/7">豆乳</router-link>
        <router-link to="/fenlei/8">调味品</router-link>
      </div>
      <hr />
      <div class="content" v-if="data">
        <div class="card" v-for="i in data" :key="i.iid">
          <img :src="'http://8.136.145.197:9000/' + i.ipic" alt="" />
          <router-link :to="`/sfoodmaterial/${i.iname}/jiucai`" class="title">{{
            i.iname
          }}</router-link>
          <a href="">{{ i.description }}</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: "",
    };
  },
  mounted() {
    this.shicai();
  },

  methods: {
    //食材接口连接http://8.136.145.197:3000/ingredient
    shicai() {
      const url = "http://8.136.145.197:3000/ingredient";
      this.axios.get(url).then((res) => {
        // this.data = res.data.data;
        // console.log(this.data);
        let arr = [];
        res.data.data.forEach(function (item, index) {
          if (item.iid < 15) {
            arr.push(item);
          }
        });
        this.data = arr;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.shiling {
  margin: 0 auto;
  width: 1200px;
  position: relative;
  user-select: none;

  span:first-child {
    text-decoration: none;
    font-weight: 600;
    font-size: 20px;
    color: orangered;
    border-bottom: 5px solid orangered;
    padding-bottom: 3px;
    &:hover {
      color: orangered;
    }
  }
  .s1 {
    display: inline-block;
    position: absolute;
    right: 0;

    a {
      float: right;
      margin: 0 0 0 20px;
      font-size: 16px;
      line-height: 30px;
      &:hover {
        color: orangered;
      }
    }
  }
  .content {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;

    .card {
      width: 171px;
      height: 175px;
      img {
        width: 126px;
        height: 126px;
        position: relative;
      }
      img {
        width: 100%;
        display: block;
      }

      .title {
        font-size: 18px;
        line-height: 120%;
        padding: 8px 0 2px;
        text-align: center;
        display: block;
        &:hover {
          color: orangered;
        }
      }
      a {
        text-align: center;
        display: block;
        font-size: 12px;
        &:hover {
          color: orangered;
        }
      }
    }
  }
}
</style>
