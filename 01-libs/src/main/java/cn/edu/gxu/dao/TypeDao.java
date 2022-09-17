package cn.edu.gxu.dao;

import cn.edu.gxu.model.Type;

import java.util.List;

public interface TypeDao {
    List<Type> selectAllType();

    Integer insertType(Type type);

    Integer updateTypeById(Type type);

    Integer deleteTypeById(Integer id);
}
