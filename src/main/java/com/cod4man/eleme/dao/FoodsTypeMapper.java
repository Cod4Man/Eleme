package com.cod4man.eleme.dao;


import com.cod4man.eleme.pojo.FoodsType;

import java.util.List;

/**
 * 食物种类dao层
 * @author 晴空
 *
 */
public interface FoodsTypeMapper {

	//查询全部食物种类
	List<FoodsType> findAllFoodType();

}
