package cn.edu.gxu.controller;

import cn.edu.gxu.model.Type;
import cn.edu.gxu.model.User;
import cn.edu.gxu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.PublicKey;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;


//    进入增加用户信息界面
    @RequestMapping("toUserAddJsp.do")
    public String toUserAddJsp() {
        return "useradd";
    }


//    添加用户信息
    @RequestMapping("toUserAdd.do")
    public void toUserAdd(HttpServletResponse response,User user) throws IOException {
        System.out.println(userService.addUser(user));
        response.sendRedirect("toUserList.do");
    }

    //进入userlist页面
    @RequestMapping("toUserList.do")
    public String toUserList(HttpServletRequest request) {
        List<User> list = userService.queryAllUser();
        request.setAttribute("users", list);
        return "userlist";
    }


    //    进入修改界面
    @RequestMapping("toUserEditJsp.do")
    public String toUserEditJsp(HttpServletRequest request, Integer id) {
        User user = userService.queryUserById(id);
        request.setAttribute("user",user);
        return "useredit";
    }

    //    修改用户信息
    @RequestMapping("toUserEdit.do")
    public void toUserEdit(HttpServletResponse response, User user) throws IOException {
        System.out.println(userService.modifyUserById(user));
        response.sendRedirect("toUserList.do");
    }

    //    删除用户信息
    @RequestMapping("toUserDelete.do")
    public void toUserDelete(HttpServletResponse response, Integer id) throws IOException {
        System.out.println(userService.removeUserById(id));
        response.sendRedirect("toUserList.do");
    }
}
