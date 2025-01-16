<template>
  <div>
    <!-- 菜谱模块 -->
    <div v-show="isShow">
      <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
        <el-menu-item index="1" @click.native="index = 1">我的菜谱</el-menu-item>
        <el-menu-item index="2" @click.native="index = 2">待审核</el-menu-item>
        <el-menu-item index="3" @click.native="index = 3">退稿箱</el-menu-item>
        <el-menu-item index="4" @click.native="index = 4">草稿箱</el-menu-item>
        <el-button size="mini" type="danger" @click.native="isShow = false">发布新菜谱</el-button>
      </el-menu>
      <div class="shuju" v-show="index == 1">
        您还没有发布菜谱噢，快点击这里<a href="#" @click="isShow = false">发布新菜谱</a>吧！
      </div>
      <div class="shuju" v-show="index == 2">您没有处于待审核的菜谱！</div>
      <div class="shuju" v-show="index == 3">您没有审核未通过的菜谱！</div>
      <div class="shuju" v-show="index == 4">您没有未提交审核的菜谱！</div>
    </div>
    <!-- 菜谱发布 -->
    <div v-show="!isShow" class="cpfb">
      <el-container>
        <el-header height="35px">
          <div class="el-icon-arrow-left" @click="isShow = true">返回</div>
        </el-header>
        <el-container>
          <el-aside width="75%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
              <!-- 菜谱名称 -->
              <el-form-item label="菜谱名称" prop="name">
                <el-input v-model="ruleForm.name" placeholder="请输菜谱名称"></el-input>
              </el-form-item>

              <!-- 成品图片上传 -->
              <el-form-item label="成品图片" prop="cptp">
                <!-- 图片上传 -->
                <el-upload action="#" list-type="picture-card" :auto-upload="false">
                  <i slot="default" class="el-icon-plus"></i>
                  <div slot="file" slot-scope="{ file }">
                    <img
                        v-if="file && file.url"
                        class="el-upload-list__item-thumbnail"
                        :src="file.url"
                        alt=""
                    />
                    <span v-else class="el-upload-list__item-placeholder">无图片</span>
                    <span class="el-upload-list__item-actions">
                      <span
                          class="el-upload-list__item-preview"
                          @click="handlePictureCardPreview(file)"
                          v-if="file && file.url"
                      >
                        <i class="el-icon-zoom-in"></i>
                      </span>
                      <span
                          v-if="!disabled && file && file.url"
                          class="el-upload-list__item-delete"
                          @click="handleDownload(file)"
                      >
                        <i class="el-icon-download"></i>
                      </span>
                      <span
                          v-if="!disabled && file && file.url"
                          class="el-upload-list__item-delete"
                          @click="handleRemove(file)"
                      >
                        <i class="el-icon-delete"></i>
                      </span>
                    </span>
                  </div>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible">
                  <img width="100%" :src="dialogImageUrl" alt="" />
                </el-dialog>
              </el-form-item>

              <!-- 做法步骤 -->
              <el-form-item label="做法步骤" prop="zfbz" class="zfbz">
                <div style="display: flex; margin-bottom: 10px" v-for="i in zfbz" :key="i">
                  <div class="zlsc-img">
                    <el-upload action="#" list-type="picture-card" :auto-upload="false">
                      <i slot="default" class="el-icon-plus"></i>
                      <div slot="file" slot-scope="{ file }">
                        <img
                            v-if="file && file.url"
                            class="el-upload-list__item-thumbnail"
                            :src="file.url"
                            alt=""
                        />
                        <span v-else class="el-upload-list__item-placeholder">无图片</span>
                        <span class="el-upload-list__item-actions">
                          <span
                              class="el-upload-list__item-preview"
                              @click="handlePictureCardPreview(file)"
                              v-if="file && file.url"
                          >
                            <i class="el-icon-zoom-in"></i>
                          </span>
                          <span
                              v-if="!disabled && file && file.url"
                              class="el-upload-list__item-delete"
                              @click="handleDownload(file)"
                          >
                            <i class="el-icon-download"></i>
                          </span>
                          <span
                              v-if="!disabled && file && file.url"
                              class="el-upload-list__item-delete"
                              @click="handleRemove(file)"
                          >
                            <i class="el-icon-delete"></i>
                          </span>
                        </span>
                      </div>
                    </el-upload>
                    <el-dialog :visible.sync="dialogVisible">
                      <img width="100%" :src="dialogImageUrl" alt="" />
                    </el-dialog>
                  </div>
                  <div style="width: 719px">
                    <el-input type="textarea" :autosize="{ minRows: 6.5, maxRows: 6 }"></el-input>
                  </div>
                  <div class="zfbz-button">
                    <el-button @click.native="zfbz++">添加</el-button>
                    <el-button @click.native="zfbz--" style="margin-left: 0" :disabled="zfbz <= 3">移除</el-button>
                  </div>
                </div>
              </el-form-item>

              <!-- 其他表单项保持不变 -->
              <!-- ... -->

            </el-form>
          </el-aside>
          <el-main>
            <el-button type="danger">发布菜谱</el-button>
            <el-button type="danger">存为草稿</el-button>
          </el-main>
        </el-container>
      </el-container>
    </div>
  </div>
