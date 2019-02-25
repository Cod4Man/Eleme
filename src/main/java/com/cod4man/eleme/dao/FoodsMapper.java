package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.Foods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 食物类接口
 * @author 晴空
 *
 */
public interface FoodsMapper {
	//通过店铺唯一id查询全部食物商品
	public List<Foods> findAllFoodsById(@Param("restaurantNo") String restaurantNo);

	//通过店铺名字查询全部食物商品
	public List<Foods> findAllFoodsByName(@Param("restaurantName") String restaurantName);
}
