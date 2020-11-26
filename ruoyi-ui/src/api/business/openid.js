import request from '@/utils/request'

// 查询一键登录关联列表
export function listOpenid(query) {
  return request({
    url: '/business/openid/list',
    method: 'get',
    params: query
  })
}

// 查询一键登录关联详细
export function getOpenid(id) {
  return request({
    url: '/business/openid/' + id,
    method: 'get'
  })
}

// 新增一键登录关联
export function addOpenid(data) {
  return request({
    url: '/business/openid',
    method: 'post',
    data: data
  })
}

// 修改一键登录关联
export function updateOpenid(data) {
  return request({
    url: '/business/openid',
    method: 'put',
    data: data
  })
}

// 删除一键登录关联
export function delOpenid(id) {
  return request({
    url: '/business/openid/' + id,
    method: 'delete'
  })
}

// 导出一键登录关联
export function exportOpenid(query) {
  return request({
    url: '/business/openid/export',
    method: 'get',
    params: query
  })
}