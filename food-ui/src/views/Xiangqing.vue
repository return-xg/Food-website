<template>
  <div>
    <div class="main" v-if="menu">
      <div>
        <span>
          您的位置: <a>食光趣享</a>> <a>菜谱</a>><a>{{ menu.mname }}</a>
        </span>
        <hr />
        <div class="title">
          <h1 class="h1">
            <b>{{ menu.mname }}</b>
          </h1>
          <div class="content">
            <img :src="'http://8.136.145.197:9000/' + menu.uavatar" />
            <span>{{ menu.username }}</span>
          </div>
        </div>
        <div class="image">
          <img class="" :src="menu.mpic" alt="" />
        </div>
        <div class="miaoshu" v-if="introduction">
          <span class="jianjie">“</span>
          {{ introduction }}
          <span class="jianjie">”</span>
        </div>
        <div class="subhead">
          <img src="https://static.meishichina.com/v6/img/mo.png" alt="" />
          <h3 class="h3">食材明细</h3>
        </div>
        <div class="zhuliao">
          <span class="zl-title">主料</span>
          <div class="mingxi">
            <div class="zl-mingxi" v-for="(i, index) in main" :key="index">
              <a>{{ i }}</a>
              <span>适量</span>
            </div>
          </div>
        </div>
        <div class="zhuliao" v-if="secondary">
          <span class="zl-title">辅料</span>
          <div class="mingxi">
            <div class="zl-mingxi" v-for="(i, index) in secondary" :key="index">
              <a>{{ i }}</a>
              <span>适量</span>
            </div>
          </div>
        </div>
        <div class="zhuliao" v-if="seasoning == []">
          <span class="zl-title">调料</span>
          <div class="mingxi">
            <div class="zl-mingxi" v-for="(i, index) in seasoning" :key="index">
              <a>{{ i }}</a>
              <span>适量</span>
            </div>
          </div>
        </div>
        <div class="zhuliao">
          <span class="zl-title"></span>
          <div class="mingxi">
            <div class="zl-mingxi">
              <a>{{ menu.flavor }}</a>
              <span>口味</span>
            </div>
            <div class="zl-mingxi">
              <a>{{ menu.craft }}</a>
              <span>工艺</span>
            </div>
            <div class="zl-mingxi">
              <a>{{ menu.time }}</a>
              <span>耗时</span>
            </div>
            <div class="zl-mingxi">
              <a>{{ menu.difficulty }}</a>
              <span>难度</span>
            </div>
          </div>
        </div>
        <div class="subhead">
          <img src="https://static.meishichina.com/v6/img/mo.png" alt="" />
          <h3 class="h3">{{ menu.mname }}的做法步骤</h3>
        </div>

        <!-- 步骤 -->
        <div class="step">
          <div class="step-img">
            <div v-for="(item, i) in diagram" :key="i">
              <img :src="item" alt="" />
            </div>
          </div>
          <div class="cao3">
            <div v-for="(item, i) in step" :key="i">
              <div class="step-item">

                <div>
                  <div class="step-text">{{ item }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="copy">
          <div class="hai5"><i></i> 小窍门</div>
          <div>{{ introduction }}</div>
          <div class="copyright">来自 <span> 不做妖精好多年的作品 </span></div>
          <div class="copyright">使用的厨具:平底锅</div>
          <div class="copyright">
            所属分类:<span>凉菜</span> <span>家常菜</span>
          </div>
        </div>
      </div>

      <div class="sidebar" style="margin:30px 0 0 30px">
        <div class="sidebar-head">
          <div class="sidebar-title"><span>最受欢迎的家常菜</span></div>
          <div class="gengduo"><a>更多</a></div>
        </div>
        <div class="sidebar-mx">
          <a>红烧肉</a>
          <a>干煸豆角</a>
          <a>干锅肥肠</a>
          <a>干锅肥肠</a>
          <a>干锅肥肠</a>
          <a>干锅肥肠</a>
        </div>
      </div>
    </div>

    <div class="w">
      <div class="footer">
        <div class="foot1">
          <span>食光趣享 - 让吃更美好!</span>
        </div>
        <div class="foot2">
          <ul>
<!--            <li><a href="" target="_blank">关于我们·</a></li>-->
<!--            <li><a href="" target="_blank">联系我们·</a></li>-->
<!--            <li><a href="" target="_blank">加入我们·</a></li>-->
<!--            <li><a href="" target="_blank">服务声明·</a></li>-->
<!--            <li><a href="" target="_blank">友情链接·</a></li>-->
<!--            <li><a href="" target="_blank">网站地图</a></li>-->
          </ul>
        </div>
        <div class="foot3">
          <span>友情链接：</span>
          <a href="https://www.yuyuemama.com/" target="_blank">愉悦妈妈</a>
          <a href="http://www.zul.cn/" target="_blank">自游乐</a>
          <a href="https://life.iqiyi.com/" target="_blank">爱奇艺生活</a>
          <a href="https://www.zhms.cn/" target="_blank">中华美食网</a>
          <a href="https://www.pcbaby.com.cn/" target="_blank">太平洋亲子网</a>
          <a href="http://www.canyin88.com/" target="_blank">红餐网</a>
          <a href="https://www.mama.cn/" target="_blank">妈妈网</a>
          <a href="http://www.qqbaobao.com/" target="_blank">亲宝网</a>
          <a href="https://www.city8.com/" target="_blank">中国地图</a>
          <a href="http://www.39yst.com/" target="_blank">民福康健康</a>
          <a href="http://www.boqii.com/" target="_blank">波奇网</a>
          <a href="https://www.258jituan.com/" target="_blank">企业服务平台</a>
          <a href="http://www.cy8.com.cn/" target="_blank">餐饮杰</a>
        </div>
        <div class="foot4">
          <p>
            版权所有 © 2004-2022美食天下 保留所有权利-
            <img src="" />
            京公网安备11010502031041号/京ICP证090244号/京ICP备10020153号
          </p>
          <img src="../assets/LoginTu/cyberpolice.gif" alt="" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      mname: this.$route.params.name,
      menu: "", //菜品
      introduction: "", //菜品描述
      main: [], //主料
      secondary: [], //辅料
      seasoning: [], //调料
      step: [], //步骤
      diagram: [], //步骤图
    };
  },
  mounted() {
    // this.getData();
    console.log(this.mname)
  },
  methods: {
    getData() {
      let url = `http://8.136.145.197:3000/menu/jqname?mname=${this.mname}`;
      console.log(url);
      this.axios.get(url).then((res) => {
        console.log(res.data.data[0]);
        this.menu = res.data.data[0];
        this.introduction = res.data.data[0].introduction;
        this.main = res.data.data[0].main.split("\r\n").filter(function (s) {
          return s && s.trim();
        }); //主料
        // console.log(this.main);
        this.secondary = res.data.data[0].secondary
          .split("\r\n")
          .filter(function (s) {
            return s && s.trim();
          }); //辅料
        this.seasoning = res.data.data[0].seasoning
          .split("\r\n")
          .filter(function (s) {
            return s && s.trim();
          }); //调味料
        this.step = res.data.data[0].step.split("\r\n").filter(function (s) {
          return s && s.trim();
        });
        console.log(this.step);
        this.diagram = res.data.data[0].diagram
          .split("\r\n")
          .filter(function (s) {
            return s && s.trim();
          }); //
        console.log(this.diagram);
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.w {
  width: 990px;
  margin: 0 auto;
}
.footer {
  border-top: 1px solid gray;
  margin: 10px 0 20px 0;
}
.foot1 {
  position: relative;
}
.foot1 > span {
  color: #ff5500;
  font-size: 14px;
  font-weight: 900;
}
.foot1 > img {
  display: inline-block;
  width: 200px;
  height: 80px;
  position: absolute;
  left: 710px;
}
.foot2 > ul {
  display: flex;
  flex-direction: row;
  margin-top: 15px;
  margin-bottom: 20px;
}
.foot3 {
  width: 710px;
}
.foot3 > a {
  flex-wrap: wrap;
  margin: 0px 5px 0 10px;
  margin-top: 5px;
}
.foot4 {
  margin-top: 20px;
  position: relative;
}
.foot4 > img {
  display: block;
  width: 70px;
  margin: 30px;
  position: absolute;
  left: 670px;
  top: -40px;
}
a {
  color: black;
}
a:hover {
  color: orangered;
}
</style>
<style lang="scss" scoped>
.main {
  font-family: "微软雅黑", "Microsoft YaHei";
  width: 990px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;

  div:first-child {
    span:first-child {
      color: #666;
      a {
        &:hover {
          color: #ff6767;
        }
      }
    }
    .title {
      display: flex;
      justify-content: space-between;
      width: 640px;
      margin-bottom: 20px;
      h1 {
        font-size: 36px;
        text-decoration: none;
        color: #333;
        vertical-align: middle;
        line-height: 63px;
        font-family: "微软雅黑", "Microsoft YaHei";
      }
      .content {
        width: 100px;
        padding-top: 15px;
        text-align: center;
        img {
          // width: 34px;
          height: 34px;
          width: 34px;
          border-radius: 50%;
          margin: 0 auto;
          display: block;
        }
        span {
          font-size: 12px;
          color: #999;
          &:hover {
            color: #ff6767;
          }
        }
      }
    }

    .miaoshu {
      margin: 0px;
      padding: 0px;
      width: 100%;
      color: #000;
      font-size: 16px;
      .jianjie {
        font-size: 40px;
        font-family: "宋体", "Hiragino Sans GB", STHeiti, "微软雅黑",
          "Microsoft YaHei";
        color: #666;
        height: 16px;
        line-height: 100%;
        width: 30px;
      }
    }
    .subhead {
      // height: 30px;
      margin: 20px 0px 20px 0px;
      font-family: "微软雅黑", "Microsoft YaHei";
      img {
        margin: 0px 5px -3px 5px;
      }
      .h3 {
        font-size: 19px;
        line-height: 20px;
        display: inline-block;
        font-weight: bolder;
        color: #ff6767;
      }
    }
    .zhuliao {
      border: 1px solid #ddd;
      width: 640px;
      border-radius: 10px;
      padding: 0 0 10px 0;
      margin: 0 0 30px 0;

      .zl-title {
        display: block;
        margin: -13px 45px 0 45px;
        background-color: #fff;
        width: 40px;
        padding: 0 10px;
        font-size: 16px;
      }
      .mingxi {
        display: flex;
        flex-wrap: wrap;
        padding-top: 25px;

        .zl-mingxi {
          display: flex;
          flex-direction: column;
          width: 159px;
          height: 70px;
          color: #333;
          white-space: nowrap;
          font-size: 20px;
          line-height: 45px;
          text-align: center;
          a {
            &:hover {
              color: #ff6767;
            }
          }
          span {
            color: #999;
            font-size: 12px;
            line-height: 16px;
          }
        }
      }
    }
    .copyright {
      margin-top: 16px;
      font-size: 16px;
    }
    .copyright-sm {
      margin-top: 10px;
      font-size: 10px;
    }
  }
  .hai5 {
    font-size: 25px;
    font-weight: 500;
    color: #ff5662;
    margin-bottom: 15px;
  }
  .copy div:nth-child(2) {
    font-size: 16px;
  }
  .hai5 > i {
    display: inline-block;
    width: 10px;
    height: 10px;
    border: 6px solid #ff5662;
    border-radius: 50%;
    vertical-align: middle;
  }

  .image {
    // border: 1px solid green;
    img {
      width: 100%;
      height: 100%;
    }
  }
  .sidebar {
    width: 300px;
    height: 200px;
    position: sticky;
    right: 0;
    top: 30px;
    .sidebar-head {
      border-bottom: 1px solid #eeeeee;
      display: flex;
      justify-content: space-between;
      .sidebar-title {
        text-decoration: none;
        white-space: nowrap;
        font-weight: 400;
        font-size: 20px;
        color: #ff6767;
        border-bottom: 3px solid #ff6767;
      }
      .gengduo {
        margin: 0 0 0 20px;
        font-size: 16px;
        color: #333;
        line-height: 30px;
      }
    }
    .sidebar-mx {
      width: 333px;
      a {
        display: inline-block;
        border: 1px solid #eee;
        margin: 15px 15px 0 0;
        border-radius: 4px;
        text-align: center;
        white-space: nowrap;
        text-overflow: ellipsis;
        color: #333;
        width: 88px;
        line-height: 34px;
        height: 34px;
        font-size: 14px;
        &:hover {
          color: #ff6767;
        }
      }
    }
  }
}
.step {
  width: 690px;
  display: flex;
  justify-content: flex-start;
}
.step-img {
  width: 220px;
  margin-bottom: 20px;
}
.step-img img {
  width: 220px;
  height: 165px;
  margin-bottom: 20px;
}
.cao3 > div {
  padding-top: 30px;
  width: 300px;
  height: 135px;
  margin-bottom: 20px;
  font-size: 18px;
  font-weight: 800;
  margin-left: 20px;
}

.bz-title {
  line-height: 28px;
  width: 28px;
  border: 1px solid #ddd;
  color: #999;
  border-radius: 50%;
  height: 28px;
  font-size: 16px;
  text-align: center;
}
.bz {
  font-size: 18px;
}
.copy {
  width: 640px;
  height: 200px;
}
</style>
