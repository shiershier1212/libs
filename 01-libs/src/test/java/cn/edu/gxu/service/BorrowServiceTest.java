package cn.edu.gxu.service;

import cn.edu.gxu.model.Borrow;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class BorrowServiceTest {
    @Test
    public void selectAllBorrow() {

        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        BorrowService borrowService = (BorrowService) ctx.getBean("borrowService");

        List<Borrow> list = borrowService.queryAllBorrow();
        list.forEach(System.out::println);

    }
}
