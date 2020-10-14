import request from '@/utils/request'

// 查询歌单类型管理列表
export function listSonglisttype(query) {
  return request({
    url: '/business/songlisttype/list',
    method: 'get',
    params: query
  })
}

// 查询歌单类型管理详细
export function getSonglisttype(sltId) {
  return request({
    url: '/business/songlisttype/' + sltId,
    method: 'get'
  })
}

// 新增歌单类型管理
export function addSonglisttype(data) {
  return request({
    url: '/business/songlisttype',
    method: 'post',
    data: data
  })
}

// 修改歌单类型管理
export function updateSonglisttype(data) {
  return request({
    url: '/business/songlisttype',
    method: 'put',
    data: data
  })
}

// 删除歌单类型管理
export function delSonglisttype(sltId) {
  return request({
    url: '/business/songlisttype/' + sltId,
    method: 'delete'
  })
}

// 导出歌单类型管理
export function exportSonglisttype(query) {
  return request({
    url: '/business/songlisttype/export',
    method: 'get',
    params: query
  })
}