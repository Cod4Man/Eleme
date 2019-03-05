package com.cod4man.eleme;
import java.time.LocalDateTime;
import com.cod4man.eleme.pojo.Foods;

import com.cod4man.eleme.pojo.OrderDetail;
import com.cod4man.eleme.pojo.OrderHistory;
import com.cod4man.eleme.service.OrderDetailService;
import com.cod4man.eleme.service.OrderHistoryService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-03
 * Time:21:01
 */
public class ElemeTest {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private OrderDetailService orderDetailService =
            (OrderDetailService) applicationContext.getBean("OrderDetailService");
    private OrderHistoryService orderHistoryService =
            (OrderHistoryService) applicationContext.getBean("OrderHistoryService");
    @Test
    public void addOrderDeatilTest() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        OrderDetail orderDetail1 = new OrderDetail();
        orderDetail1.setOrderHistoryNo("11111111111111111111111");
        orderDetail1.setFoodsNo("苹果");
        orderDetail1.setFoodsNum(2);

        OrderDetail orderDetail2 = new OrderDetail();
        orderDetail2.setOrderHistoryNo("11111111111111111111111");
        orderDetail2.setFoodsNo("橘子");
        orderDetail2.setFoodsNum(3);
        orderDetails.add(orderDetail1);
        orderDetails.add(orderDetail2);
        if (orderDetailService.addOrderDetail(orderDetails)) {
            System.out.println("增加成功");
        } else {
            System.out.println("增加失败！");
        }
    }
    @Test
    public void addOrderHistoryTest() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        OrderDetail orderDetail1 = new OrderDetail();
        orderDetail1.setOrderHistoryNo("69697245920190304141655");
        orderDetail1.setFoodsNo("211111111");
        orderDetail1.setFoodsNum(2);

        OrderDetail orderDetail2 = new OrderDetail();
        orderDetail2.setOrderHistoryNo("69697245920190304141655");
        orderDetail2.setFoodsNo("211111112");
        orderDetail2.setFoodsNum(3);
        orderDetails.add(orderDetail1);
        orderDetails.add(orderDetail2);

        OrderHistory orderHistory = new OrderHistory();
        orderHistory.setOrderDetailList(orderDetails);
        orderHistory.setOrderHistoryNo("69697245920190304141655");
        orderHistory.setConsumerNo("696972459");
        orderHistory.setRestaurantNo("211111111");
        orderHistory.setOrderDate(LocalDateTime.now());
        orderHistory.setAddressId(55);
        orderHistory.setOrderStatus(3);

        if (orderHistoryService.addOrderHistory(orderHistory)) {
            System.out.println("增加成功");
        } else {
            System.out.println("增加失败！");
        }
    }
    @Test
    public void javaSETEst() {
        byte a =1;
        byte b=1;
//报错 byte=int        byte c = a-b;
        short d =1;
        short e = 1;
//报错 short=int        short f = d- e;
//        byte char short  int long boolean double float
        char g =1;
        char h = 1;
//报错 char=int        char i = g-h;
        long al = 1;
        long bl= 1;
        long cl = al + bl;

        float af = 0.1f;
        float bf = 0.1f;
        float cf = af + bf;
    }
}
