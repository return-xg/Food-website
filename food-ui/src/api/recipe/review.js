import request from '@/utils/request'

// 查询评论列表
export function listReview(query) {
  return request({
    url: '/recipe/review/list',
    method: 'get',
    params: query
  })
}

// 查询评论详细
export function getReview(reviewId) {
  return request({
    url: '/recipe/review/' + reviewId,
    method: 'get'
  })
}

// 新增评论
export function addReview(data) {
  return request({
    url: '/recipe/review',
    method: 'post',
    data: data
  })
}

// 修改评论
export function updateReview(data) {
  return request({
    url: '/recipe/review',
    method: 'put',
    data: data
  })
}

// 删除评论
export function delReview(reviewId) {
  return request({
    url: '/recipe/review/' + reviewId,
    method: 'delete'
  })
}

//通过食谱id查询评论列表
export function byRecipeId(recipeId) {
  return request({
    url: '/recipe/review/byRecipeId',
    method: 'get',
    params: {
      recipeId
    }
  })
}
