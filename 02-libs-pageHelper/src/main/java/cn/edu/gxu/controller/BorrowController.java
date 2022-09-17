package cn.edu.gxu.controller;

import cn.edu.gxu.model.Borrow;
import cn.edu.gxu.model.User;
import cn.edu.gxu.service.BookService;
import cn.edu.gxu.service.BorrowService;
import cn.edu.gxu.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class BorrowController {

    @Autowired
    private BorrowService borrowService;

    @Autowired
    private BookService bookService;

    @Autowired
    private CustomerService customerService;

    //    查找全部
    @RequestMapping("toBorrowList.do")
    public String toBorrowList(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                               Model model, HttpServletRequest request) {

        PageHelper.startPage(pn,5);
        List<Borrow> list = borrowService.queryAllBorrow();

        PageInfo<Borrow> page = new PageInfo<>(list,1);
        model.addAttribute("pageInfo",page);

        request.setAttribute("borrows", list);
        return "borrowlist";
    }

    //    进入借书页面
    @RequestMapping("toBorrowAddJsp.do")
    public String toBorrowAddJsp(HttpServletRequest request) {
        request.setAttribute("books", bookService.queryAllBook());
        request.setAttribute("customers", customerService.queryAllCustomer());
        request.setAttribute("borrows", borrowService.queryAllBorrow());
        return "borrowadd";
    }

    //借书
    @RequestMapping("toBorrowAdd.do")
    public void toBorrowAdd(HttpServletResponse response,Borrow borrow) throws IOException {
        borrowService.addBorrow(borrow);
        response.sendRedirect("toBorrowList.do");
    }

    //还书
    @RequestMapping("toBorrowReturn.do")
    public void toBorrowReturn(HttpServletResponse response,Integer id) throws IOException {
        Borrow borrow =borrowService.queryBorrowById(id);
        Date date = new Date();//获取当前的日期
        borrow.setRdate(new java.sql.Date(date.getTime()));
        borrowService.returnBook(borrow);
        response.sendRedirect("toBorrowList.do");
    }
}
