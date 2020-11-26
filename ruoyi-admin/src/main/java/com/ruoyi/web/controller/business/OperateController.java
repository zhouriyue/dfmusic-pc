package com.ruoyi.web.controller.business;

import com.ruoyi.business.domain.Operate;
import com.ruoyi.business.domain.TypeOperate;
import com.ruoyi.business.service.IOperateService;
import com.ruoyi.common.core.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/business/operate")
public class OperateController extends BaseController {

    @Autowired
    IOperateService operateService;

    /**
     * 获取操作列表
     * @return
     */
    @GetMapping("/findAll/android")
    public List<Operate> findAll(){
        return operateService.findAll();
    }

    /**
     * 获取操作列表
     * @return
     */
    @GetMapping("/selectType/android")
    public List<Operate> selectType(Integer type){
        return operateService.selectType(type);
    }

    @GetMapping("/findAllType/android")
    public List<TypeOperate> findAllType(){
        return operateService.findAllType();
    }
}
