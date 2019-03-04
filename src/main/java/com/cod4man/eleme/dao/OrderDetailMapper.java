package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.OrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:20:10
 */
public interface OrderDetailMapper {
//    添加历史订单详情
    int addOrderDetail(@Param("orderDetailList") List<OrderDetail> orderDetailList );
//    查询个人历史订单详情
    List<OrderDetail> find_ByOrderNo(@Param("orderHistoryNo") String orderHistoryNo);
//    删除历史订单详情
    int deleteOrderDetail(@Param("orderHistoryNo") String orderHistoryNo);
}
