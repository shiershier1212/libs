package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class BookServiceTest {
    @Test
    public void queryAllBook() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        bookService.queryAllBook().forEach(System.out::println);
    }

    @Test
    public void queryBookById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        System.out.println(bookService.queryBookById(1));
    }

    @Test
    public void addBook() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        Book book = new Book();
        book.setName("计算机网络");
        book.setEname("ComputerNetwork");
        book.setAuthor("李四");
        book.setPublisher("清华大学");
        Date date = new Date();//获取当前的日期
        book.setPdate(new java.sql.Date(date.getTime()));
        book.setIsbn("12312313");
        book.setPrice(102);
        book.setAddress("12313");
        book.setBrief("计算机网络");
        book.setTypeid(2);
        book.setImage("");
        System.out.println(bookService.addBook(book));
    }

    @Test
    public void modifyBookById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        Book book = new Book();
        book.setId(12);
        book.setTypeid(3);
        book.setBrief("修改后的简介");
        System.out.println(bookService.modifyBookById(book));
    }

    @Test
    public void removeBookById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BookService bookService = (BookService) ctx.getBean("bookService");
        System.out.println(bookService.removeBookById(10));
    }

}
