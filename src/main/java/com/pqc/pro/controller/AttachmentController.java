package com.pqc.pro.controller;

import com.pqc.pro.bean.Attachment;
import com.pqc.pro.bean.Project;
import com.pqc.pro.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/atta")
public class AttachmentController {

    @Autowired
    private AttachmentService attachmentService;
    @RequestMapping(value = "/getInfo",method = RequestMethod.POST)
    public String getInfo(Attachment attachment, MultipartFile atta, HttpSession session){
        //创建文件保存路径
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/upload");
        File file = new File(realPath);
        //判断文件是否存在
        if(!file.exists()){
            file.mkdirs();
        }
        //获取文件名
        String originalFilename = atta.getOriginalFilename();
        //解决重名问题
        String realName = UUID.randomUUID().toString().replaceAll("-", "") + originalFilename;
        try {
            atta.transferTo(new File(realPath+"/"+realName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        attachment.setPath(realPath+"\\"+realName);
        System.out.println(attachment);
        attachmentService.getInfo(attachment);
        return "redirect:/atta/list";

    }
    @RequestMapping(value ="/list",method = RequestMethod.GET)
    public ModelAndView ShowAttachmentList(){
        List<Attachment> list = attachmentService.ShowAttachmentList();
        ModelAndView mav = new ModelAndView("project-file");
        mav.addObject("list",list);
        return mav;
    }
}
