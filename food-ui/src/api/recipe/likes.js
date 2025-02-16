import request from '@/utils/request'

// 查询点赞列表
export function listLikes(query) {
  return request({
    url: '/recipe/likes/list',
    method: 'get',
    params: query
  })
}

// 查询点赞列表
export function listLikes1(query) {
  return request({
    url: '/recipe/likes/list1',
    method: 'get',
    params: query
  })
}

// 统计一周以来点赞量最高的前三名食谱
export function threeLikes() {
  return request({
    url: '/recipe/likes/threeLike',
    method: 'get'
  })
}

// 用户查询收藏菜谱
export function listUserId() {
  return request({
    url: '/recipe/likes/userId',
    method: 'get',
  })
}

// 查询点赞详细
export function getLikes(likeId) {
  return request({
    url: '/recipe/likes/' + likeId,
    method: 'get'
  })
}

// 新增点赞
export function addLikes(data) {
  return request({
    url: '/recipe/likes',
    method: 'post',
    data: data
  })
}

// 取消点赞
export function likeDelete(data) {
  return request({
    url: '/recipe/likes/likeDelete',
    method: 'delete',
    data: data
  })
}

// 查询用户是否已经点赞
export function likeSelect(recipeId) {
  return request({
    url: `/recipe/likes/likeSelect?recipeId=${recipeId}`,
    method: 'get'
  })
}

// 修改点赞
export function updateLikes(data) {
  return request({
    url: '/recipe/likes',
    method: 'put',
    data: data
  })
}

// 删除点赞
export function delLikes(likeId) {
  return request({
    url: '/recipe/likes/' + likeId,
    method: 'delete'
  })
}
