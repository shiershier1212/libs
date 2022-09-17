package cn.edu.gxu.controller;

import cn.edu.gxu.model.Book;
import cn.edu.gxu.model.Type;
import cn.edu.gxu.service.BookService;
import cn.edu.gxu.service.TypeService;
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
import java.util.List;

@Controller
@RequestMapping("/")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private TypeService typeService;

    //    查询所有
    @RequestMapping("toBookList.do")
    public String toBookList(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
                             HttpServletRequest request) {
        PageHelper.startPage(pn, 3);//要放在前面
        List<Book> list = bookService.queryAllBook();

        PageInfo<Book> page = new PageInfo<>(list, 1);
        model.addAttribute("pageInfo", page);

        request.setAttribute("books", list);
        return "booklist";
    }

    //    跳转
    @RequestMapping("toBookAddJsp.do")
    public String toBookAddJsp(HttpServletRequest request) {
        List<Type> types = typeService.queryAllType();
        request.setAttribute("types", types);
        return "bookadd";
    }

    //    添加书本信息
    @RequestMapping("toBookAdd.do")
    public void toBookAdd(HttpServletResponse response, Book book) throws IOException {
        System.out.println(book);
        bookService.addBook(book);
        response.sendRedirect("toBookList.do");
    }

    //    进入修改页面
    @RequestMapping("toBookEditJsp.do")
    public String toBookEditJsp(HttpServletRequest request, Integer id) {
        Book book = bookService.queryBookById(id);
        List<Type> types = typeService.queryAllType();
        request.setAttribute("types", types);
        request.setAttribute("book", book);
        return "bookedit";
    }

    //    修改书本信息
    @RequestMapping("toBookEdit.do")
    public void toBookEdit(HttpServletResponse response, Book book) throws IOException {
        bookService.modifyBookById(book);
        response.sendRedirect("toBookList.do");
    }

    //    删除书籍信息
    @RequestMapping("toBookDelete.do")
    public void toBookDelete(HttpServletResponse response, Integer id) throws IOException {
        bookService.removeBookById(id);
        response.sendRedirect("toBookList.do");
    }
}
