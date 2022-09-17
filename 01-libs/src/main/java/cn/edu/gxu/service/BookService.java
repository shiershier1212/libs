package cn.edu.gxu.service;

import cn.edu.gxu.model.Book;

import java.util.List;

public interface BookService {
    List<Book> queryAllBook();

    Book queryBookById(Integer id);

    Integer addBook(Book book);

    Integer modifyBookById(Book book);

    Integer removeBookById(Integer id);
}