</template>

<script>export default {
  data() {
    return {
      // 成品图片参数
      dialogImageUrl: "",
      dialogVisible: false,
      disabled: false,

      index: 1,
      isShow: true, //是否开启上传食谱
      zhuliao: 1, //主料列表个数
      fuliao: 1, //辅料列表个数
      tiaoliao: 1, //调料列表个数
      zfbz: 3, //做法步骤列表个数

      ruleForm: {
        name: "",
        region: "",
        cpms: "",
        zznd: "",
        xysj: "",
        kouwei: "",
        prgy: "",
        sycj: "",
        zhuliao: "",
        fuliao: "",
        tiaoliao: "",
        zfbz: "",
        xqm: "",
      },
      rules: {
        name: [{ required: true, message: "请输入菜名", trigger: "blur" }],
        cptp: [{ required: true, message: "请选择图片", trigger: "blur" }],
        zznd: [{ required: true, message: "请选择", trigger: "blur" }],
        xysj: [{ required: true, message: "请选择", trigger: "blur" }],
        kouwei: [{ required: true, message: "请输入口味", trigger: "blur" }],
        prgy: [{ required: true, message: "请输入", trigger: "blur" }],
        sycj: [{ required: true, message: "请输入", trigger: "blur" }],
        zhuliao: [{ required: true, message: "请输入", trigger: "blur" }],
        tiaoliao: [{ required: true, message: "请输入", trigger: "blur" }],
        fuliao: [{ required: true, message: "请输入", trigger: "blur" }],
        zfbz: [{ required: true, message: "请输入", trigger: "blur" }],
      },
    };
  },

  methods: {
    // 成品图片上传
    handleRemove(file) {
      console.log(file);
    },
    handlePictureCardPreview(file) {
      if (file && file.url) {
        this.dialogImageUrl = file.url;
        this.dialogVisible = true;
      }
    },
    handleDownload(file) {
      console.log(file);
    },
  },
};
</script>

<style lang="scss" scoped>
.cpfb {
  .el-header {
    border-bottom: 1px solid #eeeeee;
    div {
      width: 100%;
      font-size: 1.2rem;
      color: #333;
      line-height: 35px;
      &:hover {
        color: #ff6767;
      }
    }
  }
  .el-aside {
    margin-top: 20px;
    padding-right: 20px;
    height: calc(100vh - 100px);

    .zlsc-img {
      width: 148px;
      height: 148px;
      overflow: hidden;
    }
    .zfbz-button {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
  }
  .el-main {
    text-align: center;
  }
}
.el-menu {
  position: relative;
  .el-button {
    position: absolute;
    right: 50px;
    top: 15px;
    font-size: 16px;
  }
}
.el-menu-item {
  font-size: 1.2rem;
}
.shuju {
  font-size: 1.3rem;
  margin: 50px 100px;
  color: #999ba6;
  a:hover {
    color: #ff6767;
  }
}

/*滚动条整体粗细样式*/
::-webkit-scrollbar {
  /*高宽分别对应横竖滚动条的尺寸*/
  width: 5px;
  height: 5px;
}

/*滚动条里面小方块*/
::-webkit-scrollbar-thumb {
  border-radius: 10px !important;
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2) !important;
  /* 颜色 */
  background: #b6b6b6 !important;
}

/*滚动条轨道*/
::-webkit-scrollbar-track {
  border-radius: 10px !important;
  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2) !important;
  background: #ededed !important;
}
</style>
