package cn.edu.gxu.service;

import cn.edu.gxu.model.Type;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TypeServiceTest {

    @Test
    public void queryAllType() {

        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        TypeService service = (TypeService) ctx.getBean("typeService");
        List<Type> list = service.queryAllType();

        list.forEach(System.out::println);
    }

    @Test
    public void addType() {

        String cof = "conf/applicationContext.xml";
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(cof);
        TypeService service = (TypeService) ctx.getBean("typeService");

        Type type = new Type();
        type.setTypename("美女");
        System.out.println(service.addType(type));

    }

}
