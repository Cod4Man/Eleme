package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.RestaurantColletMapper;
import com.cod4man.eleme.pojo.RestaurantCollet;
import com.cod4man.eleme.service.RestaurantColletService;
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
 * Date：2019-03-04
 * Time:17:01
 */
@Transactional
@Service("RestaurantColletService")
public class RestaurantColletServiceImpl implements RestaurantColletService {
    @Autowired
    @Qualifier("restaurantColletMapper")
    private RestaurantColletMapper restaurantColletMapper;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean addRestaurantCollet(String consumerNo, String restaurantNo) {
        boolean result = false;
        if (restaurantColletMapper.addRestaurantCollet(consumerNo,restaurantNo) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean removeRestaurantCollet(String consumerNo, String restaurantNo) {
        boolean result = false;
        if (restaurantColletMapper.removeRestaurantCollet(consumerNo, restaurantNo) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<RestaurantCollet> findRestaurant_ByConNo(String consumerNo) {
        return restaurantColletMapper.findRestaurant_ByConNo(consumerNo);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public boolean restaurantColletBoo(String consumerNo, String restaurantNo) {
        boolean result = false;
        if (restaurantColletMapper.restaurantColletBoo(consumerNo, restaurantNo) > 0) {
            result = true;
        }
        return result;
    }
}
