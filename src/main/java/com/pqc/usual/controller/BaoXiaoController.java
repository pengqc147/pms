package com.pqc.usual.controller;

import com.github.pagehelper.PageInfo;
import com.pqc.common.PageCut;
import com.pqc.sys.bean.Employee;
import com.pqc.usual.bean.BaoXiao;
import com.pqc.usual.service.BaoXiaoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/baoxiao")
public class BaoXiaoController {

    @Autowired
    private BaoXiaoService baoXiaoService;

    @RequestMapping(value="/saveInfo",method = RequestMethod.POST)
    public String saveBaoXiaoInfo(BaoXiao baoXiao,HttpSession session){
        Employee loginUser = (Employee)session.getAttribute("loginUser");
        Integer eid = loginUser.getEid();
        baoXiao.setEmpFk(eid);
        baoXiaoService.saveBaoXiaoInfo(baoXiao);
        return "redirect:/baoxiao/list";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView showBaoXiaoInfo(HttpServletRequest request, HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
        //获取以search_开头的name属性值
        Map<String, Object> search = WebUtils.getParametersStartingWith(request, "search_");
        String queryStr = PageCut.searchToString(search);
        Employee loginUser = (Employee)session.getAttribute("loginUser");
        Integer eid = loginUser.getEid();
        String requestURI = request.getRequestURI();
        PageInfo<BaoXiao> page = baoXiaoService.showBaoXiaoInfo(eid,pageNum,search);
        ModelAndView mav = new ModelAndView("mybaoxiao-base");
        mav.addObject("page",page);
        mav.addObject("queryStr",queryStr);
        mav.addObject("requestURI",requestURI);
        return mav;
    }


}
