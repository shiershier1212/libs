package cn.edu.gxu.controller;

import cn.edu.gxu.model.User;
import cn.edu.gxu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/")
public class LoginLogoutController {

    @Autowired
    private UserService userService;

    @RequestMapping("toLoginJsp.do")
    public String toLoginJsp(){
        return "singin";
    }

    @RequestMapping("toLogin.do")
    public void toLogin(HttpServletResponse response, @Param("phone") String phone, @Param("pass") String pass) throws IOException {
        System.out.println(phone+pass);
        User user = userService.queryByPhoneAndPass(phone,pass);
        if(user!=null){
//            跳转
            response.sendRedirect("toUserList.do");
        }
    }
}
