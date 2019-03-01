package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.FoodsTypeMapper;
import com.cod4man.eleme.pojo.FoodsType;
import com.cod4man.eleme.service.FoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-28
 * Time:20:19
 */
@Transactional
@Service("FoodsTypeService")
public class FoodsTypeServiceImpl implements FoodsTypeService {
    @Autowired
    @Qualifier("foodsTypeMapper")
    private FoodsTypeMapper foodsTypeMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<FoodsType> findAllFoodType() {
        return foodsTypeMapper.findAllFoodType();
    }
}
