package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Member;
import org.apache.ibatis.annotations.Param;

/**
 * 会员信息管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface MemberMapper 
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
     * 删除会员信息管理
     * 
     * @param mId 会员信息管理ID
     * @return 结果
     */
    public int deleteMemberById(Long mId);

    /**
     * 批量删除会员信息管理
     * 
     * @param mIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteMemberByIds(Long[] mIds);

    /**
     * 更新会员天数
     * @param count
     * @return
     */
    public long updateValidDay(@Param("mId") Long mId,@Param("count") Long count);

    public long recharge(@Param("mId") Long mId,@Param("rechargeDay") Integer rechargeDay);
}
