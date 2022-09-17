package cn.edu.gxu.service;

import cn.edu.gxu.model.Type;

import java.util.List;

public interface TypeService {
    List<Type> queryAllType();

    Integer addType(Type type);

    Integer modifyType(Type type);

    Integer removeTypeById(Integer id);
}
