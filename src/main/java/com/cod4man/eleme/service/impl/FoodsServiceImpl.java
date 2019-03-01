package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.FoodsMapper;
import com.cod4man.eleme.pojo.Foods;
import com.cod4man.eleme.service.FoodsService;
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
 * Date：2019-02-23
 * Time:17:23
 */
@Transactional
@Service("FoodsService")
public class FoodsServiceImpl implements FoodsService {
    @Autowired
    @Qualifier("foodsMapper")
    private FoodsMapper foodsMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Foods> findAllFoodsById(String restaurantId) {
        return foodsMapper.findAllFoodsById(restaurantId);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Foods> findAllFoodsByName(String restaurantName) {
        return foodsMapper.findAllFoodsByName(restaurantName);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Foods> findFoodsByType(String foodsType, String restaurantNo) {
        return foodsMapper.findFoodsByType(foodsType, restaurantNo);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Foods findById(String foodsNo) {
        return foodsMapper.findById(foodsNo);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyScore(String foodsNo, double foodsScore) {
        boolean result = false;
        if (foodsMapper.modifyScore(foodsNo, foodsScore) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyPrice(String foodsNo, double foodsPrice) {
        boolean result = false;
        if (foodsMapper.modifyPrice(foodsNo, foodsPrice) > 0) {
            result = true;
        }
        return result;
    }
}
