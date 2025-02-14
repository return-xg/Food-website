<template>
  <my-header/>
  <div id="content3" class="recipe-content clearfix">
    <div id="left" v-if="recipeDetail">
      <image-preview :src="recipeDetail.recipeImage" style="width: 690px; height: 390px; object-fit: cover;"/>
      <div class="rinfo relative">
        <h1 class="title text-lips" style="display: inline-block;">{{ recipeDetail.recipeName }}</h1>
        <div class="vcnum relative">
          <span>{{ recipeDetail.likes }}</span>
          收藏
          <div class="absolute operate">
            <a class="btn-collect" :class="{ hascoll: recipeDetail.starred }" data-status="0"
               @click="star(recipeDetail)">
              {{ recipeDetail.collectText }}
            </a>
          </div>
        </div>
        <div class="clearfix aut-info relative">
          <div class="clearfix left">
            <a class="author-img left">
              <image-preview class="br50" :src="authorInfo.avatar" alt="作者头像" width="30" height="30"/>
            </a>
            <div class="author-info left">
              <a class="nickname text-lips" target="_blank">{{ authorInfo.nickname }}</a>
            </div>
          </div>
        </div>
        <p class="intro" style="white-space: pre-line;">
          <br>
          {{ recipeDetail.recipeDescription }}
        </p>
      </div>
      <!-- 材料 -->
      <div class="metarial">
        <h2 class="mini-title">{{ recipeDetail.recipeName }}的用料</h2>
        <table width="690" border="0" cellspacing="0" cellpadding="0" class="retamr br81">
          <tbody>
          <tr v-for="(pair, rowIndex) in pairedIngredients" :key="rowIndex">
            <td class="lirre br81" style="border-top: 0;">
          <span class="scname">
            <a target="_blank">{{ pair[0]?.ingredientName }}</a>
          </span>
              <span class="right scnum">{{ pair[0]?.ingredientQuantity }}</span>
            </td>
            <td class="lirre br81" style="border-top: 0;" v-if="pair[1]">
          <span class="scname">
            <a target="_blank">{{ pair[1].ingredientName }}</a>
          </span>
              <span class="right scnum">{{ pair[1].ingredientQuantity }}</span>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <!--      步骤-->
      <div class="step">
        <h2 class="mini-title">{{ recipeDetail.recipeName }}的做法</h2>
        <div class="stepcont clearfix" v-for="(step, index) in stepList" :key="index">
          <a class="cboxElement cboxElement2">
            <image-preview :src="step.stepImage" :width="200" :height="200"/>
          </a>
          <div class="stepinfo">
            <p>步骤{{ step.stepNumber }}</p>
            {{ step.stepDescription }}
          </div>
        </div>
      </div>
      <!--      评论-->
      <div id="comment" class="comment">
        <div class="comment-text">
          <h2 class="mini-title">评论</h2>
          <div class="in-comment clearfix1">
            <textarea class="comm-txt left" id="commentContent"></textarea>
            <a class="comm-btn" @click="comment">发表评论</a>
          </div>
        </div>
      </div>

