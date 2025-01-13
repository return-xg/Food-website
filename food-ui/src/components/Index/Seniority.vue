<template>
  <div class="app-container">
    <!--    搜索-->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px" style="margin-left: 440px;">
      <el-form-item label="食品名称" prop="recipeName">
        <el-input
            v-model="queryParams.recipeName"
            placeholder="请输入食品名称"
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

    <div class="recipe-list" v-loading="loading">
      <el-card v-for="recipe in recipeList" :key="recipe.id" class="recipe-card">
        <div class="image-container">
          <image-preview :src="recipe.recipeImage" :width="200" :height="200"/>
        </div>
        <div class="card-content">
          <div class="card-header">
            <span>{{ recipe.recipeName }}</span>
          </div>
          <p>菜系: {{ recipe.variety }}</p>
          <p>食谱简介: {{ recipe.recipeDescription }}</p>
          <p>点赞数: {{ recipe.likes }}</p>
          <p>收藏数: {{ recipe.collect }}</p>
          <p>评论数: {{ recipe.review }}</p>
        </div>
        <div class="card-footer">
          <el-button class="heart" :class="{'starred': recipe.starred}" @click="star(recipe)"></el-button>
          <el-button link type="primary" icon="el-icon-more" @click="handleViewData(recipe)">查看</el-button>
        </div>
      </el-card>
    </div>

    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 查看菜谱对话框 -->
    <el-dialog :title="viewTitle" v-model="viewOpen" width="600px" append-to-body>
      <el-form ref="recipeRef" :model="form" label-width="80px">
        <el-form-item label="食品名称" prop="viewRecipeName">
          <span>{{ form.recipeName }}</span>
        </el-form-item>
        <el-form-item label="菜系" prop="variety">
          <span>{{ form.variety }}</span>
        </el-form-item>
        <el-form-item label="食谱简介" prop="viewRecipeDescription">
          <span>{{ form.recipeDescription }}</span>
        </el-form-item>
        <el-form-item label="图片" prop="viewRecipeImage">
          <image-preview :src="form.recipeImage" :width="150" :height="150"/>
        </el-form-item>
        <el-divider content-position="center">食材信息</el-divider>
        <el-table :data="ingredientList" :row-class-name="rowIngredientIndex" @selection-change="handleIngredientSelectionChange" ref="ingredient">
          <el-table-column label="序号" align="center" prop="index" width="60"/>
          <el-table-column label="食材名称" prop="ingredientName" width="260">
            <template #default="scope">
              {{ scope.row.ingredientName }}
            </template>
          </el-table-column>
          <el-table-column label="食材用量" prop="ingredientQuantity" width="260">
            <template #default="scope">
              {{ scope.row.ingredientQuantity }}
            </template>
          </el-table-column>
        </el-table>
        <el-divider content-position="center">步骤信息</el-divider>
        <el-table :data="stepList" :row-class-name="rowStepIndex" @selection-change="handleStepSelectionChange" ref="step">
          <el-table-column label="步骤" align="center" prop="index" width="60"/>
          <el-table-column label="操作内容" prop="stepDescription" width="260">
            <template #default="scope">
              <div style="white-space: pre-wrap;">{{ scope.row.stepDescription }}</div>
            </template>
          </el-table-column>
          <el-table-column label="图片" prop="stepImage" width="260">
            <template #default="scope">
              <image-preview :src="scope.row.stepImage" :width="150" :height="150"/>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
    </el-dialog>
  </div>
</template>

<script setup name="Recipe">
import { listRecipe, getRecipe} from "@/api/recipe/recipe";
import {addLikes, likeDelete, likeSelect} from "@/api/recipe/likes.js";

const { proxy } = getCurrentInstance();
const { variety,recipe_state } = proxy.useDict('variety', 'recipe_state');

