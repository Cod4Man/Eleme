package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.RestaurantMapper;
import com.cod4man.eleme.pojo.Restaurant;
import com.cod4man.eleme.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.imageio.spi.RegisterableService;
import javax.imageio.spi.ServiceRegistry;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-23
 * Time:17:23
 */
@Transactional
@Service("RestaurantService")
public class RestaurantServiceImpl implements RestaurantService {
    @Autowired
    @Qualifier("restaurantMapper")
    private  RestaurantMapper restaurantMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Restaurant> findAllRestauran(String consumerNo) {
        return restaurantMapper.findAllRestauran(consumerNo);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Restaurant> findRestauran_byId(String restaurantId, String consumerNo) {
        return restaurantMapper.findRestauran_byId(restaurantId, consumerNo);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Restaurant> findRestauran_byType(String restaurantType, String consumerNo) {
        return restaurantMapper.findRestauran_byType(restaurantType, consumerNo);
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Restaurant> findRestauran_ByName(String restaurantName, String consumerNo) {
        return restaurantMapper.findRestauran_ByName(restaurantName, consumerNo);
    }
}
