import request from '@/utils/request'

// 查询用户列表
export function getTotalNumber() {
  return request({
    url: '/business/member/getTotalNumber',
    method: 'get'
  })
}

// 查询会员信息管理列表
export function listMember(query) {
  return request({
    url: '/business/member/list',
    method: 'get',
    params: query
  })
}

// 查询会员信息管理详细
export function getMember(mId) {
  return request({
    url: '/business/member/' + mId,
    method: 'get'
  })
}

// 新增会员信息管理
export function addMember(data) {
  return request({
    url: '/business/member',
    method: 'post',
    data: data
  })
}

// 修改会员信息管理
export function updateMember(data) {
  return request({
    url: '/business/member',
    method: 'put',
    data: data
  })
}

// 删除会员信息管理
export function delMember(mId) {
  return request({
    url: '/business/member/' + mId,
    method: 'delete'
  })
}

// 导出会员信息管理
export function exportMember(query) {
  return request({
    url: '/business/member/export',
    method: 'get',
    params: query
  })
}
