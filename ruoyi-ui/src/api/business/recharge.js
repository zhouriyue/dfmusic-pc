import request from '@/utils/request'

// 查询充值管理列表
export function listRecharge(query) {
  return request({
    url: '/business/recharge/list',
    method: 'get',
    params: query
  })
}

// 查询充值管理详细
export function getRecharge(recId) {
  return request({
    url: '/business/recharge/' + recId,
    method: 'get'
  })
}

// 新增充值管理
export function addRecharge(data) {
  return request({
    url: '/business/recharge',
    method: 'post',
    data: data
  })
}

// 修改充值管理
export function updateRecharge(data) {
  return request({
    url: '/business/recharge',
    method: 'put',
    data: data
  })
}

// 删除充值管理
export function delRecharge(recId) {
  return request({
    url: '/business/recharge/' + recId,
    method: 'delete'
  })
}

// 导出充值管理
export function exportRecharge(query) {
  return request({
    url: '/business/recharge/export',
    method: 'get',
    params: query
  })
}