package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.OrderDetail;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:20:25
 */
public interface OrderDetailService {
    //    添加历史订单详情
    boolean addOrderDetail(List<OrderDetail> orderDetailList );
    //    查询个人历史订单详情
    List<OrderDetail> find_ByOrderNo(String orderHistoryNo);
    //    删除历史订单详情
    boolean deleteOrderDetail(String orderHistoryNo);
}
