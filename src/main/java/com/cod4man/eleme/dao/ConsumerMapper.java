package com.cod4man.eleme.dao;

import com.cod4man.eleme.pojo.Consumer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户类DAO
 * @param
 * @return
 * @author zhj
 * @creed: Talk is cheap,show me the code
 * @date 2019/2/22
 */
public interface ConsumerMapper {
	//添加买家账户
	public int addConsumer(Consumer consumer);
	//查询全部
	public List<Consumer> getList();
	//修改用户余额
	public int modifyBalance(@Param("consumer") Consumer consumer,
                                                  @Param("money") double money);
	//修改用户密码
	public int modifyPassword(Consumer consumer);
	//修改用户信息
	public int update(Consumer consumer);
	//通过电话号码查询账户是否存在
	public Consumer conExists(Consumer consumer);
    //通过电话号码、密码登录
    Consumer loginByPsw(Consumer consumer);
    //查看买家ID是否重复
    int consumerNoUnique(@Param("consumerNo") String consumerNo);

}
