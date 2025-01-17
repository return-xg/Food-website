<template>
  <div class="week-hottest">
    <!-- <div> -->
    <span>今日推荐</span>
    <div class="column">
<!--      <a>热菜</a>-->
<!--      <a>凉菜</a>-->
<!--      <a>主食</a>-->
<!--      <a>小吃</a>-->
<!--      <a>饮品</a>-->
<!--      <a>家常食谱</a>-->
      <router-link to="/ShiPu">食谱首页</router-link>
    </div>
    <!-- </div> -->
    <hr />
    <div class="content">
      <div class="card" v-for="(i, index) in data" :key="index">
        <div>
          <img :src="i.mpic" alt="" />
        </div>
        <router-link :to="'/xiangqing/'+i.mname" class="title">{{ i.mname }}</router-link>
        <a>{{ i.username }}</a>
      </div>
      <i></i><i></i><i></i>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      data: [],
    };
  },
  mounted() {
    // this.getData();
  },
  methods: {
    getData() {
      let url = "http://8.136.145.197:3000/menu/all";
      axios.get(url).then((res) => {
        console.log("食谱列表", res.data);
        // 随机获取20条食谱
        var temp_arr = res.data;
        var return_arr = [];
        for (var i = 0; i < 20; i++) {
          if (temp_arr.length > 0) {
            var arrIndex = Math.floor(Math.random() * temp_arr.length);
            return_arr[i] = temp_arr[arrIndex];
            temp_arr.splice(arrIndex, 1);
          } else {
            break;
          }
        }
        console.log("随机:", return_arr);
        this.data = return_arr;
      }).catch((error) => {
        console.error("请求失败:", error);
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.week-hottest {
  margin: 0 auto;
  width: 1200px;
  position: relative;
  user-select: none;

  span:first-child {
    text-decoration: none;
    font-weight: 400;
    font-size: 20px;
    color: #ff6767;
    border-bottom: 5px solid #ff6767;
    padding-bottom: 3px;
    &:hover {
      color: #ff6767;
    }
  }
  .column {
    display: inline-block;
    position: absolute;
    right: 0;

    a {
      float: right;
      margin: 0 0 0 20px;
      font-size: 16px;
      line-height: 30px;
      &:hover {
        color: #ff6767;
      }
    }
  }

  .content {
    // height: 820px;
    // width: 1200px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    i{
      width: 230px;
    }
    .card {
      width: 230px;
      height: 305px;
      // margin: 0 17px 0 0;
      img {
        width: 100%;
        height: 100%;
        border-radius: 5px;
      }
      &:hover {
        div {
          width: 230px;
          height: 230px;
          // position: relative;
          overflow: hidden;
          text-align: center;
          // border: 1px solid red;

          img {
            // position: absolute;
            // width: 100%;
            width: 253px;
            height: 253px;
            border-radius: 5px;
            // top: 0;
            // bottom: 0;
            // left: 0;
            // right: 0;
            // margin: auto;
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
          }
        }
      }
      div {
        height: 230px;
        width: 230px;
        img {
          width: 100%;
          display: block;
        }
      }
      .title {
        font-size: 18px;
        line-height: 120%;
        padding: 8px 0 2px;
        text-align: center;
        display: block;
        &:hover {
          color: #ff6767;
        }
      }
      a {
        text-align: center;
        display: block;
        font-size: 12px;
        &:hover {
          color: #ff6767;
        }
      }
    }
  }
}
</style>
