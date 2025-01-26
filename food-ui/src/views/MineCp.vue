<template>
  <div>
    <!-- 菜谱模块 -->
    <div v-show="isShow">
      <el-menu mode="horizontal" active-text-color="#ff6767" default-active="1">
        <el-menu-item index="1" @click ="index = 1">我的菜谱</el-menu-item>
        <el-menu-item index="2" @click ="index = 2">待审核</el-menu-item>
        <el-menu-item index="3" @click ="index = 3">退稿箱</el-menu-item>
        <el-button size="mini" type="danger" @click="handlePublish">发布新菜谱</el-button>
      </el-menu>

<!--      我的菜谱-->
      <div class="shuju" v-show="index === 1">
        <!--    搜索-->
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
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

<!--        批量删除-->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
                type="danger"
                plain
                icon="Delete"
                :disabled="ids.length === 0"
                @click="handleDelete"
            >删除</el-button>
          </el-col>
        </el-row>

        <!--    数据列表-->
        <div id="content2" style="margin-left: 0; padding-left: 0;">
          <ul id="jxlist2" class="clearfix" v-loading="loading" style="margin-left: 0; padding-left: 0;">
            <li class="item" v-for="recipe in recipeList" :key="recipe.id">
              <el-checkbox v-model="ids" :label="recipe.recipeId" @change="handleSelectionChange" class="hidden-label"></el-checkbox>
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
                    <el-tooltip effect="dark" :content="recipe.recipeDescription || ''" placement="top" popper-class="custom-tooltip2">
                      <span>{{ (recipe.recipeDescription || '').slice(0, 10) + '...' }}</span>
                    </el-tooltip>
                  </a>
                  <div class="view-coll">
                    <el-button link type="primary" icon="Edit" @click="handleUpdate(recipe)">修改</el-button>
                    <el-button link type="primary" icon="Delete" @click="handleDelete(recipe)">删除</el-button>
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

<!--      待审核-->
      <div class="shuju" v-show="index === 2">
        <!--    搜索-->
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
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

        <!--        批量删除-->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
                type="danger"
                plain
                icon="Delete"
                :disabled="ids.length === 0"
                @click="handleDelete"
            >删除</el-button>
          </el-col>
        </el-row>

        <!--    数据列表-->
        <div id="content2" style="margin-left: 0; padding-left: 0;">
          <ul id="jxlist2" class="clearfix" v-loading="loading" style="margin-left: 0; padding-left: 0;">
            <li class="item" v-for="recipe in recipeList" :key="recipe.id">
              <el-checkbox v-model="ids" :label="recipe.recipeId" @change="handleSelectionChange" class="hidden-label"></el-checkbox>
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
                    <el-tooltip effect="dark" :content="recipe.recipeDescription" placement="top" popper-class="custom-tooltip2">
                      <span>{{ recipe.recipeDescription.slice(0, 10) + '...' }}</span>
                    </el-tooltip>
                  </a>
                  <div class="view-coll">
                    <el-button link type="primary" icon="Edit" @click="handleUpdate(recipe)">修改</el-button>
                    <el-button link type="primary" icon="Delete" @click="handleDelete(recipe)">删除</el-button>
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

