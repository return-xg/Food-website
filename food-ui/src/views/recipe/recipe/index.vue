<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="食品名称" prop="recipeName">
        <el-input
          v-model="queryParams.recipeName"
          placeholder="请输入食品名称"
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
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['recipe:recipe:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['recipe:recipe:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['recipe:recipe:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['recipe:recipe:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recipeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="食品名称" align="center" prop="recipeName" />
      <el-table-column label="食谱简介" align="center" prop="recipeDescription" />
      <el-table-column label="图片" align="center" prop="recipeImage" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.recipeImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="el-icon-more" @click="select(scope.row)">查看</el-button>
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['recipe:recipe:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['recipe:recipe:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改食谱对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="recipeRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="食品名称" prop="recipeName">
          <el-input v-model="form.recipeName" placeholder="请输入食品名称" />
        </el-form-item>
        <el-form-item label="食谱简介" prop="recipeDescription">
          <el-input v-model="form.recipeDescription" placeholder="请输入食谱简介" />
        </el-form-item>
        <el-form-item label="图片" prop="recipeImage">
          <image-upload v-model="form.recipeImage"/>
        </el-form-item>
        <el-divider content-position="center">步骤信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="Plus" @click="handleAddStep">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="Delete" @click="handleDeleteStep">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="stepList" :row-class-name="rowStepIndex" @selection-change="handleStepSelectionChange" ref="step">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="操作内容" prop="stepDescription" width="235">
            <template #default="scope">
              <el-input type="textarea" :rows="5" v-model="scope.row.stepDescription" placeholder="请输入该步骤的操作内容" />
            </template>
          </el-table-column>
          <el-table-column label="图片" prop="stepImage" width="235">
            <template #default="scope">
              <image-upload v-model="scope.row.stepImage"/>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 查看食谱对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="recipeRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="食品名称" prop="recipeName">
          <el-input :disabled="true" v-model="form.recipeName" placeholder="请输入食品名称" />
        </el-form-item>
        <el-form-item label="食谱简介" prop="recipeDescription">
          <el-input v-model="form.recipeDescription" placeholder="请输入食谱简介" />
        </el-form-item>
        <el-form-item label="图片" prop="recipeImage">
          <image-upload v-model="form.recipeImage"/>
        </el-form-item>
        <el-divider content-position="center">步骤信息</el-divider>
        <el-table :data="stepList" :row-class-name="rowStepIndex" @selection-change="handleStepSelectionChange" ref="step">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="操作内容" prop="stepDescription" width="235">
            <template #default="scope">
              <el-input type="textarea" :rows="5" v-model="scope.row.stepDescription" placeholder="请输入该步骤的操作内容" />
            </template>
          </el-table-column>
          <el-table-column label="图片" prop="stepImage" width="235">
            <template #default="scope">
              <image-upload v-model="scope.row.stepImage"/>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
    </el-dialog>
  </div>
</template>

<script setup name="Recipe">
import { listRecipe, getRecipe, delRecipe, addRecipe, updateRecipe } from "@/api/recipe/recipe";

const { proxy } = getCurrentInstance();
const { recipe_state } = proxy.useDict('recipe_state');

const recipeList = ref([]);
const stepList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const checkedStep = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    recipeName: null,
  },
  rules: {
    recipeName: [
      { required: true, message: "食品名称不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询食谱列表 */
function getList() {
  loading.value = true;
  listRecipe(queryParams.value).then(response => {
    recipeList.value = response.rows;
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
    recipeId: null,
    userId: null,
    recipeName: null,
    recipeDescription: null,
    recipeImage: null,
    state: null,
    createTime: null,
    updateTime: null
  };
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

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加食谱";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  // reset();
  const _recipeId = row.recipeId || ids.value
  getRecipe(_recipeId).then(response => {
    form.value = response.data;
    stepList.value = response.data.stepList;
    open.value = true;
    title.value = "修改食谱";
  });
}

/** 查看按钮操作 */
function select(row) {
  reset();
  const _recipeId = row.recipeId || ids.value
  getRecipe(_recipeId).then(response => {
    form.value = response.data;
    stepList.value = response.data.stepList;
    open.value = true;
    title.value = "查看食谱";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["recipeRef"].validate(valid => {
    if (valid) {
      form.value.stepList = stepList.value;
      if (form.value.recipeId != null) {
        updateRecipe(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addRecipe(form.value).then(response => {
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
  const _recipeIds = row.recipeId || ids.value;
  proxy.$modal.confirm('是否确认删除食谱编号为"' + _recipeIds + '"的数据项？').then(function() {
    return delRecipe(_recipeIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 步骤序号 */
function rowStepIndex({ row, rowIndex }) {
  row.index = rowIndex + 1;
}

/** 步骤添加按钮操作 */
function handleAddStep() {
  let obj = {};
  obj.stepNumber = "";
  obj.stepDescription = "";
  obj.stepImage = "";
  stepList.value.push(obj);
}

/** 步骤删除按钮操作 */
function handleDeleteStep() {
  if (checkedStep.value.length == 0) {
    proxy.$modal.msgError("请先选择要删除的步骤数据");
  } else {
    const steps = stepList.value;
    const checkedSteps = checkedStep.value;
    stepList.value = steps.filter(function(item) {
      return checkedSteps.indexOf(item.index) == -1
    });
  }
}

/** 复选框选中数据 */
function handleStepSelectionChange(selection) {
  checkedStep.value = selection.map(item => item.index)
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('recipe/recipe/export', {
    ...queryParams.value
  }, `recipe_${new Date().getTime()}.xlsx`)
}

getList();
</script>
