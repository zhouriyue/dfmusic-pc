import request from '@/utils/request'

// 查询支付管理列表
export function listPayments(query) {
  return request({
    url: '/business/payments/list',
    method: 'get',
    params: query
  })
}

// 查询支付管理详细
export function getPayments(paId) {
  return request({
    url: '/business/payments/' + paId,
    method: 'get'
  })
}

// 新增支付管理
export function addPayments(data) {
  return request({
    url: '/business/payments',
    method: 'post',
    data: data
  })
}

// 修改支付管理
export function updatePayments(data) {
  return request({
    url: '/business/payments',
    method: 'put',
    data: data
  })
}

// 删除支付管理
export function delPayments(paId) {
  return request({
    url: '/business/payments/' + paId,
    method: 'delete'
  })
}

// 导出支付管理
export function exportPayments(query) {
  return request({
    url: '/business/payments/export',
    method: 'get',
    params: query
  })
}