package com.pqc.jobs;

import com.pqc.info.bean.Email;

import org.quartz.*;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;

public class EmailJob implements Job {
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        JobDataMap dataMap = jobExecutionContext.getMergedJobDataMap();
        Email email = (Email)dataMap.get("email");
        JavaMailSenderImpl javaMailSender = (JavaMailSenderImpl)dataMap.get("javaMailSenderImpl");
        Scheduler sched = (Scheduler)dataMap.get("sched");
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper  =null;
        try {
            //邮件对象
            helper =new MimeMessageHelper(mimeMessage,true,"UTF-8");

            helper.setFrom("pqc199863@163.com");
            helper.setTo(email.getEname());
            helper.setSubject(email.getTitle());
            helper.setText(email.getContent());

            //发送邮件
            javaMailSender.send(mimeMessage);

            System.out.println("EMAIL PASS");
            sched.shutdown();
        } catch (Exception e) {
            e.printStackTrace();
        }

       /* System.out.println("zheshi1ceshi");*/
    }
}
