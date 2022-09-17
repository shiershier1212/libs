package cn.edu.gxu.service.impl;

import cn.edu.gxu.dao.BookDao;
import cn.edu.gxu.model.Book;
import cn.edu.gxu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> queryAllBook() {
        return bookDao.selectAllBook();
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookDao.selectBookById(id);
    }

    @Override
    public Integer addBook(Book book) {
        return bookDao.insertBook(book);
    }

    @Override
    public Integer modifyBookById(Book book) {
        return bookDao.updateBookById(book);
    }

    @Override
    public Integer removeBookById(Integer id) {
        return bookDao.deleteBookById(id);
    }
}
