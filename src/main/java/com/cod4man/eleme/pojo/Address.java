package com.cod4man.eleme.pojo;

/**
 * 地址类
 * @param
 * @return
 * @author zhj
 * @creed: Talk is cheap,show me the code
 * @date 2019/2/22
 */
public class Address {

  private int id;  //地址id
  private String consumerNo;  //买家编号
  private String province;  //省份
  private String city;  //市区
  private String district;  //区域
  private String street;  //街道
  private String streetNumber;  //门牌号
  private String comment; //地址备注
  private int checked; //是否默认
  private String business;//商业圈
  private double pointLat; //经度
  private double pointLng; //纬度
  private String name; //姓名
  private String phoneNum; //手机号
  private int user; //用户类型，0/1 买家/卖家

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPhoneNum() {
    return phoneNum;
  }

  public void setPhoneNum(String phoneNum) {
    this.phoneNum = phoneNum;
  }

  public int getUser() {
    return user;
  }

  public void setUser(int user) {
    this.user = user;
  }

  public String getBusiness() {
    return business;
  }

  public void setBusiness(String business) {
    this.business = business;
  }

  public double getPointLat() {
    return pointLat;
  }

  public void setPointLat(double pointLat) {
    this.pointLat = pointLat;
  }

  public double getPointLng() {
    return pointLng;
  }

  public void setPointLng(double pointLng) {
    this.pointLng = pointLng;
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


  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }


  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }


  public String getDistrict() {
    return district;
  }

  public void setDistrict(String district) {
    this.district = district;
  }


  public String getStreet() {
    return street;
  }

  public void setStreet(String street) {
    this.street = street;
  }


  public String getStreetNumber() {
    return streetNumber;
  }

  public void setStreetNumber(String streetNumber) {
    this.streetNumber = streetNumber;
  }


  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }


  public int getChecked() {
    return checked;
  }

  public void setChecked(int checked) {
    this.checked = checked;
  }


/*  @Override
  public String toString() {
    return "Address{" + "id=" + id + ", consumerNo='" + consumerNo + '\'' + ", province='" + province + '\'' + ", city='" + city + '\'' + ", district='" + district + '\'' + ", street='" + street + '\'' + ", streetNumber='" + streetNumber + '\'' + ", comment='" + comment + '\'' + ", checked=" + checked + ", business='" + business + '\'' + ", pointLat=" + pointLat + ", pointLng=" + pointLng + ", name='" + name + '\'' + ", phoneNum='" + phoneNum + '\'' + ", user=" + user + '}';
  }*/
}