<!--      评论列表-->
      <div id="comment" class="comment">
        <div class="mini-title" style="margin: 10px 0; font-size: 21px; padding: 10px 0; border-bottom: 1px solid #ccc; text-align: left">
          评论列表
        </div>
        <div style="margin: 20px 0; text-align: left">
          <div style="padding: 10px 0;" v-for="item in reviews" :key="item.reviewId">
            <div style="display : flex">
              <div style="width: 80px">
                <image-preview class="br500" :src="item.avatar"/>
              </div>
              <div style="flex: 1">
                <div>{{ item.nickName }}</div>
                <div style="margin-top: 10px; color: #666; max-width: 610px; overflow-wrap: break-word;">
                  <span v-if="!item.isExpanded">{{ item.review.slice(0, 136) }}</span>
                  <span v-else>{{ item.review }}</span>
                </div>
                <div v-if="item.review.length > 136" style="margin-top: 5px; cursor: pointer; color: #666;"
                     @click="toggleReview(item)">
                  {{ item.isExpanded ? '收起' : '...展开' }}
                </div>
                <div style="margin-top: 10px; color: #666">{{ item.createTime }}</div>
                <div>
                  <el-button type="text" @click="reply(item.reviewId, item.nickName)">回复</el-button>
                  <el-button v-if="item.userId === currentUserId" type="text" @click="confirmDelete(item.reviewId)">删除</el-button>
                </div>
                <!--                回复列表-->
                <div v-if="item.children.length"
                     style="margin-left: 40px; background-color: aliceblue; padding: 25px; border-radius: 10px">
                  <div v-for="sub in item.children.slice(0, expandedReplies[item.reviewId] ? item.children.length : 1)"
                       :key="sub.reviewId">
                    <div style="padding: 5px 0; max-width: 520px; overflow-wrap: break-word;">
                      <span style="cursor: pointer" @click="reply(sub.pId, sub.nickName)"> {{ sub.nickName }} </span>
                      <span> 回复 <span style="color: cornflowerblue">@{{ sub.target }} </span></span>
                      <div style="margin-top: 5px;">
                        <span style="color: #666;">
                          <span v-if="!sub.isExpanded">{{ sub.review.slice(0, 116) }}</span>
                          <span v-else>{{ sub.review }}</span>
                        </span>
                      </div>
                      <div v-if="sub.review.length > 116" style="margin-top: 5px; cursor: pointer; color: #666;"
                           @click="toggleSubReview(sub)">
                        {{ sub.isExpanded ? '收起' : '...展开' }}
                      </div>
                    </div>
                    <div style="font-size: 13px; color: #666; margin-top: 3px">
                      {{ sub.createTime }}
                    </div>
                    <div v-if="sub.userId === currentUserId" style="margin-top: 5px;">
                      <el-button type="text" @click="confirmDelete(sub.reviewId)">删除</el-button>
                    </div>
                  </div>
                  <div v-if="item.children.length > 1" style="margin-top: 10px; cursor: pointer; color: #666;"
                       @click="toggleReplies(item.reviewId)">
                    {{ expandedReplies[item.reviewId] ? '收起回复' : '查看所有回复' }}
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>

<!--      回复弹窗-->
      <el-dialog title="回复" v-model="dialogFormVisible" width="40%">
        <el-form :model="review">
          <el-form-item label="内容" :label-width="100">
            <textarea v-model="review.review" placeholder="请输入回复内容" autocomplete="off"
                      style="width: 90%; height: 300px"></textarea>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveReply">确 定</el-button>
        </div>
      </el-dialog>

    </div>
  </div>
</template>

<script setup>
import {ref, onMounted, computed} from 'vue'
import {useRoute} from 'vue-router'
import {getRecipe, recipeByIdUser} from '@/api/recipe/recipe'
import MyHeader from "@/components/Index/MyHeader.vue";
import {addLikes, likeDelete, likeSelect} from "@/api/recipe/likes.js";
import {addReview, byRecipeId, delReview} from '@/api/recipe/review.js';
import {ElMessage, ElMessageBox} from 'element-plus'
import useUserStore from "@/store/modules/user.js";

const route = useRoute()
const recipeId = route.params.recipeId
const recipeDetail = ref(null)
const ingredientList = ref([]);
const stepList = ref([]);
const authorInfo = ref({avatar: '', nickname: ''});
const reviews = ref([]);
const dialogFormVisible = ref(false);
const review = ref({
  pId: null,
  target: '',
  review: ''
});
const expandedReplies = ref({});
const currentUserId = ref(null);

//获取当前登录用户的ID
function fetchCurrentUserId() {
  currentUserId.value = useUserStore().id;
}

// 初始化展开状态
reviews.value.forEach(item => {
  expandedReplies.value[item.reviewId] = false;
});

function toggleReview(item) {
  item.isExpanded = !item.isExpanded;
}


function toggleReplies(reviewId) {
  expandedReplies.value[reviewId] = !expandedReplies.value[reviewId];
}

function toggleSubReview(sub) {
  sub.isExpanded = !sub.isExpanded;
}

