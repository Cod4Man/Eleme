package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.Foods;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-23
 * Time:16:38
 */
public interface FoodsService {
    //通过店铺唯一id查询全部食物商品
    public List<Foods> findAllFoodsById(String restaurantId);

    //通过店铺名字查询全部食物商品
    public List<Foods> findAllFoodsByName(String restaurantName);

    //通过食物种类查询食物
    public List<Foods> findFoodsByType(String foodsType,String restaurantNo);

    //通过食物id查询食物
    Foods findById(String foodsNo);

    //修改商品评分
    boolean modifyScore(String foodsNo,double foodsScore);

    //修改商品价格
    boolean modifyPrice(String foodsNo,double foodsPrice);
}
