<template>
  <div>
    <!-- 顶部导航 -->
<!--    <my-header />-->
    <my-nav/>
    <!-- MyBanner.vue -->
    <my-banner />

    <!-- MyMain.vue -->
    <my-main />

    <!-- MyFood.Vue -->
    <my-food />

    <!-- FoodMaterial.Vue -->
    <food-material />

    <!-- HotNote.Vue -->
    <hot-note />

    <!-- MyFooter.vue    -->
    <my-footer />
  </div>
</template>

<script>
import MyNav from '@/components/Index/MyNav.vue';
import FoodMaterial from "../components/Index/FoodMaterial.vue";
import HotNote from "../components/Index/HotNote.vue";
import MyBanner from "../components/Index/MyBanner.vue";
import MyFood from "../components/Index/MyFood.vue";
import MyFooter from "../components/Index/MyFooter.vue";
import MyHeader from "../components/Index/MyHeader.vue";
import MyMain from "../components/Index/MyMain.vue";
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
