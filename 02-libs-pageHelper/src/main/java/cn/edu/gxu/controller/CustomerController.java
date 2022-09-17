package cn.edu.gxu.controller;

import cn.edu.gxu.model.Customer;
import cn.edu.gxu.model.User;
import cn.edu.gxu.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String toCustomerList(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                 Model model, HttpServletRequest request) {
        PageHelper.startPage(pn, 5);
        List<Customer> list = customerService.queryAllCustomer();

        PageInfo<Customer> page = new PageInfo<>(list, 1);
        model.addAttribute("pageInfo", page);

        request.setAttribute("customers", list);
        return "customerlist";
    }

    //    跳转到客户新增页面
    @RequestMapping("toCustomerAddJsp.do")
    public String toCustomerAddJsp() {
        return "customeradd";
    }

    //    添加客户
    @RequestMapping("toCustomerAdd.do")
    public void toCustomerAdd(HttpServletResponse response, Customer customer) throws IOException {
        customerService.addCustomer(customer);
        response.sendRedirect("toCustomerList.do");
    }

    //    跳转到客户编辑页面
    @RequestMapping("toCustomerEditJsp.do")
    public String toCustomerEditJsp(HttpServletRequest request, Integer id) {
        Customer customer = customerService.queryCustomerById(id);
        request.setAttribute("customer", customer);
        return "customeredit";
    }

    //    跳转到客户编辑页面
    @RequestMapping("toCustomerEdit.do")
    public void toCustomerEdit(HttpServletResponse response, Customer customer) throws IOException {
        customerService.modifyCustomerById(customer);
        response.sendRedirect("toCustomerList.do");
    }

    //删除客户信息
    @RequestMapping("toCustomerDelete.do")
    public void toCustomerDelete(HttpServletResponse response, Integer id) throws IOException {
        customerService.removeCustomerById(id);
        response.sendRedirect("toCustomerList.do");
    }

}
