package com.pqc.cust.service;

import com.pqc.cust.bean.Customer;
import com.pqc.cust.bean.CustomerExample;
import com.pqc.cust.mapper.CustomerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;


@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;
    public void getInfo(Customer customer) {
        customerMapper.insert(customer);
    }

    public List<Customer> showCustomerList() {

        List<Customer> customers = customerMapper.selectByExample(new CustomerExample());
        return customers;
    }

    public Customer detailCustomer(Integer id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        return customer;
    }

    public void updateInfo(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }
    public boolean deleteCustomers(Integer[] ids) {
        List<Integer> integers = Arrays.asList(ids);
        CustomerExample example = new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(integers);
        int i = customerMapper.deleteByExample(example);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    public List<Customer> searchCustomerList(Integer cid, String keyword, Integer orderby) {

        CustomerExample example = new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();
        if(cid == 0){
            criteria.andComnameLike("%"+keyword+"%");
            CustomerExample.Criteria criteria1 = example.createCriteria();
            criteria1.andCompanypersonLike("%"+keyword+"%");
            example.or(criteria1);
        }else if(cid == 1){
            criteria.andComnameLike("%"+keyword+"%");
        }else{
            criteria.andCompanypersonLike("%"+keyword+"%");
        }
        if(orderby == 1){
            example.setOrderByClause("id desc");
        }
        List<Customer> customers = customerMapper.selectByExample(example);
        return customers;
    }

}
