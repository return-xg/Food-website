<template>
  <my-header />
  <div id="content" class="recipe-content clearfix">
    <div id="left" v-if="recipeDetail">
      <image-preview :src="recipeDetail.recipeImage" style="width: 690px; height: 390px; object-fit: cover;"/>
      <div class="rinfo relative">
        <h1 class="title text-lips" style="display: inline-block;">{{ recipeDetail.recipeName }}</h1>
        <div class="vcnum relative">
          <span>{{ recipeDetail.likes }}</span>
          收藏
          <div class="absolute operate">
            <a class="btn-collect" :class="{ hascoll: recipeDetail.starred }" data-status="0" @click="star(recipeDetail)">
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
          <div class="in-comment clearfix">
            <div class="author-img">
              <image-preview class="br50" alt="头像" width="30" height="30"/>
            </div>
            <textarea class="comm-txt left" id="commentContent"></textarea>
            <a class="comm-btn" @click="comment">发表评论</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>import {ref, onMounted, computed} from 'vue'
import {useRoute} from 'vue-router'
import {getRecipe, recipeByIdUser} from '@/api/recipe/recipe'
import MyHeader from "@/components/Index/MyHeader.vue";
import {addLikes, likeDelete, likeSelect} from "@/api/recipe/likes.js";
import { addReview } from '@/api/recipe/review.js';
import { ElMessage } from 'element-plus'

const route = useRoute()
const recipeId = route.params.recipeId
const recipeDetail = ref(null)
const ingredientList = ref([]);
const stepList = ref([]);
const authorInfo = ref({ avatar: '', nickname: '' });

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
  } catch (error) {
    console.error('获取食谱详情失败', error)
  }
}

onMounted(() => {
  fetchRecipeDetails();
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
  const likesData = { recipeId: _recipeIds };

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

  if (commentContent.length >= 1000 ) {
    ElMessage.error('评论内容不能超过1000字')
    return;
  }


  // 获取当前食谱的 ID
  const recipeId = route.params.recipeId;

  // 调用 addReview 函数并传入食谱 ID 和评论内容
  addReview({ recipeId, review: commentContent })
      .then(response => {
        ElMessage.success('评论成功');
        // 可以在这里添加其他逻辑，比如刷新评论列表
      })
      .catch(error => {
        ElMessage.error('评论失败');
      });
}
</script>

<style scoped lang="scss">

#content {
  width: 1000px;
  margin: 0 auto;
}

#content.recipe-content {
  margin-top: 30px;
}

.clearfix {
  zoom: 1;
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
  width: 648px;
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

</style>
