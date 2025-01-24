<template>
  <div>
    <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
      <el-menu-item index="1" @click.native="index = 1"
        >我收藏的菜谱</el-menu-item>
    </el-menu>
    <div class="shuju" v-show="index == 1">
      <!--    数据列表-->
      <div id="content2" style="margin-left: 0; padding-left: 0;">
        <ul id="jxlist2" class="clearfix" v-loading="loading" style="margin-left: 0; padding-left: 0;">
          <li class="item" v-for="recipe in recipeList" :key="recipe.id">
            <a class="cover">
              <router-link :to="{ name: 'RecipeById', params: { recipeId: recipe.recipeId } }">
                <img
                    :src="getRealSrc(recipe.recipeImage)"
                    width="300"
                    height="200"
                    :alt="recipe.recipeName + ' 的图片'"
                    @error="handleImageError"
                    class="hover-zoom"
                />
              </router-link>
            </a>
            <div class="relative">
              <router-link :to="{ name: 'RecipeById', params: { recipeId: recipe.recipeId } }">
                <a class="cookname text-lips">{{ recipe.recipeName }}</a>
              </router-link>
              <div class="info">
                <a class="intro text-lips" style="height: 35px">
                  <el-tooltip effect="dark" :content="recipe.recipeDescription || '暂无描述'" placement="top" popper-class="custom-tooltip2">
                    <span>{{ (recipe.recipeDescription || '').slice(0, 10) + '...' }}</span>
                  </el-tooltip>
                </a>
                <div class="view-coll">
                  <a class="star">
                    <el-icon><Star /></el-icon> <span class="likes-count">{{ recipe.likes }}</span>
                  </a>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>


      <!--    分页-->
      <pagination
          v-show="total>0"
          :total="total"
          v-model:page="queryParams.pageNum"
          v-model:limit="queryParams.pageSize"
          @pagination="getList"
      /></div>

  </div>
</template>

<script setup>
import { ref, reactive, toRefs, getCurrentInstance, onMounted } from 'vue';
import { isExternal } from "@/utils/validate.js";
import {likeSelect, listUserId} from "@/api/recipe/likes.js";

// 定义 data 并初始化
const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 15,
    recipeName: null,
    variety: null,
  }
});

// 获取当前实例
const { proxy } = getCurrentInstance();

// 使用 toRefs 解构 data 中的属性
const { queryParams, form } = toRefs(data);

const showSearch = ref(true);
const index = ref(1);
const { variety, recipe_state } = proxy.useDict('variety', 'recipe_state');
const ids = ref([]);
const loading = ref(true);
const recipeList = ref([]);
const total = ref(0);

const getRealSrc = (src) => {
  if (!src) {
    return "";
  }
  let real_src = src.split(",")[0];
  if (isExternal(real_src)) {
    return real_src;
  }
  return import.meta.env.VITE_APP_BASE_API + real_src;
};

/** 查询食谱列表 */
async function getList() {
  loading.value = true;
  try {
    const params = queryParams.value;
    console.log('Request Params:', params); // 添加日志输出请求参数
    const response = await listUserId();
    console.log('Response:', response); // 添加日志输出响应结果
    total.value = response.total;
    const recipeIds = response.rows.map(row => row.recipeId);
    const likesResponses = await Promise.all(recipeIds.map(id => likeSelect(id)));
    recipeList.value = response.rows.map((row, index) => {
      row.starred = likesResponses[index];
      return row;
    });
  } catch (error) {
    console.error('Error fetching data:', error); // 更详细的错误信息
  } finally {
    loading.value = false;
  }
}

// 初始化加载数据
onMounted(() => {
  getList();
});

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 删除按钮操作 */
function handleDelete(recipe) {
  const recipeId = recipe.recipeId || ids.value;
  proxy.$modal.confirm('是否确认删除食谱编号为"' + recipeId + '"的数据项？').then(function () {
    return delRecipe(recipeId);
  }).then(() => {
    getList(); // 刷新列表
    proxy.$modal.msgSuccess("删除成功");
  }).catch((error) => {
    console.error(error);
  });
}

function handleImageError(event) {
  event.target.src = '/path/to/default-image.jpg'; // 替换为默认图片路径
}
</script>


<style lang="scss" scoped>
.el-menu-item {
  font-size: 1.2rem;
}
.shuju {
  font-size: 1.3rem;
  margin: 50px 100px;
  color: #999ba6;
}

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

.el-select {
  width: 200px; /* 调整下拉框宽度 */
}


#content2 {
  width: 1300px;
  margin: 0 auto;
}

#jxlist2.clearfix {
  zoom: 1;
  width: 1300px;
}

#jxlist2 .clearfix:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  visibility: hidden;
}

#jxlist2 .item {
  float: left;
  width: 300px;
  height: 300px;
  overflow: hidden;
  margin: 0 20px 40px 0;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
  unicode-bidi: isolate;
}

#jxlist2 .cover {
  width: 300px;
  height: 200px;
  overflow: hidden;
  border-radius: 8px;
  display: block;
  background: #F9F9F9;
}

.relative {
  position: relative;
}

#jxlist2 .cookname {
  display: block;
  font-size: 15px;
  color: #333;
  line-height: 15px;
  padding: 10px 0;
}

.text-lips {
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

.intro {
  display: inline-block;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
}

.info {
  display: flex;
  align-items: center;
}

.view-coll {
  position: absolute;
  right: 0;
  bottom: 0;
  font-size: 16px;
  line-height: 20px;
}

.star {
  display: flex;
  align-items: center;
}

.likes-count {
  font-size: 12px; /* 根据需要调整字体大小 */
}

/* 使用 ::v-deep */
.custom-tooltip2 {
  white-space: pre-wrap;
  max-width: 300px;
}

.hover-zoom {
  transition: transform 0.3s ease; /* 添加过渡效果 */
}

.hover-zoom:hover {
  transform: scale(1.1); /* 鼠标悬停时放大图片 */
}

.el-input__inner {
  height: 30px; /* 调整输入框高度 */
  line-height: 40px; /* 调整输入框行高 */
}

.button-group {
  display: flex;
  justify-content: space-around;
}
.hidden-label .el-checkbox__label {
  display: none;
}
</style>
