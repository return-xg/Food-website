<template>
  <!-- 导航和轮播图 -->
  <div class="scroll">
    <!-- 轮播图部分 -->
    <swiper
      v-if="imgs"
      class="swiper"
      :options="swiperOptions"
      @mouseover.native="stopSwiper"
      @mouseout.native="startSwiper"
      ref="swiper"
    >
      <!-- 图片 -->
      <swiper-slide v-for="i in imgs" :key="i.sid">
       <img :src="'http://8.136.145.197:9000/' + i.spic" alt="">
      </swiper-slide>
      <!-- 下方小点 -->
      <div class="swiper-pagination" slot="pagination"></div>
      <!-- 后退按钮 -->
      <div class="swiper-button-prev swiper-button" slot="button-prev"></div>
      <!-- 前进按钮 -->
      <div class="swiper-button-next swiper-button" slot="button-next"></div>
    </swiper>

    <!-- 侧边导航栏栏部分 -->
    <div class="sidebar" @mouseout="index = ''">
      <!-- 导航栏标题 -->
      <div class="column-left">
        <div @mouseover="index = 1" :class="{ active: index == 1 }">
          <div class="el-icon-s-order column-left-item">
            <span>菜谱大全</span>
          </div>
          <i class="el-icon-arrow-right"></i>
        </div>
        <div @mouseover="index = 2" :class="{ active: index == 2 }">
          <div class="el-icon-watermelon column-left-item">
            <span>食材大全</span>
          </div>
          <i class="el-icon-arrow-right"></i>
        </div>
        <div @mouseover="index = 3" :class="{ active: index == 3 }">
          <div class="el-icon-fork-spoon column-left-item">
            <span>健康饮食</span>
          </div>
          <i class="el-icon-arrow-right"></i>
        </div>
        <div @mouseover="index = 4" :class="{ active: index == 4 }">
          <div class="el-icon-menu column-left-item">
            <span>专题专区</span>
          </div>
          <i class="el-icon-arrow-right"></i>
        </div>
        <div @mouseover="index = 5" :class="{ active: index == 5 }">
          <div class="el-icon-star-on column-left-item">
            <span>新手必看</span>
          </div>
          <i class="el-icon-arrow-right"></i>
        </div>
      </div>
      <!-- 导航栏内容 -->
      <div class="column-right" justify="space-around" v-show="index">
        <div v-show="index == 1" @mouseover="index = 1">
          <el-row>
            <el-col :span="8">
              <router-link to="/" class="column-right-item">
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>人气菜肴</h3>
                <p>超过50人收藏</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>春季食谱</h3>
                <p>看看大家都爱吃啥</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>早餐</h3>
                <p>像国王一样的早餐</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>高颜值</h3>
                <p>颜值专用通道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>凉菜</h3>
                <p>精选2600道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>热菜</h3>
                <p>精选42500道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>主食</h3>
                <p>精选10000道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>小吃</h3>
                <p>精选11000道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>酱泡腌菜</h3>
                <p>精选700道</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>新秀菜谱</h3>
                <p>最新的优秀菜谱</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>所有分类</h3>
                <p>每天的神奇饭盒</p>
              </a>
            </el-col>
          </el-row>
        </div>
        <div v-show="index == 2" @mouseover="index = 2">
          <el-row>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/虾/jiucai">
                <h3>虾</h3>
                <p>新晋VC王</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/木瓜/jiucai">
                <h3>木瓜</h3>
                <p>国家药食同源名单</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/腐竹/jiucai">
                <h3>腐竹</h3>
                <p>是一种汉族传统豆制食品</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/番茄/jiucai">
                <h3>番茄</h3>
                <p>一不小心红了</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/螃蟹/jiucai">
                <h3>螃蟹</h3>
                <p>全民爆红</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/鸡翅/jiucai">
                <h3>鸡翅</h3>
                <p>胶原蛋白</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/鸭脖/jiucai">
                <h3>鸭脖</h3>
                <p>开胃、佐酒佳肴</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/鸡蛋/jiucai">
                <h3>鸡蛋</h3>
                <p>又名鸡卵、鸡子</p>
              </router-link>
            </el-col>
            <el-col :span="8">
             <router-link to="/sfoodmaterial/腊肉/jiucai">
                <h3>腊肉</h3>
                <p>人们都读là而不读xī</p>
              </router-link>
            </el-col>
            <el-col :span="8">
             <router-link to="/sfoodmaterial/香肠/jiucai">
                <h3>香肠</h3>
                <p>古老的食物</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/烩面/jiucai">
                <h3>烩面</h3>
                <p>河南传统美食</p>
              </router-link>
            </el-col>
            <el-col :span="8">
              <router-link to="/sfoodmaterial/火腿/jiucai">
                <h3>火腿</h3>
                <p>中国传统特色美食</p>
              </router-link>
            </el-col>
          </el-row>
        </div>
        <div v-show="index == 3" @mouseover="index = 3">
          <el-row>
            <el-col :span="8">
              <a>
                <h3>最新推荐</h3>
                <p>饮食健康知识</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>饮食常识</h3>
                <p>健康知识</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>健身美容</h3>
                <p>应该知道的小知识</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>气血双补</h3>
                <p>食疗专题</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>痛经</h3>
                <p>痛经吃什么好</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>驱寒暖身</h3>
                <p>有温度的食材</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>对抗雾霾</h3>
                <p>雾霾天吃什么</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>失眠</h3>
                <p>失眠吃什么好</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>食疗食补</h3>
                <p>常见症状的食疗专题</p>
              </a>
            </el-col>
          </el-row>
        </div>
        <div v-show="index == 4" @mouseover="index = 4">
          <el-row>
            <el-col :span="8">
              <a>
                <h3>菜单</h3>
                <p>由网友创建的专题</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>家常菜谱</h3>
                <p>居家必备368款</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>食疗食补</h3>
                <p>共212个专题</p>
              </a>
            </el-col>
          </el-row>
        </div>
        <div v-show="index == 5" @mouseover="index = 5">
          <el-row>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
            <el-col :span="8">
              <a>
                <h3>一周热门</h3>
                <p>近七天最受欢迎</p>
              </a>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 轮播图片
      imgs: [],
      // 侧边栏展开项
      index: "",
      // 轮播设置
      swiperOptions: {
        //effect: "cube", // 方块特效
        effect: "fade", // 淡入
        //effect: "coverflow",  //3D流
        //effect: "flip",   // 3D翻转
        //effect: "cards", // 卡片式

        loop: true, //无限循环

        //个性化
        autoplay: {
          delay: 5000, //时间 单位毫秒
          disableOnInteraction: false, //操作swiper后是否禁用滚动
        },

        //分页器
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        //左右箭头
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      },
    };
  },
  mounted() {
    this.getBanner();
  },
  methods: {
    // 轮播图鼠标进入时停止
    stopSwiper() {
      this.$refs.swiper.$swiper.autoplay.stop();
    },
    // 轮播图鼠标离开时继续
    startSwiper() {
      this.$refs.swiper.$swiper.autoplay.start();
    },
    // 获取轮播图片
    getBanner() {
      let url = "http://8.136.145.197:3000/banner";
      this.axios.get(url).then((res) => {
        console.log(res.data.data);
        this.imgs = res.data.data;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.scroll {
  margin: 0 auto 10px;
  width: 1200px;
  height: 432px;
  position: relative;
  // 轮播图部分
  .swiper {
    width: 100%;
    height: 100%;
    // 图片
    img {
      display: block;
      width: 100%;
      height: 100%;
    }
    // 前进后退按钮
    .swiper-button {
      width: 40px;
      height: 60px;
      color: #9c9b98;
      &:hover {
        background-color: #211d25;
      }
    }
    // 后退按钮
    .swiper-button-prev {
      left: 250px;
      z-index: 100;
    }
    // 前进按钮
    .swiper-button-next {
      right: 0;
    }
    // 圆点靠右
    .swiper-pagination {
      bottom: 5px;
      text-align: center;
    }
  }

  // 侧边栏部分
  .sidebar {
    height: 432px;
    display: flex;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;

    // 左侧栏目
    .column-left {
      padding-top: 40px;
      width: 250px;
      background-color: rgba(68, 68, 68, 0.4);

      > div {
        height: 70px;
        line-height: 70px;
        color: #ffffff;
        font-size: 1.1rem;
        // 导航项高亮
        &.active {
          background-color: #ff6767;
        }

        .column-left-item {
          margin: 0 95px 0 25px;
          span {
            padding-left: 5px;
          }
        }
      }
    }

    // 右侧栏目
    .column-right {
      box-shadow: 3px 2px 5px rgb(0 0 0 / 20%);
      width: 530px;
      height: 100%;

      > div {
        height: 100%;
        text-align: center;
        background-color: #ffffff;

        // 右侧栏目内容垂直居中
        .el-col {
          a {
            text-decoration: none;
            display: block;
            padding: 34px 0;
          }
          a:hover > h3 {
            color: #ff7474;
          }
          h3,
          p {
            padding: 0;
            margin: 0;
          }
          h3 {
            font-size: 1.1rem;
            color: #333;
            font-weight: 600;
          }
          p {
            font-size: 13px;
            color: #999999;
          }
        }
      }
    }
  }
}
</style>
