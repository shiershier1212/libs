package cn.edu.gxu.service;

import cn.edu.gxu.model.User;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserServiceTest {
    @Test
    public void queryAllUser(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        userService.queryAllUser().forEach(System.out::println);
    }

    @Test
    public void queryUserById(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        System.out.println(userService.queryUserById(11));
    }

    @Test
    public void addUser(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        User user = new User();
        user.setName("shier");
        user.setPhone("123456");
        user.setPass("123456");
        System.out.println(userService.addUser(user));
    }

    @Test
    public void modifyUserById(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        User user = new User();
        user.setId(45);
        user.setName("changeTest");
        System.out.println(userService.modifyUserById(user));
    }

    @Test
    public void removeUserById(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        System.out.println(userService.removeUserById(43));
    }

    @Test
    public void queryByPhoneAndPass(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        UserService userService = (UserService) ctx.getBean("userService");
        System.out.println(userService.queryByPhoneAndPass("111","666"));
    }

}
