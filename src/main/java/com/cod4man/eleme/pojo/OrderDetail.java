package com.cod4man.eleme.pojo;


public class OrderDetail {

  private int id;
  private String orderHistoryNo;
  private String foodsNo;
  private int foodsNum;
  private Foods foods;

  public Foods getFoods() {
    return foods;
  }

  public void setFoods(Foods foods) {
    this.foods = foods;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getOrderHistoryNo() {
    return orderHistoryNo;
  }

  public void setOrderHistoryNo(String orderHistoryNo) {
    this.orderHistoryNo = orderHistoryNo;
  }


  public String getFoodsNo() {
    return foodsNo;
  }

  public void setFoodsNo(String foodsNo) {
    this.foodsNo = foodsNo;
  }


  public int getFoodsNum() {
    return foodsNum;
  }

  public void setFoodsNum(int foodsNum) {
    this.foodsNum = foodsNum;
  }

}
