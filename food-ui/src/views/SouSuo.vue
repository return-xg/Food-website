<template>
  <div class="seniority" v-if="data">
    <!-- 左侧部分 -->
    <div v-if="data.data.length == 0" class="tishi">未查找到内容</div>
    <div v-else>
      <!-- 单个内容 -->
      <div class="seniority-left-item" v-for="(item, i) in data.data" :key="i">
        <!-- <img src="/seniority/seniority1.jpg" /> -->
        <div class="seniority-left-item1">
          <img :src="item.mpic.split(',')[0]" />
        </div>

        <div>
          <router-link :to="'/xiangqing/'+item.mname">{{ item.mname }}</router-link>
          <p>
            {{ item.seasoning }}
          </p>
        </div>
      </div>
    </div>
    <!-- 右侧部分 -->
    <div class="right-neir">
      <!-- 标题 -->
      <div>
        <h3>最受欢迎的家常菜</h3>
        <router-link to="#">更多</router-link>
      </div>
      <!-- 内容 -->
      <el-row type="flex" justify="space-between">
        <el-col :span="7">红烧茄子</el-col>
        <el-col :span="7">红烧肉</el-col>
        <el-col :span="7">红烧茄子</el-col>
        <el-col :span="7">红烧茄子</el-col>
        <el-col :span="7">红烧肉</el-col>
        <el-col :span="7">红烧茄子</el-col>
        <el-col :span="7">红烧肉</el-col>
        <!-- 占位项目:为了让最后一行靠左排列 -->
        <el-col :span="7"></el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    sos: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      data: "",
    };
  },
  mounted() {
    console.log(this.sos);
    let url = `http://8.136.145.197:3000/menu/name`;
      
      let params=`mname=${this.sos}`
    this.axios.post(url,params).then((res) => {
      this.data = res.data;
      console.log(this.data);
    });
  },
};
</script>

<style lang="scss" scoped>
* {
  h3,
  p {
    padding: 0;
    margin: 0;
  }
  a {
    text-decoration: none;
    color: #333333;
  }
}
.seniority {
  margin: 0 auto;
  width: 990px;
  display: flex;
  justify-content: space-between;
  // 提示
  .tishi {
    margin-top: 20px;
    font-size: 1.5rem;
    height: 50px;
    text-align: center;
    line-height: 50px;
    color: #ff6767;
  }
  // 左侧部分
  > div:first-child {
    width: 60%;
    // 菜谱内容
    > .seniority-left-item {
      display: flex;
      padding: 20px 0;
      .seniority-left-item1 {
        width: 180px;
        height: 180px;
        overflow: hidden;
        border-radius:5px;
        img {
          display: block;
          width: 100%;
          height: 100%;
          transform: scale(1);
          transition: 0.5s;
          &:hover {
            transform: scale(1.2);
          }
        }
      }
      div {
        margin-left: 20px;
        a {
          font-style: 700;
          font-size: 1.2rem;
          padding: 3px 0 10px 0;
          &:hover {
            color: #ff6767;
          }
        }
        span {
          display: inline-block;
          padding: 0 0 2px 0;
          font-size: 0.9rem;
          color: #999999;
        }
        p {
          font-size: 0.9rem;
          color: #333;
        }
      }
    }
  }
  // 右侧部分
  > div:last-child {
    width: 300px;
    position: fixed;
    top: 0;
    right: 280px;
    // 标题
    > div:first-child {
      border-bottom: 1px solid #eeeeee;
      display: flex;
      justify-content: space-between;
      padding: 20px 0 0 0;
      h3 {
        font-size: 1.2rem;
        color: #ff6767;
        border-bottom: 3px solid #ff6767;
        padding-bottom: 5px;
        position: relative;
        top: 2px;
      }
      a {
        font-size: 1.1rem;
        margin: auto 0;
        padding-left: 10px;
        &:hover {
          color: #ff6767;
        }
      }
    }
    // 内容
    .el-row {
      margin-top: 15px;
      flex-wrap: wrap;
      > .el-col {
        font-size: 0.9rem;
        text-align: center;
        border: 1px solid #eeeeee;
        margin: 10px 0;
        padding: 8px 0;
        border-radius: 3px;
        &:hover {
          color: #ff6767;
        }
      }
      // 占位项目
      .el-col:last-child {
        border: 0px;
      }
    }
  }
}
</style>
