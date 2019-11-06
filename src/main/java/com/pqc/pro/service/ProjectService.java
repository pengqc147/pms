package com.pqc.pro.service;

import com.pqc.cust.bean.Customer;
import com.pqc.pro.bean.Project;
import com.pqc.sys.bean.Employee;

import java.util.List;


public interface ProjectService {

    void postInfo(Project project);

    List<Project> showProjectList();
    List<Customer> getComnameAll();
    List<Employee> getmanagerAll();

    Project detailProject(Integer id);
    Customer getComname(Integer comname);
    Employee getmanager(Integer empFk);

    Project editProject(Integer id);

    void updateInfo(Project project);


    List<Project> keySearch(Integer cid, String keyword, Integer orderby);

    boolean deleteProject(Integer[] pids);

    List<Project> getproListInAnal();
}
