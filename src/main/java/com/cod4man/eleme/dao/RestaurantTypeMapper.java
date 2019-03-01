package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.RestaurantType;

import java.util.List;

public interface RestaurantTypeMapper {
	//查询全部店铺种类
	public List<RestaurantType> findAllType();
}
