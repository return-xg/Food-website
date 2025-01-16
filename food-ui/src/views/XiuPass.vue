<template>
  <div>
    <my-header class="top" />
    <div class="banxin">
      <div class="banxin-nei">
        <div class="banxin-nei-top">找回密码</div>
        <div class="banxin-nei-bottom">
          <div class="logins">
            <el-form
              ref="form"
              :model="form"
              label-width="100px"
              :rules="rules"
            >
              <el-form-item label="手机号" prop="phone">
                <el-input
                  v-model="form.phone"
                  placeholder="请输入注册手机号"
                ></el-input>
              </el-form-item>
              <el-form-item label="密码:" prop="pwd">
                <el-input
                  v-model="form.pwd"
                  placeholder="请输入密码"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item label="确认密码:" prop="repwd">
                <el-input
                  v-model="form.repwd"
                  placeholder="请确认密码"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即修改</el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
    </div>

    <!-- 底部 -->
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
import MyHeader from "@/components/Index/MyHeader.vue";

export default {
  components: { MyHeader },
  data() {
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.form.pwd) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      form: {
        phone: "",
        pwd: "",
        repwd: "",
      },
      rules: {
        phone: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          {
            pattern: /^1[3-9]\d{9}$/,
            message: "手机号不合法",
            trigger: "blur",
          },
        ],
        pwd: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            pattern: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,15}$/,
            message: "密码必须有数字和字母组成,长度8-15",
            trigger: "change",
          },
        ],
        repwd: [{ validator: validatePass2, trigger: "change" }],
      },
    };
  },
  methods: {
    onSubmit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          console.log(this.form);
          let url = "http://8.136.145.197:3000/user/mima";
          let params = `uphone=${this.form.phone}&upwd=${this.form.pwd}`;

          console.log(params);
          this.axios.put(url, params).then((res) => {
            console.log(res.data.code);
            if (res.data.code == 200) {
              this.$message.success("恭喜找回密码");
              this.$router.push("/login");
            } else {
              this.$message.error("手机号错误");
            }
          });
        } else {
          console.warn("请完善表单");
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.w {
  width: 990px;
  margin: 50px auto 0;
}
.footer {
  border-top: 1px solid red;
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
<style scoped>
.top {
  z-index: 30;
  position: fixed;
  top: 0;
}
.banxin {
  width: 990px;
  height: 830px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
}
.banxin-nei {
  width: 780px;
  height: 550px;
}
.banxin-nei-top {
  width: 780px;
  line-height: 30px;
  padding: 10px 0;
  text-align: center;
  font-size: 35px;
  font-weight: 800;
  color: #333333;
}
.banxin-nei-bottom {
  width: 780px;
  height: 530px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.logins {
  width: 500px;
  height: 330px;
}
</style>
<style scoped>
.el-button {
  width: 250px;
  margin: 20px 55px;
  background-color: #ff6767;
  color: #fff;
  border: 0;
}
.el-button:active {
  opacity: 0.6;
}
</style>
