<template>
  <!-- 导航和轮播图 -->
  <div class="scroll">
    <!-- 轮播图部分 -->
    <el-carousel :interval="4000" type="card" height="400px">
      <el-carousel-item v-for="(recipe, index) in topLikes" :key="index">
        <router-link :to="{ name: 'RecipeById', params: { recipeId: recipe.recipeId } }">
          <img
              :src="getRealSrc(recipe.recipeImage)"
              width=100%
              height=100%
              :alt="recipe.recipeName + ' 的图片'"
              @error="handleImageError"
              class="hover-zoom"
          />
        </router-link>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
import { reactive, toRefs, onMounted } from 'vue';
import { threeLikes } from "@/api/recipe/likes.js";
import { isExternal } from "@/utils/validate";

export default {
  setup() {
    const data = reactive({
      topLikes: []
    });

    const { topLikes } = toRefs(data);

    // 获取收藏量最高的前三名食谱
    onMounted(() => {
      threeLikes().then(response => {
        data.topLikes = response.data; // 假设返回的数据结构为 { data: [...] }
      }).catch(error => {
        console.error('获取收藏量最高的前三名食谱失败', error);
      });
    });

    return {
      topLikes,
      getRealSrc,
      handleImageError
    };
  }
};

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

function handleImageError(event) {
  event.target.src = '/path/to/default-image.jpg'; // 替换为默认图片路径
}
</script>

<style lang="scss" scoped>
.scroll {
  margin: 0 auto 10px;
  width: 1200px;
  height: 432px;
  position: relative;
  // 轮播图部分
  .swiper {
    width: 100%;
    height: 100%;
    // 图片
    img {
      display: block;
      width: 100%;
      height: 100%;
    }
    // 前进后退按钮
    .swiper-button {
      width: 40px;
      height: 60px;
      color: #9c9b98;
      &:hover {
        background-color: #211d25;
      }
    }
    // 后退按钮
    .swiper-button-prev {
      left: 250px;
      z-index: 100;
    }
    // 前进按钮
    .swiper-button-next {
      right: 0;
    }
    // 圆点靠右
    .swiper-pagination {
      bottom: 5px;
      text-align: center;
    }
  }

  // 侧边栏部分
  .sidebar {
    height: 432px;
    display: flex;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;

    // 左侧栏目
    .column-left {
      padding-top: 40px;
      width: 250px;
      background-color: rgba(68, 68, 68, 0.4);

      > div {
        height: 70px;
        line-height: 70px;
        color: #ffffff;
        font-size: 1.1rem;
        // 导航项高亮
        &.active {
          background-color: #ff6767;
        }

        .column-left-item {
          margin: 0 95px 0 25px;
          span {
            padding-left: 5px;
          }
        }
      }
    }

    // 右侧栏目
    .column-right {
      box-shadow: 3px 2px 5px rgb(0 0 0 / 20%);
      width: 530px;
      height: 100%;

      > div {
        height: 100%;
        text-align: center;
        background-color: #ffffff;

        // 右侧栏目内容垂直居中
        .el-col {
          a {
            text-decoration: none;
            display: block;
            padding: 34px 0;
          }
          a:hover > h3 {
            color: #ff7474;
          }
          h3,
          p {
            padding: 0;
            margin: 0;
          }
          h3 {
            font-size: 1.1rem;
            color: #333;
            font-weight: 600;
          }
          p {
            font-size: 13px;
            color: #999999;
          }
        }
      }
    }
  }
}

.hover-zoom {
  transition: transform 0.3s ease; /* 添加过渡效果 */
}

.hover-zoom:hover {
  transform: scale(1.1); /* 鼠标悬停时放大图片 */
}
</style>
