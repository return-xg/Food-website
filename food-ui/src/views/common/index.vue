<template>
  <div>
    <!-- 顶部导航 -->
    <my-header />
    <my-nav/>

    <!-- 轮播图 -->
    <my-banner />

    <!-- 今日推荐 -->
    <my-food />

    <!-- 时令食材 -->
    <!-- <food-material /> -->

    <!-- 每周精选 -->
    <food-week />

    <!-- 底部 -->
    <my-footer />
    <!-- 个性化推荐 -->
    <div id="recommendation-box">
      <div>猜你喜欢</div>
      <ul v-if="recommendations.length">
        <li v-for="recommendation in recommendations" :key="recommendation.recipeId" class="recommendation-item">
          <a>
            <router-link :to="{ name: 'RecipeById', params: { recipeId: recommendation.recipeId } }">
              <img
                  :src="getRealSrc(recommendation.recipeImage)"
                  width="35"
                  height="35"
                  :alt="recommendation.recipeName + ' 的图片'"
                  @error="handleImageError"
                  class="hover-zoom"
                  style="border-radius: 5px;"
              />
            </router-link>
          </a>
          <div class="recipe-details">
            <router-link :to="{ name: 'RecipeById', params: { recipeId: recommendation.recipeId } }">
              <p class="recipe-name">{{ recommendation.recipeName }}</p>
            </router-link>
            <router-link :to="{ name: 'RecipeById', params: { recipeId: recommendation.recipeId } }">
              <p class="recipe-desc">{{ recommendation.recipeDescription ? recommendation.recipeDescription.slice(0, 8) + '...' : '暂无描述' }}</p>
            </router-link>
          </div>
        </li>
      </ul>
      <p v-else>暂无推荐</p>
    </div>
  </div>
</template>

<script>
import MyNav from '@/components/Index/MyNav.vue';
import FoodMaterial from "../../components/Index/FoodMaterial.vue";
import HotNote from "../../components/Index/HotNote.vue";
import MyBanner from "../../components/Index/MyBanner.vue";
import MyFood from "../../components/Index/MyFood.vue";
import MyFooter from "../../components/Index/MyFooter.vue";
import MyHeader from "../../components/Index/MyHeader.vue";
import MyMain from "../../components/Index/MyMain.vue";
import FoodWeek from "@/components/Index/FoodWeek.vue";
import { getRecommendations } from '@/api/recipe/recipe';
import useUserStore from '@/store/modules/user';
import { isExternal } from "@/utils/validate";

export default {
  components: {
    MyHeader,
    MyMain,
    MyFood,
    FoodMaterial,
    HotNote,
    MyFooter,
    MyBanner,
    MyNav,
    FoodWeek,
  },
  data() {
    return {
      recommendations: [],
    };
  },
  mounted() {
    this.fetchRecommendations();
  },
  methods: {
    async fetchRecommendations() {
      try {
        const userId = useUserStore().id;
        if (userId) {
          const response = await getRecommendations(userId);
          if (response.code === 200) {
            this.recommendations = response.data;
          } else {
            console.error('Failed to fetch recommendations:', response.msg);
          }
        }
      } catch (error) {
        console.error('Failed to fetch recommendations:', error);
      }
    },
    handleImageError(event) {
      event.target.src = '/path/to/default-image.jpg'; // 替换为默认图片路径
    },
    getRealSrc(src) {
      if (!src) {
        return "";
      }
      let real_src = src.split(",")[0];
      if (isExternal(real_src)) {
        return real_src;
      }
      return import.meta.env.VITE_APP_BASE_API + real_src;
    }
  },
};
</script>

<style lang="scss" scoped>
#recommendation-box {
  position: fixed;
  top: 10%;
  right: 10px;
  width: 150px;
  height: auto;
  background-color: #fff;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  padding: 15px;
  overflow-y: auto;
  max-height: 80vh;
  display: flex;
  flex-direction: column;
}

#recommendation-box > div:first-child {
  text-align: center;
  margin-bottom: 1px;
}

#recommendation-box ul {
  list-style-type: none;
  padding: 0;
}

#recommendation-box li {
  margin-bottom: 1px;
  display: flex;
  align-items: center; /* 垂直居中对齐 */
  gap: 10px;
}

.recipe-details {
  text-align: left;
  flex: 1;
}

.recipe-name {
  font-size: 14px;
  color: #333;
  margin-bottom: 5px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.recipe-desc {
  font-size: 12px;
  color: #666;
  line-height: 1.1;
  height: 14px;
  overflow: hidden;
}

.recommendation-item {
  display: flex;
  align-items: center; /* 垂直居中对齐 */
  gap: 15px;
}
</style>
