package cn.edu.gxu.service;

import cn.edu.gxu.model.Customer;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CustomerServiceTest {

    @Test
    public void queryAllCustomer() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        CustomerService customerService = (CustomerService) ctx.getBean("customerService");
        customerService.queryAllCustomer().forEach(System.out::println);
    }

    @Test
    public void queryCustomerById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        CustomerService customerService = (CustomerService) ctx.getBean("customerService");
        System.out.println(customerService.queryCustomerById(1));
    }

    @Test
    public void addCustomer() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        CustomerService customerService = (CustomerService) ctx.getBean("customerService");
        Customer customer = new Customer();
        customer.setName("shier");
        customer.setPhone("123456");
        customer.setAddress("广西");
        customer.setCompany("广西");
        System.out.println(customerService.addCustomer(customer));
    }

    @Test
    public void modifyCustomerById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        CustomerService customerService = (CustomerService) ctx.getBean("customerService");
        Customer customer = new Customer();
        customer.setId(4);
        customer.setPhone("9999999");
        System.out.println(customerService.modifyCustomerById(customer));
    }

    @Test
    public void removeCustomerById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        CustomerService customerService = (CustomerService) ctx.getBean("customerService");
        System.out.println(customerService.removeCustomerById(5));    }
}
