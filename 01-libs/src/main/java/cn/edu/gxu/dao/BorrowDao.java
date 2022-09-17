package cn.edu.gxu.dao;

import cn.edu.gxu.model.Borrow;

import java.util.List;

public interface BorrowDao {
    List<Borrow> selectAllBorrow();

    Integer insertBorrow(Borrow borrow);

    Integer updateBorrowById(Borrow borrow);

    Integer deleteBorrowById(Integer id);
}
