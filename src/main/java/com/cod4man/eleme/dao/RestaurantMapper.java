package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.Restaurant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface RestaurantMapper {

	//查询全部店铺
	public List<Restaurant> findAllRestauran(@Param("consumerNo") String consumerNo,
											 										RowBounds rowBounds);

	//通过店铺唯一ID查询
	public List<Restaurant> findRestauran_byId(@Param("restaurantNo") String restaurantNo,
											   										@Param("consumerNo") String consumerNo);

	//通过店铺类型查询
	public List<Restaurant> findRestauran_byType(@Param("restaurantType") String restaurantType,
																						  @Param("consumerNo") String consumerNo,
												 											RowBounds rowBounds);

	//通过店名查询店铺
	public List<Restaurant> findRestauran_ByName(@Param("restaurantName") String restaurantName,
																							@Param("consumerNo") String consumerNo);


}
