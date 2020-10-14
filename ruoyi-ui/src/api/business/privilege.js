import request from '@/utils/request'

// 查询特权列表
export function listPrivilege(query) {
  return request({
    url: '/business/privilege/list',
    method: 'get',
    params: query
  })
}

// 查询特权详细
export function getPrivilege(priId) {
  return request({
    url: '/business/privilege/' + priId,
    method: 'get'
  })
}

// 新增特权
export function addPrivilege(data) {
  return request({
    url: '/business/privilege',
    method: 'post',
    data: data
  })
}

// 修改特权
export function updatePrivilege(data) {
  return request({
    url: '/business/privilege',
    method: 'put',
    data: data
  })
}

// 删除特权
export function delPrivilege(priId) {
  return request({
    url: '/business/privilege/' + priId,
    method: 'delete'
  })
}

// 导出特权
export function exportPrivilege(query) {
  return request({
    url: '/business/privilege/export',
    method: 'get',
    params: query
  })
}