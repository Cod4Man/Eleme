package com.cod4man.eleme.pojo;

/**
 * 买家类
 * @param
 * @return
 * @author zhj
 * @creed: Talk is cheap,show me the code
 * @date 2019/2/24
 */
public class Consumer {

  private int id; //序号
  private String consumerNo; // 买家编号9位数字
  private String consumerPhoneNum; // 手机号码 11位数字
  private String consumerNickName; // 昵称 <10个字符
  private String consumerLoginPsw; // 登录密码 >6位包含数字、字母
  private String consumerMail; // 邮箱163
  private int consumerStatus; // 买家协议 1/0 是/否
  private String consumerWechar; // 微信账号
  private int consumerVIP; // 是否会员 1/0
  private String consumerPortraitURL; //头像地址
  private double consumerBalance; //余额


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


  public String getConsumerPhoneNum() {
    return consumerPhoneNum;
  }

  public void setConsumerPhoneNum(String consumerPhoneNum) {
    this.consumerPhoneNum = consumerPhoneNum;
  }


  public String getConsumerNickName() {
    return consumerNickName;
  }

  public void setConsumerNickName(String consumerNickName) {
    this.consumerNickName = consumerNickName;
  }


  public String getConsumerLoginPsw() {
    return consumerLoginPsw;
  }

  public void setConsumerLoginPsw(String consumerLoginPsw) {
    this.consumerLoginPsw = consumerLoginPsw;
  }


  public String getConsumerMail() {
    return consumerMail;
  }

  public void setConsumerMail(String consumerMail) {
    this.consumerMail = consumerMail;
  }


  public int getConsumerStatus() {
    return consumerStatus;
  }

  public void setConsumerStatus(int consumerStatus) {
    this.consumerStatus = consumerStatus;
  }


  public String getConsumerWechar() {
    return consumerWechar;
  }

  public void setConsumerWechar(String consumerWechar) {
    this.consumerWechar = consumerWechar;
  }


  public int getConsumerVIP() {
    return consumerVIP;
  }

  public void setConsumerVIP(int consumerVIP) {
    this.consumerVIP = consumerVIP;
  }


  public String getConsumerPortraitURL() {
    return consumerPortraitURL;
  }

  public void setConsumerPortraitURL(String consumerPortraitURL) {
    this.consumerPortraitURL = consumerPortraitURL;
  }


  public double getConsumerBalance() {
    return consumerBalance;
  }

  public void setConsumerBalance(double consumerBalance) {
    this.consumerBalance = consumerBalance;
  }

}
