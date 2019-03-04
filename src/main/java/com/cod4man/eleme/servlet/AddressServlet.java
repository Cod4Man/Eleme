package com.cod4man.eleme.servlet;

import com.alibaba.fastjson.JSON;
import com.cod4man.eleme.pojo.Address;
import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.service.ConsumerAddressService;
import com.cod4man.eleme.service.ConsumerService;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-02
 * Time:23:51
 */
@WebServlet(name = "AddressServlet", urlPatterns = "/address.do")
public class AddressServlet extends HttpServlet {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private ConsumerAddressService consumerAddressService =
            (ConsumerAddressService) applicationContext.getBean("ConsumerAddressService");
    private ConsumerService consumerService =
            (ConsumerService) applicationContext.getBean("ConsumerService");
    private PrintWriter printWriter ;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        printWriter = response.getWriter();
        String what = request.getParameter("what");
        if (what != null && !what.equals("")) {
            switch (what) {
                case "setAddress": setAddress(request, response); break;
                case "addressList": showAddressList(request, response); break;
                case "deleteAddress": deleteAddress(request, response); break;
                case "addressChecked": addressChecked(request, response); break;
                case "getAddressById": getAddressById(request, response); break;
                default: break;
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    private void getAddressById(HttpServletRequest request, HttpServletResponse response) {
        String addressIdStr = request.getParameter("addressId");
        if (addressIdStr != null) {
            Address address = consumerAddressService.findAddressById(Integer.parseInt(addressIdStr));
            String addressJson = JSON.toJSONString(address);
            System.out.println("JSONString=" + addressJson);
            printWriter.write(addressJson);
        }
    }

    private void addressChecked(HttpServletRequest request, HttpServletResponse response) {
        String addressIdStr = request.getParameter("addressId");
        String consumerNo = request.getParameter("consumerNo");
        if (addressIdStr !=null && consumerNo != null ) {
            if (consumerAddressService.changeChecked(consumerNo,-1,0)
                && consumerAddressService.changeChecked(consumerNo,Integer.parseInt(addressIdStr),1)) {
                //session-consumer要刷新
                Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
                Address address = consumerAddressService.findChecked(consumerNo);
                consumer.setConsumerAddressChecked(address);
                request.getSession().setAttribute("consumer",consumer);
                printWriter.write("true");
                return;
            }
        }
        printWriter.write("false");
    }

    private void deleteAddress(HttpServletRequest request, HttpServletResponse response) {
        String addressIdStr = request.getParameter("addressId");
        if (addressIdStr != null) {
            if (consumerAddressService.deleteAddress(Integer.parseInt(addressIdStr))) {
                //session-consumer要刷新
                Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
                Address address = consumerAddressService.findChecked(consumer.getConsumerNo());
                consumer.setConsumerAddressChecked(address);
                request.getSession().setAttribute("consumer",consumer);
                printWriter.write("true");
                return;
            }
        }
        printWriter.write("false");
    }

    private void showAddressList(HttpServletRequest request, HttpServletResponse response) {
        Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
        List<Address> addressList = consumerAddressService.findAll_ByConNo(consumer.getConsumerNo());
        request.setAttribute("addressList", addressList);
        try {
            request.getRequestDispatcher("/pages/address/addressManager.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void setAddress(HttpServletRequest request, HttpServletResponse response) {
        String addressId = request.getParameter("addressId");

        String pointLng = request.getParameter("pointLng");
        String pointLat = request.getParameter("pointLat");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String street = request.getParameter("street");
        String business = request.getParameter("business");
        String streetNumber = request.getParameter("streetNumber");
        String name = request.getParameter("name_Address");
        String comment = request.getParameter("comment_Address");
        String consumerNo = request.getParameter("consumerNo_Address");
        String phoneNum = request.getParameter("phoneNum_Address");
        String consumerPhoneNum = request.getParameter("consumerPhoneNum");
        String addressChecked = request.getParameter("addressChecked");
        Address address = new Address();
        address.setName("" + name);
        address.setPhoneNum("" + phoneNum);
        address.setUser(0);
        address.setBusiness("" + business);
        address.setPointLat(Double.parseDouble(pointLat));
        address.setPointLng(Double.parseDouble(pointLng));
        address.setConsumerNo("" + consumerNo);
        address.setProvince("" + province);
        address.setCity("" + city);
        address.setDistrict("" + district);
        address.setStreet("" + street);
        address.setStreetNumber("" + streetNumber);
        address.setComment("" + comment);
        address.setChecked(Integer.parseInt(addressChecked));
        //添加地址
        if (addressId == null) { //说明是增加地址
            if (consumerAddressService.addAddress(address)) { //添加成功
                printWriter.write("true");
            } else { //添加失败
                printWriter.write("false");
            }
        } else { //说明是修改地址
            if (consumerAddressService.modifyAddress(consumerNo, Integer.parseInt(addressId),address)) {
                printWriter.write("true");
            } else { //修改失败
                printWriter.write("false");
            }
        }
        //刷新session的consumer
        Consumer consumerTemp = new Consumer();
        consumerTemp.setConsumerPhoneNum(consumerPhoneNum);
        Consumer consumer = consumerService.conExists(consumerTemp);
        consumer.setConsumerAddressChecked(address);
        request.getSession().removeAttribute("consumer");
        request.getSession().setAttribute("consumer",consumer);
        }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
