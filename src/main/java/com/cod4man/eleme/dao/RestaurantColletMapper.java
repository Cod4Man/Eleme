package com.cod4man.eleme.dao;
/**
 * 李吉发
 * 2019.2.26
 * 收藏 Dao层
 * */
import com.cod4man.eleme.pojo.RestaurantCollet;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface RestaurantColletMapper {
	//添加收藏
	int addRestaurantCollet(@Param("consumerNo") String consumerNo,
												@Param("restaurantNo") String restaurantNo);
	//取消收藏
	int removeRestaurantCollet(@Param("consumerNo") String consumerNo,
							   							@Param("restaurantNo") String restaurantNo);
	//查询收藏记录
	List<RestaurantCollet> findRestaurant_ByConNo(@Param("consumerNo") String consumerNo);

	//查询是否收藏
	int restaurantColletBoo(@Param("consumerNo") String consumerNo,
											   @Param("restaurantNo") String restaurantNo);
}
