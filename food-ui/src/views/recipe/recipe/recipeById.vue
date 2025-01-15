<template>
  <div v-if="recipeDetail">
    <image-preview :src="recipeDetail.recipeImage" style="width: 690px; height: 390px; object-fit: cover;"/>
    <h1>{{ recipeDetail.recipeName }}</h1>
    <div>
      <p>{{ recipeDetail.likes }}点赞</p>
    </div>
    <div>
      <p>{{ recipeDetail.recipeDescription }}</p>
    </div>
    <div>
      <h2>{{ recipeDetail.recipeName }}的用料</h2>
      <el-table :data="ingredientList" ref="ingredient">
        <el-table-column label="食材名称" prop="ingredientName" width="260">
          <template #default="scope">
            {{ scope.row.ingredientName }}
          </template>
        </el-table-column>
        <el-table-column label="食材用量" prop="ingredientQuantity" width="260">
          <template #default="scope">
            {{ scope.row.ingredientQuantity }}
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div>
      <h2>{{ recipeDetail.recipeName }}的做法</h2>
      <el-table :data="stepList" ref="step">
        <el-table-column label="步骤" align="center" prop="stepNumber" width="60"/>
        <el-table-column label="操作内容" prop="stepDescription" width="260">
          <template #default="scope">
            {{ scope.row.stepDescription }}
          </template>
        </el-table-column>
        <el-table-column label="图片" prop="stepImage" width="260">
          <template #default="scope">
            <image-preview :src="scope.row.stepImage" :width="150" :height="150"/>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
  <div v-else>
    <p>加载中...</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { getRecipe } from '@/api/recipe/recipe'

const route = useRoute()
const recipeId = route.params.recipeId
const recipeDetail = ref(null)

const ingredientList = ref([]);
const stepList = ref([]);

onMounted(async () => {
  try {
    const response = await getRecipe(recipeId)
    recipeDetail.value = response.data
    // 确保 ingredientList 和 stepList 被正确赋值
    ingredientList.value = recipeDetail.value.ingredientList
    stepList.value = recipeDetail.value.stepList
    console.log(recipeDetail.value)
  } catch (error) {
    console.error('获取食谱详情失败', error)
  }
})
</script>

<style scoped lang="scss">
/* 你的样式 */
</style>
