package cn.edu.gxu.service;

import cn.edu.gxu.model.Borrow;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BorrowServiceTest {
    @Test
    public void queryAllBorrow() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");
        borrowService.queryAllBorrow().forEach(System.out::println);
    }

    @Test
    public void queryBorrowById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");
        System.out.println(borrowService.queryBorrowById(1));
    }

    @Test
    public void addBorrow() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");
        Borrow borrow = new Borrow();
        borrow.setBookid(1);
        borrow.setCustomerid(2);
        borrow.setBdate(new java.sql.Date(new Date().getTime()));
        System.out.println(borrowService.addBorrow(borrow));
    }

    //ªπ È≤‚ ‘
    @Test
    public void returnBook() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");
        Borrow borrow = borrowService.queryBorrowById(11);
        borrow.setRdate(new java.sql.Date((new Date().getTime())));
        borrowService.returnBook(borrow);
        System.out.println(borrowService.queryBorrowById(11));
    }

    @Test
    public void deleteBorrowById() {
        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");
        System.out.println(borrowService.removeBorrowById(11));
    }

}
