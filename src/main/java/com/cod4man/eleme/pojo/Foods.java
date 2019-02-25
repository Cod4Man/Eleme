package com.cod4man.eleme.pojo;
/**
 * 食物商品类
 * @author 晴空
 *
 */
public class Foods {
	private int id;//序号
	private String restaurantNo;//店铺唯一编号
	private String foodsNo;//商品唯一编号
	private String foodsName;//商品名称
	private double foodsPrice;//商品价格
	private String foodsPictureURL;//商品图片
	private String foodsSynopsis;//商品简介
	private double foodsScore;//商品评分



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(String restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public String getFoodsNo() {
		return foodsNo;
	}
	public void setFoodsNo(String foodsNo) {
		this.foodsNo = foodsNo;
	}
	public String getFoodsName() {
		return foodsName;
	}
	public void setFoodsName(String foodsName) {
		this.foodsName = foodsName;
	}
	public double getFoodsPrice() {
		return foodsPrice;
	}
	public void setFoodsPrice(double foodsPrice) {
		this.foodsPrice = foodsPrice;
	}
	public String getFoodsPictureURL() {
		return foodsPictureURL;
	}
	public void setFoodsPictureURL(String foodsPictureURL) {
		this.foodsPictureURL = foodsPictureURL;
	}
	public String getFoodsSynopsis() {
		return foodsSynopsis;
	}
	public void setFoodsSynopsis(String foodsSynopsis) {
		this.foodsSynopsis = foodsSynopsis;
	}
	public double getFoodsScore() {
		return foodsScore;
	}
	public void setFoodsScore(double foodsScore) {
		this.foodsScore = foodsScore;
	}



}
