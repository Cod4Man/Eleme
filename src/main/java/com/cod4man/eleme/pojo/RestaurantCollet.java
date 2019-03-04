package com.cod4man.eleme.pojo;
/**
 * 实体类      餐厅收藏
 * 李吉发
 * 2019.2.26
 * 
 * */
public class RestaurantCollet {
	private int id;     //序号
	private String consumerNo;    //买家唯一编号
	private String restaurantNo;   //卖家唯一编号
	private Restaurant restaurant;  //restaurant对象封装
	
	public Restaurant getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConsumerNo() {
		return consumerNo;
	}
	public void setConsumerNo(String consumerNo) {
		this.consumerNo = consumerNo;
	}
	public String getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(String restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	

}
