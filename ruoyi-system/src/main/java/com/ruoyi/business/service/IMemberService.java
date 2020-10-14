package com.ruoyi.business.service;

import com.ruoyi.business.domain.Member;

import java.util.List;

/**
 * 会员信息管理Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface IMemberService 
{
    /**
     * 查询会员信息管理
     * 
     * @param mId 会员信息管理ID
     * @return 会员信息管理
     */
    public Member selectMemberById(Long mId);

    /**
     * 查询会员信息管理列表
     * 
     * @param member 会员信息管理
     * @return 会员信息管理集合
     */
    public List<Member> selectMemberList(Member member);

    /**
     * 新增会员信息管理
     * 
     * @param member 会员信息管理
     * @return 结果
     */
    public int insertMember(Member member);

    /**
     * 修改会员信息管理
     * 
     * @param member 会员信息管理
     * @return 结果
     */
    public int updateMember(Member member);

    /**
     * 批量删除会员信息管理
     * 
     * @param mIds 需要删除的会员信息管理ID
     * @return 结果
     */
    public int deleteMemberByIds(Long[] mIds);

    /**
     * 删除会员信息管理信息
     * 
     * @param mId 会员信息管理ID
     * @return 结果
     */
    public int deleteMemberById(Long mId);
}
