import request from '@/utils/request'

// 查询歌曲类型列表
export function listSongtype(query) {
  return request({
    url: '/business/songtype/list',
    method: 'get',
    params: query
  })
}

// 查询歌曲类型详细
export function getSongtype(stId) {
  return request({
    url: '/business/songtype/' + stId,
    method: 'get'
  })
}

// 新增歌曲类型
export function addSongtype(data) {
  return request({
    url: '/business/songtype',
    method: 'post',
    data: data
  })
}

// 修改歌曲类型
export function updateSongtype(data) {
  return request({
    url: '/business/songtype',
    method: 'put',
    data: data
  })
}

// 删除歌曲类型
export function delSongtype(stId) {
  return request({
    url: '/business/songtype/' + stId,
    method: 'delete'
  })
}

// 导出歌曲类型
export function exportSongtype(query) {
  return request({
    url: '/business/songtype/export',
    method: 'get',
    params: query
  })
}