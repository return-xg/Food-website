<template>
  <div class="seniority">
    <!-- 左侧部分 -->
    <div v-if="data.length == 0" class="tishi">未查找到内容</div>
    <div v-else>
      <!-- 单个内容 -->
      <div class="seniority-left-item" v-for="k in data" :key="k.mid">
        <!-- <img src="/seniority/seniority1.jpg" /> -->
        <img :src="`${k.mpic.split(',')[0]}`" />
        <div>
          <h3>{{ k.mname }}</h3>
          <span>四月豆</span>
          <p>
            {{ k.main }}
          </p>
        </div>
      </div>

      <!-- 分页条 -->
      <el-pagination
        hide-on-single-page
        background
        layout="prev, pager, next"
        :total="Number(sum)"
        :page-size="10"
        @current-change="skip"
      >
      </el-pagination>
    </div>
    <!-- 右侧部分 -->
    <div>
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
  props: ["aaa"],
  data() {
    return {
      data: [],
      sum: "", //数据总数
      parameter: this.$route.params.name, //路由参数
    };
  },
  methods: {
    // 获取当前页码,发送下一页请求
    skip(e) {
      this.getdata(e);
    },
    // 获取菜谱全部数据
    getdata(page = 1) {
      const url = `http://8.136.145.197:3000/menu?page=${page}&pagesize=10`;
      this.axios.get(url).then((res) => {
        //console.log(res);
        this.data = res.data.data;
        //console.log(this.data);
      });
    },
    // 获取菜谱总数据
    getsum() {
      const url = "http://8.136.145.197:3000/menu/count";
      this.axios.post(url).then((res) => {
        //console.log(res);
        this.sum = res.data.data[0]["count(mid)"];
        //console.log(this.sum);
      });
    },

    // 获取搜索的数据
    postdata(name) {
      const url = `http://8.136.145.197:3000/menu/name?mname=${name}`;
      this.axios.get(url).then((res) => {
        this.data = res.data.data;
        //console.log(this.data);
        this.sum = res.data.data.length;
      });
    },
  },
  // 挂载时
  mounted() {
    if (this.parameter) {
      this.postdata(this.parameter);
    } else {
      // 获取菜谱全部数据
      this.getdata();
      // 获取菜谱总数据
      this.getsum();
    }
  },
  // 监听
  watch: {
    // 监听食谱页穿的数据,发送请求
    aaa(newValue, oldValue) {
      this.postdata(newValue);
    },
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
  margin: 0 auto 30px;
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
      img {
        border-radius: 5px;
        width: 180px;
        height: 180px;
      }
      div {
        margin-left: 20px;
        h3 {
          font-weight: 700;
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
    .el-pagination {
      text-align: center;
    }
  }
  // 右侧部分
  > div:last-child {
    width: 32%;
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
