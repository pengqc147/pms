package com.pqc.sys.service;

import com.pqc.sys.bean.Employee;
import com.pqc.sys.bean.EmployeeExample;
import com.pqc.sys.mapper.EmployeeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;
    public List<Employee> getEmployeeEname() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andPFkEqualTo(4);
        List<Employee> employees = employeeMapper.selectByExample(example);
        return employees;
    }

    public Employee login(Employee employee) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(employee.getUsername());
        criteria.andPasswordEqualTo(employee.getPassword());
        List<Employee> employees = employeeMapper.selectByExample(example);
        if(employees != null && employees.size()>0){
            employee = employees.get(0);
            return employee;
        }
        return null;
    }

    public List<Employee> getOthersEname(Integer eid) {
        return employeeMapper.getOthersEname(eid);
    }
}
