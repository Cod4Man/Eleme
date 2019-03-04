package com.cod4man.eleme.dao;

import java.util.List;
import com.cod4man.eleme.pojo.OrderHistory;
import org.apache.ibatis.annotations.Param;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:15:59
 */
public interface OrderHistoryMapper {
    //添加个人历史订单
    public int addOrderHistory(OrderHistory orderHistory);
    //修改订单状态״̬
    public int modifyOrderStatus(@Param("id") int orderId,
                                                         @Param("status") int status);
    //查看个人历史订单
    public List<OrderHistory> findAll_ByConNo(@Param("consumerNo") String consumerNo);
    //查看个人某个历史订单
    public OrderHistory findOrder(@Param("orderHistoryNo")String orderHistoryNo);
    //删除某订单
    public int deleteOrderHistory(@Param("orderHistoryNo")String orderHistoryNo);
}
