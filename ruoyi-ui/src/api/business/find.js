import request from '@/utils/request'

// 查询发现页管理列表
export function listFind(query) {
  return request({
    url: '/business/find/list',
    method: 'get',
    params: query
  })
}

// 查询发现页管理详细
export function getFind(id) {
  return request({
    url: '/business/find/' + id,
    method: 'get'
  })
}

// 新增发现页管理
export function addFind(data) {
  return request({
    url: '/business/find',
    method: 'post',
    data: data
  })
}

// 修改发现页管理
export function updateFind(data) {
  return request({
    url: '/business/find',
    method: 'put',
    data: data
  })
}

// 删除发现页管理
export function delFind(id) {
  return request({
    url: '/business/find/' + id,
    method: 'delete'
  })
}

// 导出发现页管理
export function exportFind(query) {
  return request({
    url: '/business/find/export',
    method: 'get',
    params: query
  })
}