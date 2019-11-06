package com.pqc.compare.controller;

import com.pqc.compare.bean.Datacollect;
import com.pqc.compare.service.DatacollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/coll")
public class DatacollectController {

    @Autowired
    private DatacollectService datacollectService;

    @RequestMapping(value = "/saveInfo",method = RequestMethod.POST)
    public String saveInfo(Datacollect datacollect){
        datacollectService.saveInfo(datacollect);
        return "redirect:/indexvalue-base.jsp";
    }
    @RequestMapping(value = "/list/{datime}",method = RequestMethod.GET)
    @ResponseBody
    public List<Datacollect> getDatacollectList(@PathVariable("datime")Date datime){
        return datacollectService.getDatacollectList(datime);

    }
}
