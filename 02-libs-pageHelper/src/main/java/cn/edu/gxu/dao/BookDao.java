package cn.edu.gxu.dao;

import cn.edu.gxu.model.Book;

import java.util.List;

public interface BookDao {
    List<Book> selectAllBook();

    Book selectBookById(Integer id);

    Integer insertBook(Book book);

    Integer updateBookById(Book book);

    Integer deleteBookById(Integer id);
}
