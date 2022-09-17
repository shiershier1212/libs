package cn.edu.gxu.service;

import cn.edu.gxu.model.User;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserServiceTest {
    @Test
    public void test1(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        User user = userService.queryByPhoneAndPass("111","123");
        if (user!=null){
            System.out.println("yesssssssssssssssssssssssssssss");
        }
    }
}
