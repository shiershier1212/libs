package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;
import cn.edu.gxu.model.Borrow;

import java.util.List;

public interface BorrowService {
    List<Borrow> queryAllBorrow();

    Integer addBorrow(Borrow borrow);

    Integer modifyBorrowById(Borrow borrow);

    Integer removeBorrowById(Integer id);
}
