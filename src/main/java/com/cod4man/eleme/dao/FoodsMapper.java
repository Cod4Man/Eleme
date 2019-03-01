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

	//通过食物种类查询食物
	public List<Foods> findFoodsByType(@Param("foodsType") String foodsType,
									   									 @Param("restaurantNo") String restaurantNo);

	//通过食物id查询食物
	Foods findById(@Param("foodsNo") String foodsNo);

	//修改商品评分
	int modifyScore(@Param("foodsNo") String foodsNo,
					 		      @Param("foodsScore")double foodsScore);

	//修改商品价格
	int modifyPrice(@Param("foodsNo") String foodsNo,
							 	@Param("foodsPrice")double foodsPrice);
}
