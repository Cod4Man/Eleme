package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.RestaurantTypeMapper;
import com.cod4man.eleme.pojo.RestaurantType;
import com.cod4man.eleme.service.RestaurantTypeService;
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
 * Date：2019-02-28
 * Time:20:21
 */
@Transactional
@Service("RestaurantTypeService")
public class RestaurantTypeServiceImpl implements RestaurantTypeService {
    @Autowired
    @Qualifier("restaurantTypeMapper")
    private RestaurantTypeMapper restaurantTypeMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<RestaurantType> findAllType() {
        return restaurantTypeMapper.findAllType();
    }
}
