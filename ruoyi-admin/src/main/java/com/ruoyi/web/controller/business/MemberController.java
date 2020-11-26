package com.ruoyi.web.controller.business;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.business.domain.Member;
import com.ruoyi.business.service.IMemberService;
import com.ruoyi.system.service.ISysUserService;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.scheduling.annotation.Scheduled;
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

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManagerFactory;

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

    @Autowired
    private ISysUserService userService;

    /**获取用户总数**/
    @GetMapping("/getTotalNumber")
    public AjaxResult getTotalNumber(){
        return AjaxResult.success(userService.getTotalNumber());
    }

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
     * android 端
     * 查询会员信息
     * @param mId
     * @return
     */
    @GetMapping("/getMember/android")
    public Member getMember(Long mId)
    {
        Member member = memberService.getMember(mId);
        return member;
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
        int count = memberService.insertMember(member);
        userService.userChangeMember(member.getUserId());
        return toAjax(count);
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
