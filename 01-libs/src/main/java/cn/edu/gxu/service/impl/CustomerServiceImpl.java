package cn.edu.gxu.service.impl;

import cn.edu.gxu.dao.CustomerDao;
import cn.edu.gxu.model.Customer;
import cn.edu.gxu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<Customer> queryAllCustomer() {
        return customerDao.selectAllCustomer();
    }

    @Override
    public Customer queryCustomerById(Integer id) {
        return customerDao.selectCustomerById(id);
    }

    @Override
    public Integer addCustomer(Customer customer) {
        return customerDao.insertCustomer(customer);
    }

    @Override
    public Integer modifyCustomerById(Customer customer) {
        return customerDao.updateCustomerById(customer);
    }

    @Override
    public Integer removeCustomerById(Integer id) {
        return customerDao.deleteCustomerById(id);
    }
}
