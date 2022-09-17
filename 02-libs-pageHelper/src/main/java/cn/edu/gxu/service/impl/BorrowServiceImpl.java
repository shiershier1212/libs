package cn.edu.gxu.service.impl;

import cn.edu.gxu.dao.BorrowDao;
import cn.edu.gxu.model.Borrow;
import cn.edu.gxu.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowDao borrowDao;

    @Override
    public List<Borrow> queryAllBorrow() {
        return borrowDao.selectAllBorrow();
    }

    @Override
    public Borrow queryBorrowById(Integer id) {
        return borrowDao.selectBorrowById(id);
    }

    @Override
    public Integer addBorrow(Borrow borrow) {
        return borrowDao.insertBorrow(borrow);
    }

    @Override
    public Integer returnBook(Borrow borrow) {
        return borrowDao.updateBorrowById(borrow);
    }


    @Override
    public Integer removeBorrowById(Integer id) {
        return borrowDao.deleteBorrowById(id);
    }

}
