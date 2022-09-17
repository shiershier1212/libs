package cn.edu.gxu.controller;

import cn.edu.gxu.model.Type;
import cn.edu.gxu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/")
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("toTypeList.do")
    public String toTypeList(HttpServletRequest request) {
        List<Type> list = typeService.queryAllType();
        System.out.println(list);
        request.setAttribute("types", list);
        return "typelist";
    }

    //跳转到 类型添加 页面 typeadd.jsp
    @RequestMapping("toTypeAddJsp.do")
    public String toTypeAddJsp() {
        return "typeadd";
    }

    //执行 类型 添加方法
    @RequestMapping("toTypeAdd.do")
    public void toTypeAdd(HttpServletResponse response, Type type) throws IOException {
        typeService.addType(type);
        response.sendRedirect("toTypeList.do");
    }

    //跳转到 修改类型 typeedit.jsp 页面
    @RequestMapping("toTypeEditJsp.do")
    public String toTypeEditJsp(HttpServletRequest request, Integer id) {
        request.setAttribute("typeid", id);
        return "typeedit";
    }

    //修改类型信息
    @RequestMapping("toTypeEdit.do")
    public void toTypeUpdate(HttpServletResponse response, Type type) throws IOException {
        if (type.getTypename() != null) {
            Integer re = typeService.modifyType(type);
            System.out.println(re);
        }
        response.sendRedirect("toTypeList.do");
    }

    //删除类型
    @RequestMapping("toTypeDelete.do")
    public void toTypeDelete(HttpServletResponse response, Integer id) throws IOException {
        if (id != null) {
            Integer re = typeService.removeTypeById(id);
            System.out.println(re);
        }
        response.sendRedirect("toTypeList.do");
    }
}
