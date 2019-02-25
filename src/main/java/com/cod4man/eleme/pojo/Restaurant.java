package com.cod4man.eleme.pojo;

/**
 * 店铺实体类
 * @author 晴空
 *
 */
public class Restaurant {
	private int id;//id
	private String restaurantNo;//店铺唯一编号
	private String restaurantAddress;//店铺地址
	private String restaurantName;//店铺名称
	private String restaurantPhone;//店铺电话
	private String restaurantPortraitURL;//店铺头像
	private String restaurantNotice;//店铺公告
	private int restaurantTypeNo;//店铺种类
	private String restaurantType;//店铺种类名称



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
	public String getRestaurantAddress() {
		return restaurantAddress;
	}
	public void setRestaurantAddress(String restaurantAddress) {
		this.restaurantAddress = restaurantAddress;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getRestaurantPhone() {
		return restaurantPhone;
	}
	public void setRestaurantPhone(String restaurantPhone) {
		this.restaurantPhone = restaurantPhone;
	}
	public String getRestaurantPortraitURL() {
		return restaurantPortraitURL;
	}
	public void setRestaurantPortraitURL(String restaurantPortraitURL) {
		this.restaurantPortraitURL = restaurantPortraitURL;
	}
	public String getRestaurantNotice() {
		return restaurantNotice;
	}
	public void setRestaurantNotice(String restaurantNotice) {
		this.restaurantNotice = restaurantNotice;
	}

	public int getRestaurantTypeNo() {
		return restaurantTypeNo;
	}

	public void setRestaurantTypeNo(int restaurantTypeNo) {
		this.restaurantTypeNo = restaurantTypeNo;
	}

	public String getRestaurantType() {
		return restaurantType;
	}

	public void setRestaurantType(String restaurantType) {
		this.restaurantType = restaurantType;
	}
}
