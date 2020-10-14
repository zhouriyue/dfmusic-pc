package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Member;
import com.ruoyi.business.mapper.MemberMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.IMemberService;

/**
 * 会员信息管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class MemberServiceImpl implements IMemberService 
{
    @Autowired
    private MemberMapper memberMapper;

    /**
     * 查询会员信息管理
     * 
     * @param mId 会员信息管理ID
     * @return 会员信息管理
     */
    @Override
    public Member selectMemberById(Long mId)
    {
        return memberMapper.selectMemberById(mId);
    }

    /**
     * 查询会员信息管理列表
     * 
     * @param member 会员信息管理
     * @return 会员信息管理
     */
    @Override
    public List<Member> selectMemberList(Member member)
    {
        return memberMapper.selectMemberList(member);
    }

    /**
     * 新增会员信息管理
     * 
     * @param member 会员信息管理
     * @return 结果
     */
    @Override
    public int insertMember(Member member)
    {
        member.setCreateTime(DateUtils.getNowDate());
        return memberMapper.insertMember(member);
    }

    /**
     * 修改会员信息管理
     * 
     * @param member 会员信息管理
     * @return 结果
     */
    @Override
    public int updateMember(Member member)
    {
        member.setUpdateTime(DateUtils.getNowDate());
        return memberMapper.updateMember(member);
    }

    /**
     * 批量删除会员信息管理
     * 
     * @param mIds 需要删除的会员信息管理ID
     * @return 结果
     */
    @Override
    public int deleteMemberByIds(Long[] mIds)
    {
        return memberMapper.deleteMemberByIds(mIds);
    }

    /**
     * 删除会员信息管理信息
     * 
     * @param mId 会员信息管理ID
     * @return 结果
     */
    @Override
    public int deleteMemberById(Long mId)
    {
        return memberMapper.deleteMemberById(mId);
    }
}
