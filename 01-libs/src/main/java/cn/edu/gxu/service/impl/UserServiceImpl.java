package cn.edu.gxu.service.impl;

import cn.edu.gxu.dao.UserDao;
import cn.edu.gxu.model.User;
import cn.edu.gxu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> queryAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public User queryUserById(Integer id) {
        return userDao.selectUserById(id);
    }

    @Override
    public Integer addUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public Integer modifyUserById(User user) {
        return userDao.updateUserById(user);
    }

    @Override
    public Integer removeUserById(Integer id) {
        return userDao.deleteUserById(id);
    }

    @Override
    public User queryByPhoneAndPass(String phone, String pass) {
        return userDao.selectByPhoneAndPass(phone,pass);
    }
}
