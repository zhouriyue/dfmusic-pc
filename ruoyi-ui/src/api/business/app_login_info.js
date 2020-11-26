import request from '@/utils/request'

// 查询登录信息列表
export function getTodayActivityNumber() {
  return request({
    url: '/business/app_login_info/getTodayActivityNumber',
    method: 'get'
  })
}

// 查询登录信息列表
export function listApp_login_info(query) {
  return request({
    url: '/business/app_login_info/list',
    method: 'get',
    params: query
  })
}

// 查询登录信息详细
export function getApp_login_info(loId) {
  return request({
    url: '/business/app_login_info/' + loId,
    method: 'get'
  })
}

// 新增登录信息
export function addApp_login_info(data) {
  return request({
    url: '/business/app_login_info',
    method: 'post',
    data: data
  })
}

// 修改登录信息
export function updateApp_login_info(data) {
  return request({
    url: '/business/app_login_info',
    method: 'put',
    data: data
  })
}

// 删除登录信息
export function delApp_login_info(loId) {
  return request({
    url: '/business/app_login_info/' + loId,
    method: 'delete'
  })
}

// 导出登录信息
export function exportApp_login_info(query) {
  return request({
    url: '/business/app_login_info/export',
    method: 'get',
    params: query
  })
}
