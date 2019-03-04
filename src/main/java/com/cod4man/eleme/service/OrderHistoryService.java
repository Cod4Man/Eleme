package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.OrderHistory;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:20:15
 */
public interface OrderHistoryService {
    //添加个人历史订单
    public boolean addOrderHistory(OrderHistory orderHistory);
    //修改订单状态״̬
    public boolean modifyOrderStatus(int orderId, int status);
    //查看个人历史订单
    public List<OrderHistory> findAll_ByConNo(String consumerNo);
    //查看个人某个历史订单
    public OrderHistory findOrder(String orderHistoryNo);
    //删除某订单
    public boolean deleteOrderHistory(String orderHistoryNo);
}
