package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class BookServiceTest {


    @Test
    public void test(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        List<Book> list = bookService.queryAllBook();
        list.forEach(System.out::println);
    }

    @Test
    public void queryBookById(){
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        Book book = bookService.queryBookById(1);
        System.out.println(book);
    }
}