<!--      退稿箱-->
      <div class="shuju" v-show="index === 3">
        <!--    搜索-->
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
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

        <!--        批量删除-->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
                type="danger"
                plain
                icon="Delete"
                :disabled="ids.length === 0"
                @click="handleDelete"
            >删除</el-button>
          </el-col>
        </el-row>

        <!--    数据列表-->
        <div id="content2" style="margin-left: 0; padding-left: 0;">
          <ul id="jxlist2" class="clearfix" v-loading="loading" style="margin-left: 0; padding-left: 0;">
            <li class="item" v-for="recipe in recipeList" :key="recipe.id">
              <el-checkbox v-model="ids" :label="recipe.recipeId" @change="handleSelectionChange" class="hidden-label"></el-checkbox>
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
                    <el-tooltip effect="dark" :content="recipe.recipeDescription" placement="top" popper-class="custom-tooltip2">
                      <span>{{ recipe.recipeDescription.slice(0, 10) + '...' }}</span>
                    </el-tooltip>
                  </a>
                  <div class="view-coll">
                    <el-button link type="primary" icon="Edit" @click="handleUpdate(recipe)">修改</el-button>
                    <el-button link type="primary" icon="Delete" @click="handleDelete(recipe)">删除</el-button>
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
    </div>
    <!-- 菜谱发布，修改界面 -->
    <div v-show="!isShow" class="cpfb">
      <el-container>
        <el-header height="35px">
          <div class="el-icon-arrow-left" @click="isShow = true">返回</div>
        </el-header>
        <el-container>
          <el-aside width="75%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleFormRef" label-width="100px" class="demo-ruleForm">
              <!-- 菜谱名称 -->
              <el-form-item label="菜谱名称" prop="name">
                <el-input v-model="ruleForm.name" placeholder="请输菜谱名称"></el-input>
              </el-form-item>
              <el-form-item label="菜系" prop="variety">
                <el-select v-model="ruleForm.variety" placeholder="请选择菜系">
                  <el-option
                      v-for="dict in variety"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>
              <!--              食谱简介-->
              <el-form-item label="食谱简介" prop="recipeDescription">
                <el-input v-model="ruleForm.recipeDescription" placeholder="请输入食谱简介" />
              </el-form-item>

              <!-- 成品图片上传 -->
              <el-form-item label="成品图片" prop="recipeImage">
                <image-upload v-model="ruleForm.recipeImage" />
              </el-form-item>

                <!-- 食材 -->
              <el-form-item label="食材" prop="ingredient">
                <div style="width: 690px" v-for="(ingredient, index) in ingredientList" :key="index">
                  <el-row type="flex" justify="space-between" align="middle">
                    <el-col :span="10">
                      <el-input
                          v-model="ingredient.ingredientName"
                          placeholder="请输入食材的名称"            style="width: 100%"
                      />
                    </el-col>
                    <el-col :span="10">
                      <el-input
                          v-model="ingredient.ingredientQuantity"
                          placeholder="请输入食材的用量"            style="width: 100%"
                      />
                    </el-col>
                    <el-col :span="4">
                      <div class="button-group">
                        <el-button
                            type="primary"
                            icon="plus"
                            circle
                            @click="addIngredient(index)"
                        ></el-button>
                        <el-button
                            type="danger"
                            icon="minus"
                            circle
                            @click="removeIngredient(index)"
                        ></el-button>
                      </div>
                    </el-col>
                  </el-row>
                </div>
              </el-form-item>

              <!-- 做法步骤 -->
              <el-form-item label="做法步骤" prop="steps">
                <div style="display: flex; margin-bottom: 10px" v-for="(step, index) in stepList" :key="index">
                  <!-- 做法步骤图片 -->
                  <div class="zlsc-img">
                    <image-upload v-model="step.stepImage" />
                  </div>
                  <div style="width: 719px">
                    <el-input type="textarea" v-model="step.stepDescription" :autosize="{ minRows: 6.5, maxRows: 6 }"></el-input>
                  </div>
                  <div class="zfbz-button">
                    <el-button @click="addStep">添加</el-button>
                    <el-button @click="removeStep(index)" style="margin-left: 0" :disabled="stepList.length <= 1">移除</el-button>
                  </div>
                </div>
              </el-form-item>
            </el-form>
          </el-aside>
          <el-main>
            <el-button type="danger" @click="submitForm">发布菜谱</el-button>
          </el-main>
        </el-container>
      </el-container>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, toRefs, getCurrentInstance, watch } from 'vue';
import { getRecipe, updateRecipe, userRecipeList } from "@/api/recipe/recipe";
import { likeSelect } from "@/api/recipe/likes.js";
import { isExternal } from "@/utils/validate";
import { ElMessage } from "element-plus";
import { addRecipe } from "@/api/recipe/recipe"; // 引入 addRecipe 函数
import { delRecipe } from "@/api/recipe/recipe";

// 定义 reset 函数
function reset() {
  Object.assign(ruleForm, {
    recipeId: null,
    name: "",
    variety: "",
    recipeDescription: "",
    recipeImage: "",
    ingredientList: [{ ingredientName: '', ingredientQuantity: '' }],
    stepList: [{ stepImage: '', stepDescription: '' }]
  });
}

const disabled = ref(false);
const multiple = ref(true);
const index = ref(1);
const isShow = ref(true); // 是否开启上传食谱

const { proxy } = getCurrentInstance();
const { variety, recipe_state } = proxy.useDict('variety', 'recipe_state');

const recipeList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const ids = ref([]);

