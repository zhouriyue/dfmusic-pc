import request from '@/utils/request'

// 查询歌单列表
export function listSonglist(query) {
  return request({
    url: '/business/songlist/list',
    method: 'get',
    params: query
  })
}

// 查询歌单详细
export function getSonglist(slId) {
  return request({
    url: '/business/songlist/' + slId,
    method: 'get'
  })
}

// 新增歌单
export function addSonglist(data) {
  return request({
    url: '/business/songlist',
    method: 'post',
    data: data
  })
}

// 修改歌单
export function updateSonglist(data) {
  return request({
    url: '/business/songlist',
    method: 'put',
    data: data
  })
}

// 删除歌单
export function delSonglist(slId) {
  return request({
    url: '/business/songlist/' + slId,
    method: 'delete'
  })
}

// 导出歌单
export function exportSonglist(query) {
  return request({
    url: '/business/songlist/export',
    method: 'get',
    params: query
  })
}