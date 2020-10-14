import request from '@/utils/request'

// 查询下载信息列表
export function listDownload(query) {
  return request({
    url: '/business/download/list',
    method: 'get',
    params: query
  })
}

// 查询下载信息详细
export function getDownload(dlId) {
  return request({
    url: '/business/download/' + dlId,
    method: 'get'
  })
}

// 新增下载信息
export function addDownload(data) {
  return request({
    url: '/business/download',
    method: 'post',
    data: data
  })
}

// 修改下载信息
export function updateDownload(data) {
  return request({
    url: '/business/download',
    method: 'put',
    data: data
  })
}

// 删除下载信息
export function delDownload(dlId) {
  return request({
    url: '/business/download/' + dlId,
    method: 'delete'
  })
}

// 导出下载信息
export function exportDownload(query) {
  return request({
    url: '/business/download/export',
    method: 'get',
    params: query
  })
}