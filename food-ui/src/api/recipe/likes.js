import request from '@/utils/request'

// 查询点赞列表
export function listLikes(query) {
  return request({
    url: '/recipe/likes/list',
    method: 'get',
    params: query
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
