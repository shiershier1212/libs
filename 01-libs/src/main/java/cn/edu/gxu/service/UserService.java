package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;
import cn.edu.gxu.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    List<User> queryAllUser();

    User queryUserById(Integer id);

    Integer addUser(User user);

    Integer modifyUserById(User user);

    Integer removeUserById(Integer id);

    User queryByPhoneAndPass(String phone, String pass);
}
