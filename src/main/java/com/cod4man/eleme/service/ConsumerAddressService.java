package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.Address;

import java.util.List;


public interface ConsumerAddressService {

	//添加地址
	boolean addAddress(Address address);

	//删除地址
	boolean deleteAddress(int addressId);

	//修改默认地址（修改旧默认，更改新默认）
	boolean changeChecked(String conNo, int addressId, int Checked);

	//修改地址
	boolean modifyAddress(String conNo, int addressId, Address address);

	//显示用户地址
	List<Address> findAll_ByConNo(String consumerNo);

	//查找默认地址
	Address findChecked(String consumerNo);

	//根据id获取地址
	Address findAddressById (int addressId);

}
