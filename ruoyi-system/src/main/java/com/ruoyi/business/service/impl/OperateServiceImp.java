package com.ruoyi.business.service.impl;

import com.ruoyi.business.domain.Operate;
import com.ruoyi.business.domain.TypeOperate;
import com.ruoyi.business.mapper.OperateMapper;
import com.ruoyi.business.service.IOperateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperateServiceImp implements IOperateService {

    @Autowired
    OperateMapper operateMapper;

    @Override
    public List<Operate> findAll() {
        return operateMapper.findAll();
    }

    @Override
    public List<Operate> selectType(Integer type) {
        return operateMapper.selectType(type);
    }

    public List<TypeOperate> findAllType(){
        return operateMapper.findAllType();
    }

}
