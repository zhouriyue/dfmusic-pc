import request from '@/utils/request'

// 查询评论管理列表
export function listComment(query) {
  return request({
    url: '/business/comment/list',
    method: 'get',
    params: query
  })
}

// 查询评论管理详细
export function getComment(comId) {
  return request({
    url: '/business/comment/' + comId,
    method: 'get'
  })
}

// 新增评论管理
export function addComment(data) {
  return request({
    url: '/business/comment',
    method: 'post',
    data: data
  })
}

// 修改评论管理
export function updateComment(data) {
  return request({
    url: '/business/comment',
    method: 'put',
    data: data
  })
}

// 删除评论管理
export function delComment(comId) {
  return request({
    url: '/business/comment/' + comId,
    method: 'delete'
  })
}

// 导出评论管理
export function exportComment(query) {
  return request({
    url: '/business/comment/export',
    method: 'get',
    params: query
  })
}