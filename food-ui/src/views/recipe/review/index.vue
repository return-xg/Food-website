<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="食谱id" prop="recipeId">-->
<!--        <el-input-->
<!--            v-model="queryParams.recipeId"-->
<!--            placeholder="请输入食谱id"-->
<!--            clearable-->
<!--            @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="用户id" prop="userId">-->
<!--        <el-input-->
<!--            v-model="queryParams.userId"-->
<!--            placeholder="请输入用户id"-->
<!--            clearable-->
<!--            @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="用户名称" prop="nickName">
        <el-input
            v-model="queryParams.nickName"
            placeholder="请输入用户名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论" prop="review">
        <el-input
            v-model="queryParams.review"
            placeholder="请输入评论"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="父级id" prop="pId">-->
<!--        <el-input-->
<!--            v-model="queryParams.pId"-->
<!--            placeholder="请输入父级id"-->
<!--            clearable-->
<!--            @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="回复对象" prop="target">
        <el-input
            v-model="queryParams.target"
            placeholder="请输入被回复用户名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="食谱名称" prop="recipeName">
        <el-input
            v-model="queryParams.recipeName"
            placeholder="请输入食谱名称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" style="width: 308px">
        <el-date-picker
            v-model="daterangeCreateTime"
            value-format="YYYY-MM-DD"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--            type="primary"-->
<!--            plain-->
<!--            icon="Plus"-->
<!--            @click="handleAdd"-->
<!--            v-hasPermi="['recipe:review:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--            type="success"-->
<!--            plain-->
<!--            icon="Edit"-->
<!--            :disabled="single"-->
<!--            @click="handleUpdate"-->
<!--            v-hasPermi="['recipe:review:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['recipe:review:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['recipe:review:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="reviewList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="评论id" align="center" prop="reviewId" />-->
<!--      <el-table-column label="食谱id" align="center" prop="recipeId" />-->
<!--      <el-table-column label="用户id" align="center" prop="userId" />-->
      <el-table-column label="食谱名称" align="center" prop="recipeName" />
      <el-table-column label="用户名称" align="center" prop="nickName" />
      <el-table-column label="回复对象" align="center" prop="target" />
      <el-table-column label="评论" align="center">
        <template #default="scope">
          <el-tooltip effect="dark" :content="scope.row.review" placement="top" popper-class="custom-tooltip">
            <span>{{ scope.row.review?.slice(0, 10) + '...' || '暂无评论' }}</span>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="父级id" align="center" prop="pId" />-->


      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
<!--          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['recipe:review:edit']">修改</el-button>-->
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['recipe:review:remove']">删除</el-button>
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

    <!-- 添加或修改评论对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="reviewRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="食谱id" prop="recipeId">
          <el-input v-model="form.recipeId" placeholder="请输入食谱id" />
        </el-form-item>
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="用户名称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入用户名称" />
        </el-form-item>
        <el-form-item label="评论" prop="review">
          <el-input v-model="form.review" placeholder="请输入评论" />
        </el-form-item>
        <el-form-item label="父级id" prop="pId">
          <el-input v-model="form.pId" placeholder="请输入父级id" />
        </el-form-item>
        <el-form-item label="回复对象" prop="target">
          <el-input v-model="form.target" placeholder="请输入回复对象" />
        </el-form-item>
        <el-form-item label="食谱名称" prop="recipeName">
          <el-input v-model="form.recipeName" placeholder="请输入食谱名称" />
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

<script setup name="Review">
import { listReview, getReview, delReview, addReview, updateReview } from "@/api/recipe/review";

const { proxy } = getCurrentInstance();

const reviewList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const daterangeCreateTime = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    recipeId: null,
    userId: null,
    nickName: null,
    review: null,
    createTime: null,
    pId: null,
    target: null,
    recipeName: null
  },
  rules: {
    recipeId: [
      { required: true, message: "食谱id不能为空", trigger: "blur" }
    ],
    userId: [
      { required: true, message: "用户id不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询评论列表 */
function getList() {
  loading.value = true;
  queryParams.value.params = {};
  if (null != daterangeCreateTime && '' != daterangeCreateTime) {
    queryParams.value.params["beginCreateTime"] = daterangeCreateTime.value[0];
    queryParams.value.params["endCreateTime"] = daterangeCreateTime.value[1];
  }
  listReview(queryParams.value).then(response => {
    reviewList.value = response.rows;
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
    reviewId: null,
    recipeId: null,
    userId: null,
    nickName: null,
    review: null,
    createTime: null,
    pId: null,
    target: null,
    recipeName: null
  };
  proxy.resetForm("reviewRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeCreateTime.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.reviewId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加评论";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _reviewId = row.reviewId || ids.value
  getReview(_reviewId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改评论";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["reviewRef"].validate(valid => {
    if (valid) {
      if (form.value.reviewId != null) {
        updateReview(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addReview(form.value).then(response => {
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
  const _reviewIds = row.reviewId || ids.value;
  proxy.$modal.confirm('是否确认删除评论编号为"' + _reviewIds + '"的数据项？').then(function() {
    return delReview(_reviewIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('recipe/review/export', {
    ...queryParams.value
  }, `review_${new Date().getTime()}.xlsx`)
}

getList();
</script>
