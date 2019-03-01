package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.FoodsType;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-28
 * Time:20:18
 */
public interface FoodsTypeService {
    //查询全部食物种类
    List<FoodsType> findAllFoodType();
}
