import request from '@/utils/request'

// 查询订单管理列表
export function getOrderTotal() {
  return request({
    url: '/business/order/getOrderTotal',
    method: 'get',
  })
}

// 查询订单管理列表
export function getScopeOrder(query) {
  return request({
    url: '/business/order/getScopeOrder',
    method: 'get',
    params: query
  })
}

// 查询订单管理列表
export function listOrder(query) {
  return request({
    url: '/business/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单管理详细
export function getOrder(oId) {
  return request({
    url: '/business/order/' + oId,
    method: 'get'
  })
}

// 新增订单管理
export function addOrder(data) {
  return request({
    url: '/business/order',
    method: 'post',
    data: data
  })
}

// 修改订单管理
export function updateOrder(data) {
  return request({
    url: '/business/order',
    method: 'put',
    data: data
  })
}

// 删除订单管理
export function delOrder(oId) {
  return request({
    url: '/business/order/' + oId,
    method: 'delete'
  })
}

// 导出订单管理
export function exportOrder(query) {
  return request({
    url: '/business/order/export',
    method: 'get',
    params: query
  })
}
