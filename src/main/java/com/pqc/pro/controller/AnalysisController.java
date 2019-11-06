package com.pqc.pro.controller;

import com.pqc.pro.bean.Analysis;
import com.pqc.pro.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/anal")
public class AnalysisController {
    @Autowired
    private AnalysisService analysisService;

    @RequestMapping(value = "/getInfo",method = RequestMethod.POST)
    public String getInfo(Analysis analysis){
        analysis.setAddtime(new Date());
        analysisService.getInfo(analysis);
        return "redirect:/anal/list";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView showAnalysisList(){
        List<Analysis> list = analysisService.showAnalysisList();
        ModelAndView mav = new ModelAndView("project-need");
        mav.addObject("list",list);
        return  mav;
    }
}