async function fetchRecipeDetails() {
  try {
    const response = await getRecipe(recipeId)
    recipeDetail.value = response.data
    // 确保 ingredientList 和 stepList 被正确赋值
    ingredientList.value = recipeDetail.value.ingredientList
    stepList.value = recipeDetail.value.stepList

    // 获取作者信息
    const authorResponse = await recipeByIdUser(recipeId);
    authorInfo.value.avatar = authorResponse.data.avatar;
    authorInfo.value.nickname = authorResponse.data.nickName;

    // 初始化收藏状态和文本
    recipeDetail.value.starred = await likeSelect(recipeId);
    recipeDetail.value.collectText = recipeDetail.value.starred ? '已收藏' : '收藏';

    console.log('recipeDetail:', recipeDetail.value)
    console.log('ingredientList:', ingredientList.value)
    console.log('stepList:', stepList.value)
    console.log('authorInfo:', authorInfo.value)

    byRecipeId(recipeId).then(response => {
      reviews.value = response.map(item => ({
        ...item,
        isExpanded: false, // 初始状态为折叠
        children: item.children.map(child => ({
          ...child,
          isExpanded: false // 初始状态为折叠
        }))
      }));
      console.log('Reviews:', reviews.value); // 添加这行调试信息
    })
  } catch (error) {
    console.error('获取食谱详情失败', error)
  }
}

onMounted(() => {
  fetchRecipeDetails();
  fetchCurrentUserId();
})

const pairedIngredients = computed(() => {
  const pairs = [];
  for (let i = 0; i < ingredientList.value.length; i += 2) {
    pairs.push(ingredientList.value.slice(i, i + 2));
  }
  return pairs;
});

/** 点赞按钮操作 */
function star(row) {
  const _recipeIds = row.recipeId || ids.value;
  const likesData = {recipeId: _recipeIds};

  likeSelect(_recipeIds).then(response => {
    // 检查用户是否已经点赞了该菜谱
    const isLiked = response;

    if (isLiked) {
      // 如果已经点赞，则取消点赞
      likeDelete(likesData);
      // 移除 starred 类
      row.starred = false;
      // 减少 likes 数量
      row.likes -= 1;
    } else {
      // 如果没有点赞，则进行点赞
      addLikes(likesData);
      // 添加 starred 类
      row.starred = true;
      // 增加 likes 数量
      row.likes += 1;
    }

    // 更新收藏按钮文本
    row.collectText = row.starred ? '已收藏' : '收藏';
  });
}

/** 评论按钮操作 */
function comment() {
  const commentContent = document.getElementById('commentContent').value;
  if (commentContent.trim() === '') {
    ElMessage.error('评论内容不能为空')
    return;
  }

  if (commentContent.length >= 1000) {
    ElMessage.error('评论内容不能超过1000字')
    return;
  }


  // 获取当前食谱的 ID
  const recipeId = route.params.recipeId;

  // 调用 addReview 函数并传入食谱 ID 和评论内容
  addReview({recipeId, review: commentContent})
      .then(response => {
        ElMessage.success('评论成功');
        // 刷新评论列表
        fetchRecipeDetails();
      })
      .catch(error => {
        ElMessage.error('评论失败');
      });
}

/** 回复按钮操作 */
function reply(pId, target) {
  review.value = {pId, target, review: ''}; // 清空回复内容
  dialogFormVisible.value = true;
  console.log('dialogFormVisible set to true:', dialogFormVisible.value);
}

/** 回复保存按钮操作 */
function saveReply() {
  const reviewContent = review.value.review;

  if (reviewContent.trim() === '') {
    ElMessage.error('回复内容不能为空');
    return;
  }

  if (reviewContent.length >= 1000) {
    ElMessage.error('回复内容不能超过1000字');
    return;
  }

  if (review.value.pId === null || review.value.pId === undefined) {
    ElMessage.error('回复目标ID无效');
    return;
  }

  addReview({recipeId, review: reviewContent, pId: review.value.pId, target: review.value.target})
      .then(response => {
        ElMessage.success('回复成功');
        dialogFormVisible.value = false; // 关闭对话框
        fetchRecipeDetails(); // 刷新评论列表
      })
      .catch(error => {
        ElMessage.error('回复失败');
      });
}

/** 删除评论或回复 */
function confirmDelete(reviewId) {
  ElMessageBox.confirm('确定要删除该评论吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    delReview(reviewId)
        .then(response => {
          ElMessage.success('删除成功');
          fetchRecipeDetails(); // 刷新评论列表
        })
        .catch(error => {
          ElMessage.error('删除失败');
        });
  }).catch(() => {
    // 用户取消删除操作
  });
}
</script>

<style scoped lang="scss">

