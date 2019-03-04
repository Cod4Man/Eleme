package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.OrderDetailMapper;
import com.cod4man.eleme.pojo.OrderDetail;
import com.cod4man.eleme.service.OrderDetailService;
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
 * Time:20:26
 */
@Transactional
@Service("OrderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    @Qualifier("orderDetailMapper")
    private OrderDetailMapper orderDetailMapper;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean addOrderDetail(List<OrderDetail> orderDetailList) {
        boolean result = false;
        if (orderDetailMapper.addOrderDetail(orderDetailList) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<OrderDetail> find_ByOrderNo(String orderHistoryNo) {
        return orderDetailMapper.find_ByOrderNo(orderHistoryNo);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteOrderDetail(String orderHistoryNo) {
        boolean result = false;
        if (orderDetailMapper.deleteOrderDetail(orderHistoryNo) > 0) {
            result = true;
        }
        return result;
    }
}
