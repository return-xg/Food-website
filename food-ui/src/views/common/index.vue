<template>
  <div>
    <!-- 顶部导航 -->
    <my-header />
    <my-nav/>

    <!--    轮播图-->
    <my-banner />

<!--    <my-main />-->

    <!--    今日推荐-->
    <my-food />

    <!--    时令食材-->
    <food-material />

    <!--    笔记-->
    <hot-note />

    <!--    底部-->
    <my-footer />
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
  },
};
</script>

<style lang="scss" scoped></style>
