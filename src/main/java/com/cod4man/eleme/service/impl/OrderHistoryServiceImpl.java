package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.OrderHistoryMapper;
import com.cod4man.eleme.pojo.OrderHistory;
import com.cod4man.eleme.service.OrderHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:20:31
 */
@Transactional
@Service("OrderHistoryService")
public class OrderHistoryServiceImpl implements OrderHistoryService {
    @Autowired
    @Qualifier("orderHistoryMapper")
    private OrderHistoryMapper orderHistoryMapper;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean addOrderHistory(OrderHistory orderHistory) {
        boolean result = false;
        if (orderHistoryMapper.addOrderHistory(orderHistory) > 0) {
            result =  true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyOrderStatus(int orderId, int status) {
        boolean result = false;
        if (orderHistoryMapper.modifyOrderStatus(orderId, status) > 0) {
            result =true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<OrderHistory> findAll_ByConNo(String consumerNo) {
        return orderHistoryMapper.findAll_ByConNo(consumerNo);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public OrderHistory findOrder(String orderHistoryNo) {
        return orderHistoryMapper.findOrder(orderHistoryNo);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteOrderHistory(String orderHistoryNo) {
        boolean result = false;
        if (orderHistoryMapper.deleteOrderHistory(orderHistoryNo) > 0) {
            result =true;
        }
        return result;
    }
}
