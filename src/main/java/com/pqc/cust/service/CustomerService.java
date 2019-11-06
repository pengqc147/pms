package com.pqc.cust.service;

import com.pqc.cust.bean.Customer;

import java.util.List;

public interface CustomerService {

    void getInfo(Customer customer);

    List<Customer> showCustomerList();

    Customer detailCustomer(Integer id);

    void updateInfo(Customer customer);

    boolean deleteCustomers(Integer[] ids);

    List<Customer> searchCustomerList(Integer cid, String keyword, Integer orderby);
}
