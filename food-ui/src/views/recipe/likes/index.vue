<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="食谱名称" prop="recipeId">
        <el-input
          v-model="queryParams.recipeName"
          placeholder="请输入食谱名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户名称" prop="userId">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['recipe:likes:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="likesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="食谱名称" align="center" prop="recipeName" />
      <el-table-column label="用户名称" align="center" prop="nickName" />
      <el-table-column label="收藏时间" align="center" prop="createTime" />
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template #default="scope">-->
<!--          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['recipe:likes:edit']">修改</el-button>-->
<!--          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['recipe:likes:remove']">删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改收藏对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="likesRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="食谱id" prop="recipeId">
          <el-input v-model="form.recipeId" placeholder="请输入食谱id" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Likes">
import {getLikes, delLikes, addLikes, updateLikes, listLikes1} from "@/api/recipe/likes";

const { proxy } = getCurrentInstance();

const likesList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    recipeId: null,
    userId: null,
    recipeName:null,
    nickName:null,
  },
  rules: {
    recipeId: [
      { required: true, message: "食谱id不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询收藏列表 */
function getList() {
  loading.value = true;
  listLikes1(queryParams.value).then(response => {
    likesList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    likeId: null,
    recipeId: null,
    userId: null,
    recipeName:null,
    nickName:null
  };
  proxy.resetForm("likesRef");
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
  ids.value = selection.map(item => item.likeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加收藏";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _likeId = row.likeId || ids.value
  getLikes(_likeId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改收藏";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["likesRef"].validate(valid => {
    if (valid) {
      if (form.value.likeId != null) {
        updateLikes(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addLikes(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _likeIds = row.likeId || ids.value;
  proxy.$modal.confirm('是否确认删除收藏编号为"' + _likeIds + '"的数据项？').then(function() {
    return delLikes(_likeIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('recipe/likes/export', {
    ...queryParams.value
  }, `likes_${new Date().getTime()}.xlsx`)
}

getList();
</script>
