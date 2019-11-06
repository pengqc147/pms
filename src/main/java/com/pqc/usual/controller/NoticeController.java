package com.pqc.usual.controller;

import com.github.pagehelper.PageInfo;
import com.pqc.common.PageCut;
import com.pqc.common.ResultEntity;
import com.pqc.sys.bean.Employee;
import com.pqc.usual.bean.BaoXiao;
import com.pqc.usual.bean.Notice;
import com.pqc.usual.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    @RequestMapping(value = "/saveInfo",method = RequestMethod.POST)
    @ResponseBody
    public ResultEntity saveInfo(Notice notice){
        noticeService.saveInfo(notice);
        return ResultEntity.success();
    }

    @RequestMapping(value = "/jsonList",method = RequestMethod.GET)
    @ResponseBody
    public ResultEntity showAllNotice(HttpServletRequest request, HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
       /* List<Notice> list = noticeService.showAllNotice();
        return ResultEntity.success().put("list",list);*/
        //获取以search_开头的name属性值
        Map<String, Object> search = WebUtils.getParametersStartingWith(request, "search_");
        String queryStr = PageCut.searchToString(search);
        Employee loginUser = (Employee)session.getAttribute("loginUser");
        Integer eid = loginUser.getEid();
        String requestURI = request.getRequestURI();
        PageInfo<Notice> page = noticeService.showAllNotice(eid,pageNum,search);
        return ResultEntity.success().put("page",page).put("queryStr",queryStr).put("requestURI",requestURI);
    }

    @RequestMapping(value = "/getNewList",method = RequestMethod.GET)
    @ResponseBody
    public ResultEntity getNewNoticeList(){
        List<Notice> list = noticeService.getNewNoticeList();
        return ResultEntity.success().put("list",list);
    }
    @RequestMapping(value = "/getThisList/{nid}",method = RequestMethod.GET)
    @ResponseBody
    public Notice getThisList(@PathVariable("nid") Integer nid ){
        return noticeService.getThisList(nid);
    }
}
