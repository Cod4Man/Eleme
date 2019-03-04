package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.RestaurantCollet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-04
 * Time:17:00
 */
public interface RestaurantColletService {
    //添加收藏
    boolean addRestaurantCollet(String consumerNo, String restaurantNo);
    //取消收藏
    boolean removeRestaurantCollet(String consumerNo, String restaurantNo);
    //查询收藏记录
    List<RestaurantCollet> findRestaurant_ByConNo(String consumerNo);

    //查询是否收藏
    boolean restaurantColletBoo(String consumerNo, String restaurantNo);
}
