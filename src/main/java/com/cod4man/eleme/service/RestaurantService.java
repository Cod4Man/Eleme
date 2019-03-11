package com.cod4man.eleme.service;

import com.cod4man.eleme.pojo.Restaurant;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-23
 * Time:16:39
 */
public interface RestaurantService {
    //查询全部店铺
    public List<Restaurant> findAllRestauran(String consumerNo, int index);

    //通过店铺唯一ID查询
    public List<Restaurant> findRestauran_byId(String restaurantId, String consumerNo);

    //通过店铺类型查询
    public List<Restaurant> findRestauran_byType(String restaurantType, String consumerNo, int index);

    //通过店名查询店铺
    public List<Restaurant> findRestauran_ByName(String restaurantName, String consumerNo);
}
