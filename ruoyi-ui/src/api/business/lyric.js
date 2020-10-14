import request from '@/utils/request'

// 查询歌词列表
export function listLyric(query) {
  return request({
    url: '/business/lyric/list',
    method: 'get',
    params: query
  })
}

// 查询歌词详细
export function getLyric(lyrId) {
  return request({
    url: '/business/lyric/' + lyrId,
    method: 'get'
  })
}

// 新增歌词
export function addLyric(data) {
  return request({
    url: '/business/lyric',
    method: 'post',
    data: data
  })
}

// 修改歌词
export function updateLyric(data) {
  return request({
    url: '/business/lyric',
    method: 'put',
    data: data
  })
}

// 删除歌词
export function delLyric(lyrId) {
  return request({
    url: '/business/lyric/' + lyrId,
    method: 'delete'
  })
}

// 导出歌词
export function exportLyric(query) {
  return request({
    url: '/business/lyric/export',
    method: 'get',
    params: query
  })
}