package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Member;
import com.ruoyi.business.service.IMemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会员信息管理Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/member")
public class MemberController extends BaseController
{
    @Autowired
    private IMemberService memberService;

    /**
     * 查询会员信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:member:list')")
    @GetMapping("/list")
    public TableDataInfo list(Member member)
    {
        startPage();
        List<Member> list = memberService.selectMemberList(member);
        return getDataTable(list);
    }

    /**
     * 导出会员信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:member:export')")
    @Log(title = "会员信息管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Member member)
    {
        List<Member> list = memberService.selectMemberList(member);
        ExcelUtil<Member> util = new ExcelUtil<Member>(Member.class);
        return util.exportExcel(list, "member");
    }

    /**
     * 获取会员信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:member:query')")
    @GetMapping(value = "/{mId}")
    public AjaxResult getInfo(@PathVariable("mId") Long mId)
    {
        return AjaxResult.success(memberService.selectMemberById(mId));
    }

    /**
     * 新增会员信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:member:add')")
    @Log(title = "会员信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Member member)
    {
        return toAjax(memberService.insertMember(member));
    }

    /**
     * 修改会员信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:member:edit')")
    @Log(title = "会员信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Member member)
    {
        return toAjax(memberService.updateMember(member));
    }

    /**
     * 删除会员信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:member:remove')")
    @Log(title = "会员信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{mIds}")
    public AjaxResult remove(@PathVariable Long[] mIds)
    {
        return toAjax(memberService.deleteMemberByIds(mIds));
    }
}
