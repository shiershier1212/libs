package cn.edu.gxu.controller;

import cn.edu.gxu.model.Customer;
import cn.edu.gxu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/")
public class CustomerController {

    @Autowired
    private CustomerService customerService;


//    查询所有
    @RequestMapping("toCustomerList.do")
    public String toCustomerList(HttpServletRequest request){
        List<Customer> list = customerService.queryAllCustomer();
        request.setAttribute("customers",list);
        return "customerlist";
    }

//    跳转到客户新增页面
    @RequestMapping("toCustomerAddJsp.do")
    public String toCustomerAddJsp(){
        return "customeradd";
    }

//    添加客户
    @RequestMapping("toCustomerAdd.do")
    public void   toCustomerAdd(HttpServletResponse response,Customer customer) throws IOException {
        customerService.addCustomer(customer);
        response.sendRedirect("toCustomerList.do");
    }


    //    跳转到客户编辑页面
    @RequestMapping("toCustomerEditJsp.do")
    public String toCustomerEditJsp(HttpServletRequest request,Integer id){
        Customer customer = customerService.queryCustomerById(id);
        request.setAttribute("customer",customer);
        return "customeredit";
    }


    //    跳转到客户编辑页面
    @RequestMapping("toCustomerEdit.do")
    public void toCustomerEdit( HttpServletResponse response,Customer customer) throws IOException {
        customerService.modifyCustomerById(customer);
        response.sendRedirect("toCustomerList.do");
    }


}
