import request from '@/utils/request'

// 查询歌手专辑列表
export function selectFristPySinName(query) {
  return request({
    url: '/business/singer/selectFristPySinName',
    method: 'get',
    params: query
  })
}
// 查询歌手专辑列表
export function selectSingerAlbum(query) {
  return request({
    url: '/business/singer/selectSingerAlbum',
    method: 'get',
    params: query
  })
}
// 查询歌手详情列表
export function selectSingerDetail(query) {
  return request({
    url: '/business/singer/selectSingerDetail',
    method: 'get',
    params: query
  })
}

// 查询全部歌手信息列表
export function selectRankAll(query) {
  return request({
    url: '/business/singer/selectRankAll',
    method: 'get',
    params: query
  })
}
// 查询歌手信息列表
export function selectSingerRank(query) {
  return request({
    url: '/business/singer/selectSingerRank',
    method: 'get',
    params: query
  })
}

// 查询歌手信息列表
export function listSinger(query) {
  return request({
    url: '/business/singer/list',
    method: 'get',
    params: query
  })
}

// 查询歌手信息详细
export function getSinger(sinId) {
  return request({
    url: '/business/singer/' + sinId,
    method: 'get'
  })
}

// 新增歌手信息
export function addSinger(data) {
  return request({
    url: '/business/singer',
    method: 'post',
    data: data
  })
}

// 修改歌手信息
export function updateSinger(data) {
  return request({
    url: '/business/singer',
    method: 'put',
    data: data
  })
}

// 删除歌手信息
export function delSinger(sinId) {
  return request({
    url: '/business/singer/' + sinId,
    method: 'delete'
  })
}

// 导出歌手信息
export function exportSinger(query) {
  return request({
    url: '/business/singer/export',
    method: 'get',
    params: query
  })
}
