import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.io.File;

public class AppTest {

    public static void main(String[] args) {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans-quartz.xml");

    }
    @Test
    public  void test01() throws  Exception{
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans-email.xml");
        JavaMailSenderImpl bean = context.getBean(JavaMailSenderImpl.class);

        //邮件对象
        MimeMessage mimeMessage = bean.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");


        helper.setFrom("pqc199863@163.com");
        helper.setTo("pqc14790662614@163.com");
        helper.setSubject("这是一封邮件");
        helper.setText("<html><head></head><body>图片</p><img src=cid:dqwj></body></html>",true);
        /*FileSystemResource file = new FileSystemResource(new File("d:\\Desktop\\sexgirl.jpg"));
        //图片作为附件下载
        helper.addAttachment("CoolImage.jpg",file);
        //图片作为内置资源
        helper.addInline("dqwj",file);*/
        //发送邮件
        bean.send(mimeMessage);

        System.out.println("EMAIL PASS");
    }
}
