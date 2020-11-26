package com.ruoyi.business.service;

import com.ruoyi.business.domain.Operate;
import com.ruoyi.business.domain.TypeOperate;

import java.util.List;

public interface IOperateService {

    public List<Operate> findAll();

    public List<Operate> selectType(Integer type);

    public List<TypeOperate> findAllType();
}
