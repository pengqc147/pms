package com.pqc.usual.controller;

import com.pqc.sys.bean.Employee;
import com.pqc.usual.bean.ForumPost;
import com.pqc.usual.service.ForumPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/tiezi")
public class ForumPostController {

    @Autowired
    private ForumPostService forumPostService;

    @RequestMapping(value = "/saveInfo",method = RequestMethod.POST)
    public String saveInfo(ForumPost forumPost, HttpSession session){
        Employee loginUser = (Employee)session.getAttribute("loginUser");
        Integer eid = loginUser.getEid();
        forumPost.setEmpFk3(eid);
        forumPostService.saveInfo(forumPost);
        return "redirect:/main.jsp";
    }
}