const ruleForm = reactive({
  recipeId: null,
  name: "",
  variety: "",
  recipeDescription: "",
  recipeImage: "",
  ingredientList: [{ ingredientName: '', ingredientQuantity: '' }],
  stepList: [{ stepImage: '', stepDescription: '' }]
});

const rules = {
  name: [{ required: true, message: "请输入菜名", trigger: "blur" }],
  variety: [{ required: true, message: "请选择菜系", trigger: "blur" }],
  recipeDescription: [{ required: true, message: "请输入食谱简介", trigger: "blur" }],
};

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 15,
    recipeName: null,
    variety: null,
  }
});

const { queryParams, form } = toRefs(data);

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
    const params = {
      ...queryParams.value,
      state: index.value === 2 ? 0 : (index.value === 3 ? 2 : null)
    };
    console.log('index:', index.value); // 移到对象字面量之外
    const response = await userRecipeList(params);
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

// 监听 index 的变化
watch(index, (newIndex) => {
  if (newIndex === 1) {
    // 当 index 为 1 时，获取用户所有菜谱列表
    getList();
  }else if (newIndex === 2) {
    // 当 index 为 2 时，获取待审核的菜谱列表
    getList();
  }else if (newIndex === 3) {
    // 当 index 为 3 时，获取被退的菜谱列表
    getList();
  }
});

// 初始化加载数据
getList();

// 步骤管理
const stepList = ref([{ stepImage: '', stepDescription: '' }]);

function addStep() {
  stepList.value = [...stepList.value, { stepImage: '', stepDescription: '' }];
}

function removeStep(index) {
  if (stepList.value.length > 1) {
    stepList.value = stepList.value.filter((_, i) => i !== index);
  } else {
    ElMessage.error("至少需要保留一个步骤");
  }
}

// 食材管理
const ingredientList = ref([{ ingredientName: '', ingredientQuantity: '' }]);

function addIngredient(index) {
  ingredientList.value.splice(index + 1, 0, {
    ingredientName: '',
    ingredientQuantity: ''
  });
}

function removeIngredient(index) {
  if (ingredientList.value.length > 1) {
    ingredientList.value.splice(index, 1);
  } else {
    ElMessage.error("至少需要保留一个食材");
  }
}

/** 提交按钮 */
async function submitForm() {
  const valid = await proxy.$refs.ruleFormRef.validate();
  if (!valid) {
    return;
  }

  const formData = {
    recipeName: ruleForm.name,
    variety: ruleForm.variety,
    recipeDescription: ruleForm.recipeDescription,
    recipeImage: ruleForm.recipeImage,
    stepList: stepList.value,
    ingredientList: ingredientList.value
  };
  if (ruleForm.recipeId != null) {
    formData.recipeId = ruleForm.recipeId;
    await updateRecipe(formData);
    getList();
    ElMessage.success("菜谱修改成功！");
    isShow.value = true;
  } else {
    try {
      const response = await addRecipe(formData);
      getList(); // 刷新列表
      ElMessage.success("菜谱发布成功！");
      proxy.resetForm("ruleForm");
      isShow.value = true;
    } catch (error) {
      console.error(error);
      ElMessage.error("菜谱发布失败，请重试！");
    }
  }
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

/** 修改按钮操作 */
function handleUpdate(recipe) {
  reset(); // 确保 reset 函数已定义
  const _recipeId = recipe.recipeId;
  getRecipe(_recipeId).then(response => {
    console.log(response); // 添加这一行，查看返回的数据
    const data = response.data;
    ruleForm.recipeId = _recipeId;
    ruleForm.name = data.recipeName;
    ruleForm.variety = data.variety;
    ruleForm.recipeDescription = data.recipeDescription;
    ruleForm.recipeImage = data.recipeImage;

    // 处理食材列表
    if (data.ingredientList && data.ingredientList.length > 0) {
      ingredientList.value = data.ingredientList;
    } else {
      ingredientList.value = [{ ingredientName: '', ingredientQuantity: '' }];
    }

    // 处理步骤列表
    if (data.stepList && data.stepList.length > 0) {
      stepList.value = data.stepList;
    } else {
      stepList.value = [{ stepImage: '', stepDescription: '' }];
    }

    isShow.value = false; // 切换到发布/修改界面
  });
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.recipeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

function handlePublish() {
  reset();
  isShow.value = false;
}
</script>




<style lang="scss" >
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

