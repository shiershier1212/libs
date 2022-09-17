package cn.edu.gxu.service.impl;

import cn.edu.gxu.dao.TypeDao;
import cn.edu.gxu.model.Type;
import cn.edu.gxu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeDao typeDao;


    @Override
    public List<Type> queryAllType() {
        return typeDao.selectAllType();
    }

    @Override
    public Integer addType(Type type) {
        return typeDao.insertType(type);
    }

    @Override
    public Integer modifyType(Type type) {
        return typeDao.updateTypeById(type);
    }

    @Override
    public Integer removeTypeById(Integer id) {
        return typeDao.deleteTypeById(id);
    }
}