const recipeList = ref([]);
const ingredientList = ref([]);
const stepList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const checkedIngredient = ref([]);
const checkedStep = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const viewOpen = ref(false); // 新增对话框的显示状态
const viewTitle = ref("查看食谱"); // 新增对话框的标题

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    recipeName: null,
    variety: null,
  },
  rules: {
    recipeName: [
      { required: true, message: "食品名称不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

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

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    recipeId: null,
    userId: null,
    recipeName: null,
    recipeDescription: null,
    recipeImage: null,
    state: null,
    createTime: null,
    updateTime: null,
    variety: null,
    likes: null,
    collect: null,
    review: null
  };
  ingredientList.value = [];
  stepList.value = [];
  proxy.resetForm("recipeRef");
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

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.recipeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 查看按钮操作 */
function handleViewData(row) {
  const _recipeId = row.recipeId || ids.value
  getRecipe(_recipeId).then(response => {
    form.value = response.data;
    ingredientList.value = response.data.ingredientList;
    stepList.value = response.data.stepList;
    viewOpen.value = true;
    title.value = "查看食谱";
  });
}

/** 点赞按钮操作 */
function star(row) {
  const _recipeIds = row.recipeId || ids.value;
  const likesData = { recipeId: _recipeIds };

  likeSelect(_recipeIds).then(response => {
    // 检查用户是否已经点赞了该菜谱
    const isLiked = response;

    if (isLiked) {
      // 如果已经点赞，则取消点赞
      likeDelete(likesData);
      // 移除 starred 类
      row.starred = false;
    } else {
      // 如果没有点赞，则进行点赞
      addLikes(likesData);
      // 添加 starred 类
      row.starred = true;
    }

    // 重新获取列表以更新点赞状态
    getList();
  });
}

/** 步骤序号 */
function rowStepIndex({ row, rowIndex }) {
  row.index = rowIndex + 1;
}

/** 食材序号 */
function rowIngredientIndex({ row, rowIndex }) {
  row.index = rowIndex + 1;
}

/** 复选框选中数据 */
function handleIngredientSelectionChange(selection) {
  checkedIngredient.value = selection.map(item => item.index)
}

/** 复选框选中数据 */
function handleStepSelectionChange(selection) {
  checkedStep.value = selection.map(item => item.index)
}

getList();
</script>

<style>
/* 未点赞样式 */
.heart {
  background: url(../../../../public/image/starred-heart.png);
  background-position: center; /* 可以根据需要调整 */
  background-repeat: no-repeat;
  background-size: contain; /* 确保图片完整显示 */
  height: 20px; /* 根据需要调整 */
  width: 20px; /* 根据需要调整 */
  border: none; /* 去掉边框 */
  padding: 0;
}
/* 已点赞样式 */
.heart.starred {
  background: url(../../../../public/image/heart.png);
  background-position: center; /* 可以根据需要调整 */
  background-repeat: no-repeat;
  background-size: contain; /* 确保图片完整显示 */
  height: 20px; /* 根据需要调整 */
  width: 20px; /* 根据需要调整 */
  border: none; /* 去掉边框 */
  padding: 0;
}

.recipe-list {
  display: flex;
  flex-wrap: wrap;
  margin: 0 auto; /* 垂直居中（如果需要） */
  padding: 20px; /* 添加左右留白 */
  justify-content: center;
}

.recipe-card {
  width: 250px; /* 固定宽度 */
  height: auto; /* 自动高度 */
  margin: 10px; /* 设置卡片之间的间距 */
  padding: 0; /* 移除内边距 */
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  overflow: hidden; /* 确保内容不会溢出 */
}

.image-container {
  overflow: hidden;
  margin-bottom: 10px; /* 图片和内容之间添加间距 */
}

.card-content {
  padding: 10px;
  text-align: center; /* 居中文本 */
}

.card-header {
  font-weight: bold;
  margin-bottom: 10px; /* 标题和其他内容之间添加间距 */
}
</style>
