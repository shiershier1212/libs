package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;
import cn.edu.gxu.model.Borrow;

import java.util.List;

public interface BorrowService {
    List<Borrow> queryAllBorrow();

    Borrow queryBorrowById(Integer id);

    Integer addBorrow(Borrow borrow);

    Integer returnBook(Borrow borrow);

    Integer removeBorrowById(Integer id);
}
