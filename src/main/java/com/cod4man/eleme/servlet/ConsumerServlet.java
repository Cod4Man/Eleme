package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.Address;
import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.service.ConsumerService;
import com.cod4man.eleme.util.RandomUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.cod4man.eleme.util.RandomUtil.random;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-24
 * Time:12:43
 */
@WebServlet(name = "ConsumerServlet", urlPatterns = "/consumer.do")
public class ConsumerServlet extends HttpServlet {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private ConsumerService consumerService =
            (ConsumerService) applicationContext.getBean("ConsumerService");
    private PrintWriter printWriter ;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        printWriter = response.getWriter();
        String what =  request.getParameter("what");
        if (what != null && !what.equals("")) {
            switch (what) {
                case "addConsumer" : addConsumer(request, response); break;
                case "ConsumerExists" : ConsumerExists(request, response); break;
                case "ConsumerLoginByPsw" : ConsumerLoginByPsw(request, response); break;
                case "setAddress" : setAddress(request, response); break;
                default : break;
            }
        }

        printWriter.flush();
        printWriter.close();
    }

    private void setAddress(HttpServletRequest request, HttpServletResponse response) {
        String pointLng = request.getParameter("pointLng");
        String pointlat = request.getParameter("pointlat");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String street = request.getParameter("street");
        String business = request.getParameter("business");
        String streetNumber = request.getParameter("streetNumber");
        Address address = new Address();
        address.setName("");
        address.setPhoneNum("");
        address.setUser(0);
        address.setBusiness("");
        address.setPointLat(0.0D);
        address.setPointLng(0.0D);
        address.setId(0);
        address.setConsumerNo("");
        address.setProvince("");
        address.setCity("");
        address.setDistrict("");
        address.setStreet("");
        address.setStreetNumber("");
        address.setComment("");
        address.setChecked(0);





    }

    private void ConsumerLoginByPsw(HttpServletRequest request, HttpServletResponse response) {
        Consumer consumer = new Consumer();
        String phoneNum = request.getParameter("consumerPhoneNum");
        String password = request.getParameter("consumerLoginPsw");
        consumer.setConsumerPhoneNum(phoneNum);
        consumer.setConsumerPhoneNum(password);
        Consumer consumer1 = consumerService.loginByPsw(consumer);
        if (consumer1 != null) { //尚未注册
            printWriter.write("false");
        } else { //已注册
            printWriter.write("true");
            //已注册，则携带Consumer跳转至eleme首页
            try {
                request.setAttribute("consumer",consumer1);
                request.getRequestDispatcher("/restaurant.do?info=findAll").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void ConsumerExists(HttpServletRequest request, HttpServletResponse response) {
        Consumer consumer = new Consumer();
        String phoneNum = request.getParameter("consumerPhoneNum");
        consumer.setConsumerPhoneNum(phoneNum);
        Consumer consumer1 = consumerService.conExists(consumer);
        if (consumer1 != null) { //尚未注册
            printWriter.write("false");
        } else { //已注册
            printWriter.write("true");
        }
    }

    private void addConsumer(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("增加用户");
        String phoneNum = request.getParameter("consumerPhoneNum");
        String consumerNickName = request.getParameter("consumerNickName");
        String consumerLoginPsw = request.getParameter("consumerLoginPsw");
        String consumerMail = request.getParameter("consumerMail");
        String consumerPortraitURL = request.getParameter("consumerPortraitURL");
        Consumer consumer = new Consumer();
        //生成用户随机编号
        int cosumerNo =  RandomUtil.random(100000000,999999999);
        while (consumerService.consumerNoUnique(cosumerNo + "")) {
            cosumerNo =  RandomUtil.random(100000000,999999999);
        }
        consumer.setConsumerNo("" + cosumerNo);
        consumer.setConsumerPhoneNum(phoneNum);
        consumer.setConsumerNickName(consumerNickName);
        consumer.setConsumerLoginPsw(consumerLoginPsw);
        consumer.setConsumerMail(consumerMail);
        consumer.setConsumerStatus(1);
        consumer.setConsumerWechar("暂未开发");
        consumer.setConsumerVIP(0);
        consumer.setConsumerPortraitURL(consumerPortraitURL);
        consumer.setConsumerBalance(0.0D);

        if (consumerService.addConsumer(consumer)) {//添加成功
            printWriter.write("true");
            //携带consumer跳转至主页
            request.setAttribute("consumer",consumer);
            try {
                request.getRequestDispatcher("/restaurant.do?info=findAll").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            printWriter.write("false");
        }
    }
}
