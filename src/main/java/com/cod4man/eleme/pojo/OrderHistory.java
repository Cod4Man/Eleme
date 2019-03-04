package com.cod4man.eleme.pojo;


import java.time.LocalDateTime;
import java.util.List;

public class OrderHistory {

  private int id;
  private String consumerNo;
  private String restaurantNo;
/*  private String foodsNo;
  private int foodsNum;
  private double foodsPrice;*/
  private List<OrderDetail> orderDetailList;
  private String orderHistoryNo; //23位=9位consumerNo+14位orderDate年月日时分秒
  private LocalDateTime orderDate;
  private int addressId;
  private int orderStatus;
  private String orderStatusName;
  private Restaurant restaurant;
  private Address address;
  private double price;
  private String comment;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public String getOrderHistoryNo() {
        return orderHistoryNo;
    }
    public void setOrderHistoryNo(String orderHistoryNo) {
        this.orderHistoryNo = orderHistoryNo;
    }

    public String getOrderStatusName() {
    return orderStatusName;
  }

  public void setOrderStatusName(String orderStatusName) {
    this.orderStatusName = orderStatusName;
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

  public LocalDateTime getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(LocalDateTime orderDate) {
    this.orderDate = orderDate;
  }


  public int getAddressId() {
    return addressId;
  }

  public void setAddressId(int addressId) {
    this.addressId = addressId;
  }


  public int getOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(int orderStatus) {
    this.orderStatus = orderStatus;
  }

}
