package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ConsumerAddressMapper {

	//添加地址
	int addAddress(Address address);

	//删除地址
	int deleteAddress(@Param("addressId") int addressId );

	//修改默认地址（修改旧默认，更改新默认）
	int changeChecked(@Param("consumerNo") String consumerNo,
									    @Param("addressId") int addressId,
									    @Param("checked") int checked);

	//修改地址
	/*int modifyAddress(String conNo,int addressId,Address address);
	* =删除地址+添加地址
	* */
	//修改地址
	int modifyAddress(@Param("consumerNo") String consumerNo,
									  @Param("addressId") int addressId,
									  @Param("address") Address address);

	//显示用户地址
	List<Address> findAll_ByConNo(@Param("consumerNo") String consumerNo);

	//查找默认地址
	Address findChecked(@Param("consumerNo") String consumerNo);

	//根据id获取地址
	Address findAddressById (@Param("addressId") int addressId);
}
