import request from '@/utils/request'

// 查询食谱列表
export function listRecipe(query) {
  return request({
    url: '/recipe/recipe/list',
    method: 'get',
    params: query
  })
}

// 用户查询发布菜谱
export function userRecipeList(query) {
  return request({
    url: '/recipe/recipe/userRecipeList',
    method: 'get',
    params: query
  })
}

//按收藏量查询食谱列表
export function likeRecipe(query) {
  return request({
    url: '/recipe/recipe/likeRecipe',
    method: 'get',
    params: query
  })
}

//按评论量查询食谱列表
export function reviewRecipe(query) {
  return request({
    url: '/recipe/recipe/reviewRecipe',
    method: 'get',
    params: query
  })
}

// 查询食谱详细
export function getRecipe(recipeId) {
  return request({
    url: '/recipe/recipe/' + recipeId,
    method: 'get'
  })
}

// 新增食谱
export function addRecipe(data) {
  return request({
    url: '/recipe/recipe',
    method: 'post',
    data: data
  })
}

// 修改食谱
export function updateRecipe(data) {
  return request({
    url: '/recipe/recipe',
    method: 'put',
    data: data
  })
}

// 修改审核状态
export function updateState(data) {
  return request({
    url: '/recipe/recipe/state',
    method: 'put',
    data: data
  })
}

// 删除食谱
export function delRecipe(recipeId) {
  return request({
    url: '/recipe/recipe/' + recipeId,
    method: 'delete'
  })
}
