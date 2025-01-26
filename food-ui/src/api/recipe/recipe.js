import request from '@/utils/request'

// 查询食谱列表
export function listRecipe(query) {
  return request({
    url: '/recipe/recipe/list',
    method: 'get',
    params: query
  })
}

// 查询审核通过食谱列表
export function listRecipeState1(query) {
  return request({
    url: '/recipe/recipe/listState1',
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

//最近收藏数量最高的八个菜谱
export function likeNumList() {
  return request({
    url: '/recipe/recipe/likeNumList',
    method: 'get',
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

// 根据食谱id查询用户信息
export function recipeByIdUser(recipeId) {
  return request({
    url: '/recipe/recipe/recipeByIdUser/' + recipeId,
    method: 'get'
  })
}

// 根据开始时间和结束时间查询每天增长的用户数量
export function getUserGrowthByDate(query) {
  return request({
    url: '/system/user/userGrowth',
    method: 'get',
    params: query
  })
}
