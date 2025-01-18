<template>
  <div class="app-container">
    <!--    搜索-->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px" style="margin-left: 440px;">
      <el-form-item label="食谱" prop="recipeName">
        <el-input
            v-model="queryParams.recipeName"
            placeholder="请输入食谱名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="菜系" prop="variety">
        <el-select v-model="queryParams.variety" placeholder="请选择菜系" clearable>
          <el-option
              v-for="dict in variety"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <div id="content">
      <ul id="jxlist" class="clearfix" v-loading="loading">
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
              <a class="intro text-lips">
                <el-tooltip effect="dark" :content="recipe.recipeDescription" placement="top" popper-class="custom-tooltip">
                  <span>{{ recipe.recipeDescription.slice(0, 10) + '...' }}</span>
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
    />
  </div>
</template>

<script setup name="Recipe">
import { listRecipe } from "@/api/recipe/recipe";
import { likeSelect } from "@/api/recipe/likes.js";
import { isExternal } from "@/utils/validate";


const { proxy } = getCurrentInstance();
const { variety,recipe_state } = proxy.useDict('variety', 'recipe_state');

const recipeList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);


const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 15,
    recipeName: null,
    variety: null,
  }
});

const { queryParams, form, rules } = toRefs(data);

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
    const response = await listRecipe(queryParams.value);
    total.value = response.total;
    const recipeIds = response.rows.map(row => row.recipeId);
    const likesResponses = await Promise.all(recipeIds.map(id => likeSelect(id)));
    recipeList.value = response.rows.map((row, index) => {
      row.starred = likesResponses[index];
      return row;
    });
  } catch (error) {
    console.error(error);
  } finally {
    loading.value = false;
  }
}

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

function handleImageError(event) {
  event.target.src = '/path/to/default-image.jpg'; // 替换为默认图片路径
}

getList();
</script>

<style>

.el-select {
  width: 200px; /* 调整下拉框宽度 */
}

.el-input__inner {
  height: 40px; /* 调整输入框高度 */
  line-height: 40px; /* 调整输入框行高 */
}

#content {
  width: 1000px;
  margin: 0 auto;
}

.clearfix{
  zoom: 1;
  width: 1000px;
}

.clearfix:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  visibility: hidden;
}

#jxlist .item {
  float: left;
  width: 300px;
  height: 255px;
  overflow: hidden;
  margin: 0 20px 40px 0;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
  unicode-bidi: isolate;
}

#jxlist .cover {
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

#jxlist .cookname {
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

.custom-tooltip {
  white-space: pre-wrap; /* 保留空白符并自动换行 */
  max-width: 300px; /* 设置最大宽度以防止过长 */
}

.hover-zoom {
  transition: transform 0.3s ease; /* 添加过渡效果 */
}

.hover-zoom:hover {
  transform: scale(1.1); /* 鼠标悬停时放大图片 */
}

</style>
