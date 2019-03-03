package com.cod4man.eleme.service.impl;

import com.cod4man.eleme.dao.ConsumerAddressMapper;
import com.cod4man.eleme.pojo.Address;
import com.cod4man.eleme.service.ConsumerAddressService;
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
 * Date：2019-02-27
 * Time:20:23
 */
@Transactional
@Service("ConsumerAddressService")
public class ConsumerAddressServiceImpl implements ConsumerAddressService {
    @Autowired
    @Qualifier("consumerAddressMapper")
    private ConsumerAddressMapper consumerAddressMapper;
    @Override
    public boolean addAddress(Address address) {
        boolean result = false;
        System.out.println("lish长度" + consumerAddressMapper.findAll_ByConNo(address.getConsumerNo()).size());
        //添加的是默认地址并且该用户有地址信息(有才能修改，不然会报错),则修改默认地址
        if (address.getChecked() == 1 && consumerAddressMapper.findAll_ByConNo(address.getConsumerNo()).size()>0) {
            if (changeChecked(address.getConsumerNo(),-1,0)) { //把其他全部变为非默认
                if (consumerAddressMapper.addAddress(address) > 0) {
                    result = true;
                }
            }
        } else { //不是添加默认地址则不做改动
            if (consumerAddressMapper.addAddress(address) > 0) {
                result = true;
            }
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteAddress(int addressId) {
        boolean result = false;
        if (consumerAddressMapper.deleteAddress(addressId) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean changeChecked(String conNo, int addressId, int Checked) {
        boolean result = false;
        if (consumerAddressMapper.changeChecked(conNo,addressId,Checked) > 0) {
            result = true;
        }
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean modifyAddress(String conNo, int addressId, Address address) {
        boolean result = false;
        if (address.getChecked() == 1) { //增加的默认地址，需要修改其他的
            if (changeChecked(conNo,-1,0)) {
                if (consumerAddressMapper.modifyAddress(conNo,addressId,address) > 0) {
                    result = true;
                }
            }
        } else {
            if (consumerAddressMapper.modifyAddress(conNo,addressId,address) > 0) {
                result = true;
            }
        }
        return result;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Address> findAll_ByConNo(String consumerNo) {
        System.out.println("查询用户全部地址");
        return consumerAddressMapper.findAll_ByConNo(consumerNo);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Address findChecked(String consumerNo) {
        return consumerAddressMapper.findChecked(consumerNo);
    }

    @Override
    public Address findAddressById(int addressId) {
        return consumerAddressMapper.findAddressById(addressId);
    }
}
