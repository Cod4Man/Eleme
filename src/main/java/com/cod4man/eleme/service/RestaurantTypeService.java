package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.RestaurantType;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-28
 * Time:20:21
 */
public interface RestaurantTypeService {
    //查询全部店铺种类
    public List<RestaurantType> findAllType();
}
