package com.pqc.pro.controller;


import com.pqc.cust.bean.Customer;
import com.pqc.pro.bean.Project;
import com.pqc.pro.service.ProjectService;
import com.pqc.sys.bean.Employee;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/pro")
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    @RequestMapping(value = "/postInfo",method = RequestMethod.POST)
    public String postInfo(Project project){
        projectService.postInfo(project);
        return  "redirect:/pro/list";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView showProjectList(){
        List<Project> list = projectService.showProjectList();
        List<Customer> cusList = projectService.getComnameAll();
        List<Employee> empList = projectService.getmanagerAll();
        ModelAndView mav = new ModelAndView("project-base");
        mav.addObject("list",list);
        mav.addObject("cusList",cusList);
        mav.addObject("empList",empList);
        return  mav;
    }
    @RequestMapping(value = "/detail/{id}",method = RequestMethod.GET)
    public String detailProject(@PathVariable("id") Integer id, Map<String,Object> map){
        Project project = projectService.detailProject(id);
        Integer comname = project.getComname();
        Integer empFk = project.getEmpFk();
        Customer customer = projectService.getComname(comname);
        Employee employee = projectService.getmanager(empFk);
        map.put("project",project);
        map.put("customer",customer);
        map.put("employee",employee);
        return  "project-base-look";
    }
    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public String editCustomer(@PathVariable("id") Integer id, Map<String,Object> map){
        Project project = projectService.detailProject(id);
        List<Customer> cusList = projectService.getComnameAll();
        List<Employee> empList = projectService.getmanagerAll();
        map.put("project",project);
        map.put("cusList",cusList);
        map.put("empList",empList);
        return  "project-base-edit";
    }
    @RequestMapping(value = "/update",method = RequestMethod.PUT)
    public String updateInfo(Project project){
        projectService.updateInfo(project);
        return "redirect:/pro/list";
    }
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView keySearch(Integer cid,String keyword,Integer orderby){
        ModelAndView mav = new ModelAndView("project-base");
        List<Project> list = projectService.keySearch(cid,keyword,orderby);
        mav.addObject("list",list);
        return mav;
    }
    @RequestMapping(value = "/del",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteProject(@RequestParam("pids[]") Integer[] pids){
        boolean result = projectService.deleteProject(pids);
        Map<String,Object> map = new HashMap<>();
        if(result){
            map.put("statusCode","200");
            map.put("message","删除成功");
        }else {
            map.put("statusCode","500");
            map.put("message","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/jsonList",method = RequestMethod.GET)
    @ResponseBody
    public List<Project> getJsonList(){
        return projectService.showProjectList();
    }

    @RequestMapping(value = "/proListInAnal",method = RequestMethod.GET)
    @ResponseBody
    public List<Project> getproListInAnal(){
        return projectService.getproListInAnal();
    }

}