#content3 {
  width: 1000px;
  margin: 0 auto;
}

#content3.recipe-content {
  margin-top: 30px;
}

#content3.clearfix {
  zoom: 1;
}

#content3.clearfix:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  visibility: hidden;
}

#left {
  width: 690px;
  float: left;
}

.rinfo {
  margin-top: 20px;
  padding: 9px 0 40px;
}

.relative {
  position: relative;
}

.rinfo .title {
  font-size: 22px;
  color: #333;
  font-weight: bold;
  line-height: 24px;
}

.text-lips {
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

.vcnum {
  font-size: 13px;
  color: #333;
  margin-top: 20px;
}

.vcnum span {
  font-size: 24px;
  color: #FFB31A;
  position: relative;
  top: 2px;
}

.rinfo .aut-info {
  font-size: 16px;
  color: #666;
  margin: 25px 0;
}

.left {
  float: left;
}

.br50 {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}

.br500 {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.rinfo .author-info {
  font-size: 16px;
  color: #666;
  margin-left: 6px;
  position: relative;
  margin-right: 20px;
}

.rinfo .nickname {
  font-size: 13px;
  color: #333;
  display: inline-block;
  line-height: 30px;
  vertical-align: middle;
}

.text-lips {
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

.rinfo .intro {
  font-size: 15px;
  color: #333;
  line-height: 27px;
}

.metarial {
  padding-bottom: 40px;
}

.mini-title {
  font-size: 18px;
  color: #333;
  line-height: 18px;
  font-weight: bold;
  margin: 30px 0 20px;
}

.br81 {
  border-radius: 8px;
}

.metarial .lirre {
  width: 343px;
  border-right: 1px solid #e5e5e5;
}

.metarial .scname {
  display: inline-block;
  width: 254px;
  padding-right: 5px;
}

.right {
  float: right;
}

.metarial .scnum {
  display: inline-block;
  max-width: 90px;
  text-align: right;
  padding-left: 0;
}

.metarial tr {
  background: #F1F7FA;
  color: #333;
}

.metarial td {
  border-top: 1px solid #e5e5e5 !important;
  padding: 16px 0;
  width: 344px;
}

.metarial span {
  padding: 0 18px;
  font-size: 15px;
}

.stepcont {
  margin: 25px 0 40px;
}

.stepcont a {
  float: left;
}

.stepcont .stepinfo {
  float: left;
  padding: 0;
  width: 480px;
  word-wrap: break-word;
  margin-left: 10px;
  font-size: 15px;
  color: #333;
  line-height: 27px;
  overflow: hidden;
}

.stepcont .stepinfo p {
  font-weight: bold;
}

.absolute {
  position: absolute;
}

.operate {
  right: 0;
  display: inline-block;
  top: -3px;
}

.operate .btn-collect {
  display: inline-block;
  width: 80px;
  height: 34px;
  border-radius: 4px;
  color: #fff;
  border: 1px solid #FFB31A;
  font-size: 15px;
  text-align: center;
  line-height: 32px;
  background: #FFB31A url(../../../assets/images/star1.png?1) no-repeat 15px 10px;
  padding-left: 20px;
}

.operate .hascoll {
  background: #FFB31A url(../../../assets/images/star2.png?1) no-repeat 7px 10px;
  padding-left: 17px;
}

a {
  color: #333;
  text-decoration: none;
}

* {
  box-sizing: border-box;
}

#comment .in-comment {
  padding-bottom: 20px;
  position: relative;
}

#comment .in-comment .author-img {
  width: 30px;
  height: 30px;
  margin-right: 12px;
  overflow: hidden;
}

#comment .author-img, .author-comment {
  float: left;
}

#comment .in-comment .comm-txt {
  width: 690px;
  height: 112px;
  resize: none;
  padding: 12px;
  border: 1px solid #E5E3DF;
  border-radius: 4px;
}

#comment .in-comment > .comm-btn {
  float: right;
  color: #FFB31A;
  right: 0;
  margin-top: 10px;
  display: inline-block;
  border-radius: 4px;
  height: 34px;
  width: 104px;
  text-align: center;
  line-height: 34px;
  font-size: 15px;
  border: 1px solid #FFB31A;
}

.clearfix1 {
  zoom: 1;
  width: 690px;
}

.clearfix1:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  visibility: hidden;
}

</style>
