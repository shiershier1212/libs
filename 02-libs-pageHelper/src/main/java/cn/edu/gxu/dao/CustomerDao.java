package cn.edu.gxu.dao;

import cn.edu.gxu.model.Customer;

import java.util.List;

public interface CustomerDao {
    List<Customer> selectAllCustomer();

    Customer selectCustomerById(Integer id);

    Integer insertCustomer(Customer customer);

    Integer updateCustomerById(Customer customer);

    Integer deleteCustomerById(Integer id);
}
