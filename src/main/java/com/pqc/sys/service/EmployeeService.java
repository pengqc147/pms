package com.pqc.sys.service;

import com.pqc.sys.bean.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> getEmployeeEname();

    Employee login(Employee employee);

    List<Employee> getOthersEname(Integer eid);
}
