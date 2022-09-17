package cn.edu.gxu.service;

import cn.edu.gxu.dao.CustomerDao;
import cn.edu.gxu.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> queryAllCustomer();

    Customer queryCustomerById(Integer id);

    Integer addCustomer(Customer customer);

    Integer modifyCustomerById(Customer customer);

    Integer removeCustomerById(Integer id);
}
