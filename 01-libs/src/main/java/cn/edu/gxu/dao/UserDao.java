package cn.edu.gxu.dao;

import cn.edu.gxu.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    List<User> selectAllUser();

    User selectUserById(Integer id);

    Integer insertUser(User user);

    Integer updateUserById(User user);

    Integer deleteUserById(Integer id);

    User selectByPhoneAndPass(@Param("phone") String phone, @Param("pass") String pass);
}
