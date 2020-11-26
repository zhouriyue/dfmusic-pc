import request from '@/utils/request'

// 查询歌曲的歌手
export function searchSonglistKey(query) {
  return request({
    url: '/business/songlist/searchSonglistKey',
    method: 'get',
    params: query
  })
}
// 查询歌曲的歌手
export function selectSongSinger(query) {
  return request({
    url: '/business/singer/selectSongSinger',
    method: 'get',
    params: query
  })
}
// 查询歌单列表
export function selectSingerKey(query) {
  return request({
    url: '/business/singer/selectSingerKey',
    method: 'get',
    params: query
  })
}
// 查询歌曲列表
export function listSong(query) {
  return request({
    url: '/business/song/list',
    method: 'get',
    params: query
  })
}

// 查询歌曲详细
export function getSong(songId) {
  return request({
    url: '/business/song/' + songId,
    method: 'get'
  })
}

// 新增歌曲
export function addSong(data) {
  return request({
    url: '/business/song',
    method: 'post',
    data: data
  })
}

// 修改歌曲
export function updateSong(data) {
  return request({
    url: '/business/song',
    method: 'put',
    data: data
  })
}

// 删除歌曲
export function delSong(songId) {
  return request({
    url: '/business/song/' + songId,
    method: 'delete'
  })
}

// 导出歌曲
export function exportSong(query) {
  return request({
    url: '/business/song/export',
    method: 'get',
    params: query
  })
}
