import request from '@/utils/request'

// 查询歌单收藏列表
export function listCollectiones(query) {
  return request({
    url: '/business/collectiones/list',
    method: 'get',
    params: query
  })
}

// 查询歌单收藏详细
export function getCollectiones(colId) {
  return request({
    url: '/business/collectiones/' + colId,
    method: 'get'
  })
}

// 新增歌单收藏
export function addCollectiones(data) {
  return request({
    url: '/business/collectiones',
    method: 'post',
    data: data
  })
}

// 修改歌单收藏
export function updateCollectiones(data) {
  return request({
    url: '/business/collectiones',
    method: 'put',
    data: data
  })
}

// 删除歌单收藏
export function delCollectiones(colId) {
  return request({
    url: '/business/collectiones/' + colId,
    method: 'delete'
  })
}

// 导出歌单收藏
export function exportCollectiones(query) {
  return request({
    url: '/business/collectiones/export',
    method: 'get',
    params: query
  })
}