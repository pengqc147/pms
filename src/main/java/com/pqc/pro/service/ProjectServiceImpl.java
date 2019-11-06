package com.pqc.pro.service;

import com.pqc.cust.bean.Customer;
import com.pqc.cust.bean.CustomerExample;
import com.pqc.cust.mapper.CustomerMapper;
import com.pqc.pro.bean.Project;
import com.pqc.pro.bean.ProjectExample;
import com.pqc.pro.mapper.ProjectMapper;
import com.pqc.sys.bean.Employee;
import com.pqc.sys.bean.EmployeeExample;
import com.pqc.sys.mapper.EmployeeMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;


@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    private ProjectMapper projectMapper;
    @Resource
    private CustomerMapper customerMapper;
    @Resource
    private EmployeeMapper employeeMapper;
    public void postInfo(Project project) {
        projectMapper.insert(project);
    }

    public List<Project> showProjectList() {
        List<Project> projects = projectMapper.showProjectList(new ProjectExample());
        return projects;
    }
    public List<Customer> getComnameAll() {
        return customerMapper.selectByExample(new CustomerExample());
    }

    public List<Employee> getmanagerAll() {
        return employeeMapper.selectByExample(new EmployeeExample());
    }


    public Project detailProject(Integer id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    public Customer getComname(Integer comname) {
        return customerMapper.selectByPrimaryKey(comname);
    }


    public Employee getmanager(Integer empFk) {
        return employeeMapper.selectByPrimaryKey(empFk);
    }


    public Project editProject(Integer id) {
        return null;
    }

    public void updateInfo(Project project) {
        projectMapper.updateByPrimaryKey(project);
    }


    public List<Project> keySearch(Integer cid,String keyword,Integer orderby) {
        return projectMapper.selectByKeySearch(cid,keyword,orderby);

    }

    public boolean deleteProject(Integer[] pids) {
        List<Integer> integers = Arrays.asList(pids);
        ProjectExample example = new ProjectExample();
        ProjectExample.Criteria criteria = example.createCriteria();
        criteria.andPidIn(integers);
        int i = projectMapper.deleteByExample(example);
        if(i > 0){
            return true;
        }else {
            return false;
        }
    }

    public List<Project> getproListInAnal() {
        return projectMapper.getproListInAnal();
    }

}
