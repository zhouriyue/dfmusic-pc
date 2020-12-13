import request from '@/utils/request'

// 查询轮播图管理列表
export function listBanners(query) {
  return request({
    url: '/business/banners/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图管理详细
export function getBanners(id) {
  return request({
    url: '/business/banners/' + id,
    method: 'get'
  })
}

// 新增轮播图管理
export function addBanners(data) {
  return request({
    url: '/business/banners',
    method: 'post',
    data: data
  })
}

// 修改轮播图管理
export function updateBanners(data) {
  return request({
    url: '/business/banners',
    method: 'put',
    data: data
  })
}

// 删除轮播图管理
export function delBanners(id) {
  return request({
    url: '/business/banners/' + id,
    method: 'delete'
  })
}

// 导出轮播图管理
export function exportBanners(query) {
  return request({
    url: '/business/banners/export',
    method: 'get',
    params: query
  })
}