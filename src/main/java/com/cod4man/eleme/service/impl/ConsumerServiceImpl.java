package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.ConsumerMapper;
import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.service.ConsumerService;
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
@Service("ConsumerService")
public class ConsumerServiceImpl implements ConsumerService {
    @Autowired
    @Qualifier("consumerMapper")
    private ConsumerMapper consumerMapper;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean addConsumer(Consumer consumer) {
        boolean result =false;
        if (consumerMapper.addConsumer(consumer) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Consumer> getList() {
        return consumerMapper.getList();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyBalance(Consumer consumer, double money) {
        boolean result =false;
        if (consumerMapper.modifyBalance(consumer, money) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyPassword(Consumer consumer) {
        boolean result =false;
        if (consumerMapper.modifyPassword(consumer) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean update(Consumer consumer) {
        boolean result =false;
        if (consumerMapper.update(consumer) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Consumer conExists(Consumer consumer) {
        return consumerMapper.conExists(consumer);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Consumer loginByPsw(Consumer consumer) {
        return consumerMapper.loginByPsw(consumer);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean consumerNoUnique(String consumerNo) {
        boolean result =false;
        if (consumerMapper.consumerNoUnique(consumerNo) > 0) {
            result = true;
        }
        return result;
    }
}
