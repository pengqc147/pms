package com.pqc.sys.controller;

import com.pqc.sys.bean.Employee;
import com.pqc.sys.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmploController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/enames",method = RequestMethod.GET)
    @ResponseBody
    public List<Employee> getEmployeeEname(){

       return employeeService.getEmployeeEname();

    }
    /*如果重定向的时候想携带数据到页面
    1.在目标方法的参数上使用RedirectAttributes类型
    2.不能直接重定向到页面，需要经过springmvc的映射
    * */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Employee employee, String code, HttpSession session, RedirectAttributes attributes){
        String validateCode = (String) session.getAttribute("validateCode");
        if(code.equalsIgnoreCase(validateCode)){
            employee = employeeService.login(employee);
            //清空验证码
            session.removeAttribute("validateCode");
            if(employee != null){
                session.setAttribute("loginUser",employee);
                return "redirect:/index.jsp";
            }else{
                attributes.addFlashAttribute("errorMsg","用户名或密码错误");
                return "redirect:/login";
            }
        }
        attributes.addFlashAttribute("errorMsg","验证码错误");
        return "redirect:/login";
    }
    @RequestMapping(value = "/loginOut",method = RequestMethod.GET)
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }
    @RequestMapping(value = "/others",method = RequestMethod.GET)
    @ResponseBody
    public List<Employee> getOthersEname(HttpSession session){
        Employee loginUser = (Employee)session.getAttribute("loginUser");
        Integer eid = loginUser.getEid();
        List<Employee> list = employeeService.getOthersEname(eid);
        return  list;
    }
}
