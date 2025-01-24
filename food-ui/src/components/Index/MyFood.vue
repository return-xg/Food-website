<template>
  <div class="week-hottest">
    <!-- <div> -->
    <span>今日推荐</span>
    <div class="column">
      <!-- <a>热菜</a>-->
      <!-- <a>凉菜</a>-->
      <!-- <a>主食</a>-->
      <!-- <a>小吃</a>-->
      <!-- <a>饮品</a>-->
      <!-- <a>家常食谱</a>-->
      <router-link to="/ShiPu">食谱首页</router-link>
    </div>
    <!-- </div> -->
    <hr />
    <div id="content1">
      <ul id="jxlist1" class="clearfix" v-loading="loading">
        <li class="item" v-for="recipe in recipeList" :key="recipe.id">
          <a class="cover br8">
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
                <el-tooltip effect="dark" :content="recipe.recipeDescription" placement="top" popper-class="custom-tooltip1">
                  <span class="small-black-text">
                    {{ recipe.recipeDescription ? recipe.recipeDescription.slice(0, 10) + '...' : '暂无描述' }}
                  </span>
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
  </div>
</template>


<script setup name="Recipe">
import { likeNumList, listRecipe } from "@/api/recipe/recipe";
import { likeSelect } from "@/api/recipe/likes.js";
import { isExternal } from "@/utils/validate";

const { proxy } = getCurrentInstance();
const { variety, recipe_state } = proxy.useDict('variety', 'recipe_state');

const recipeList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 8,
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
    const response = await likeNumList();
    console.log('API Response:', response); // 添加日志输出
    if (!response || !response.data) {
      console.warn('No data or invalid response received');
      recipeList.value = [];
      total.value = 0;
      return;
    }
    total.value = response.total || 0; // 确保 total 存在
    const recipeIds = response.data.map(row => row.recipeId);
    const likesResponses = await Promise.all(recipeIds.map(id => likeSelect(id)));
    recipeList.value = response.data.map((row, index) => {
      row.starred = likesResponses[index];
      return row;
    });
  } catch (error) {
    console.error('Error fetching data:', error);
  } finally {
    loading.value = false;
  }
}

function handleImageError(event) {
  event.target.src = '/path/to/default-image.jpg'; // 替换为默认图片路径
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

getList();
</script>


<style>
.week-hottest {
  margin: 0 auto;
  width: 1200px;
  position: relative;
  user-select: none;

  span:first-child {
    text-decoration: none;
    font-weight: 400;
    font-size: 20px;
    color: #130d0d;
    border-bottom: 5px solid #130d0d;
    padding-bottom: 3px;
    &:hover {
      color: #ff6767;
    }
  }
  .column {
    display: inline-block;
    position: absolute;
    right: 0;

    a {
      float: right;
      margin: 0 0 0 20px;
      font-size: 16px;
      line-height: 30px;
      &:hover {
        color: #ff6767;
      }
    }
  }

  .content {

    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    i{
      width: 230px;
    }
    .card {
      width: 230px;
      height: 305px;

      img {
        width: 100%;
        height: 100%;
        border-radius: 5px;
      }
      &:hover {
        div {
          width: 230px;
          height: 230px;

          overflow: hidden;
          text-align: center;


          img {

            width: 253px;
            height: 253px;
            border-radius: 5px;

            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
          }
        }
      }
      div {
        height: 230px;
        width: 230px;
        img {
          width: 100%;
          display: block;
        }
      }
      .title {
        font-size: 18px;
        line-height: 120%;
        padding: 8px 0 2px;
        text-align: center;
        display: block;
        &:hover {
          color: #ff6767;
        }
      }
      a {
        text-align: center;
        display: block;
        font-size: 12px;
        &:hover {
          color: #ff6767;
        }
      }
    }
  }
}

#content1 {
  width: 1300px;
  margin: 0 auto;
}

#jxlist1.clearfix{
  width: 1200px;
  zoom: 1;
}

#jxlist1 .clearfix:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  visibility: hidden;
}

#jxlist1 .item {
  float: left;
  width: 270px;
  height: 270px;
  overflow: hidden;
  margin: 0 20px 40px 0;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
  unicode-bidi: isolate;
}

#jxlist1 .cover {
  width: 250px;
  height: 200px;
  display: block;
  overflow: hidden;
  position: relative;
}

.relative {
  position: relative;
}

#jxlist1 .cookname {
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

.custom-tooltip1 {
  white-space: pre-wrap; /* 保留空白符并自动换行 */
  max-width: 300px; /* 设置最大宽度以防止过长 */
}

.br8 {
  border-radius: 8px;
}

.small-black-text {
  color: black !important;
  font-size: 12px !important;
  text-decoration: none !important;
  font-weight: normal !important;
  border-bottom: none !important;
  padding-bottom: 0 !important;
}

.hover-zoom {
  transition: transform 0.3s ease; /* 添加过渡效果 */
}

.hover-zoom:hover {
  transform: scale(1.1); /* 鼠标悬停时放大图片 */
}

</style>
