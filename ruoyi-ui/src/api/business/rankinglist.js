import request from '@/utils/request'

// 查询全球榜的歌曲
export function getWorldSong(query) {
  return request({
    url: '/business/rankinglist/getWorldSong',
    method: 'get',
    params: query
  })
}

// 查询全球榜列表
export function getNotOff(query) {
  return request({
    url: '/business/rankinglist/getNotOff',
    method: 'get',
    params: query
  })
}

// 查询排行榜管理列表
export function getOffRankingList(query) {
  return request({
    url: '/business/rankinglist/getOffRankingList',
    method: 'get',
    params: query
  })
}

// 查询排行榜管理列表
export function listRankinglist(query) {
  return request({
    url: '/business/rankinglist/list',
    method: 'get',
    params: query
  })
}

// 查询排行榜管理详细
export function getRankinglist(rlId) {
  return request({
    url: '/business/rankinglist/' + rlId,
    method: 'get'
  })
}

// 新增排行榜管理
export function addRankinglist(data) {
  return request({
    url: '/business/rankinglist',
    method: 'post',
    data: data
  })
}

// 修改排行榜管理
export function updateRankinglist(data) {
  return request({
    url: '/business/rankinglist',
    method: 'put',
    data: data
  })
}

// 删除排行榜管理
export function delRankinglist(rlId) {
  return request({
    url: '/business/rankinglist/' + rlId,
    method: 'delete'
  })
}

// 导出排行榜管理
export function exportRankinglist(query) {
  return request({
    url: '/business/rankinglist/export',
    method: 'get',
    params: query
  })
}
