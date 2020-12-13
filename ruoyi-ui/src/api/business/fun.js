import request from '@/utils/request'

// 查询个性功能列表
export function listFun(query) {
  return request({
    url: '/business/fun/list',
    method: 'get',
    params: query
  })
}

// 查询个性功能详细
export function getFun(id) {
  return request({
    url: '/business/fun/' + id,
    method: 'get'
  })
}

// 新增个性功能
export function addFun(data) {
  return request({
    url: '/business/fun',
    method: 'post',
    data: data
  })
}

// 修改个性功能
export function updateFun(data) {
  return request({
    url: '/business/fun',
    method: 'put',
    data: data
  })
}

// 删除个性功能
export function delFun(id) {
  return request({
    url: '/business/fun/' + id,
    method: 'delete'
  })
}

// 导出个性功能
export function exportFun(query) {
  return request({
    url: '/business/fun/export',
    method: 'get',
    params: query
  })
}