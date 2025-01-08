<template>
  <div class="hyzx">
    <div class="top">
      <div class="touxiang">
        <img
          src="https://img1.baidu.com/it/u=4216761644,15569246&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500"
        />
      </div>
      <div class="xinxi">
        <div class="nic">惜楠</div>
        <div class="chengzhang">
          <div>
            <p>5</p>
            <p>成长值</p>
          </div>
          <div>
            <p>25</p>
            <p>幸运草</p>
          </div>
          <div>
            <p>50</p>
            <p>关注</p>
          </div>
          <div>
            <p>1</p>
            <p>粉丝</p>
          </div>
          <div>
            <p>100</p>
            <p>收藏</p>
          </div>
        </div>
        <div class="tongzhi">
          <el-button size="mini">通知</el-button>
          <el-button size="mini">私信</el-button>
          <el-button size="mini">福利活动</el-button>
        </div>
      </div>
    </div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="3">
      <el-menu-item index="1">我关注的动态</el-menu-item>
      <el-menu-item index="2">所有动态</el-menu-item>
      <el-menu-item index="3">我的动态</el-menu-item>
    </el-menu>
    <div class="shuju">没有数据</div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.hyzx > .top {
  height: 190px;
  display: flex;
  padding: 10px 0;

  .touxiang {
    margin: 20px;
    img {
      display: block;
      width: 150px;
      height: 150px;
      border-radius: 50%;
    }
  }

  .xinxi {
    margin: 20px 0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 150px;
    .nic {
      height: 40px;
      font-size: 2rem;
      color: #ff6767;
    }
    .chengzhang {
      height: 60px;
      display: inline-flex;
      text-align: center;
      div {
        color: #333;
        margin-right: 20px;
        &:hover {
          color: #ff6767;
        }
        p:nth-child(1) {
          font-size: 18px;
        }
        p:nth-child(2) {
          font-size: 12px;
        }
      }
    }
    .el-button {
      color: #ff6767;
      border-color: #ff6767;
    }
  }
}

.el-menu-item {
  font-size: 1.1rem;
}
.shuju {
  font-size: 1.5rem;
  margin: 50px 150px;
  color: #ff6767;
}
</style>
