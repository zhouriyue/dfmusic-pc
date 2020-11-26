import request from '@/utils/request'

// 查询套餐信息管理列表
export function listSet_meal(query) {
  return request({
    url: '/business/set_meal/list',
    method: 'get',
    params: query
  })
}

// 查询套餐信息管理详细
export function getSet_meal(smId) {
  return request({
    url: '/business/set_meal/' + smId,
    method: 'get'
  })
}

// 新增套餐信息管理
export function addSet_meal(data) {
  return request({
    url: '/business/set_meal',
    method: 'post',
    data: data
  })
}

// 修改套餐信息管理
export function updateSet_meal(data) {
  return request({
    url: '/business/set_meal',
    method: 'put',
    data: data
  })
}

// 删除套餐信息管理
export function delSet_meal(smId) {
  return request({
    url: '/business/set_meal/' + smId,
    method: 'delete'
  })
}

// 导出套餐信息管理
export function exportSet_meal(query) {
  return request({
    url: '/business/set_meal/export',
    method: 'get',
    params: query
  })
}