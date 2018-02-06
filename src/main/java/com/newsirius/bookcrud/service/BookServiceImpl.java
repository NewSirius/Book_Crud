package com.newsirius.bookcrud.service;

import com.newsirius.bookcrud.model.Book;
import com.newsirius.bookcrud.dao.BookDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Transactional
    public void addBook(Book book) {
        bookDao.addBook(book);
    }
    @Transactional
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }
    @Transactional
    public void removeBook(int id) {
        bookDao.removeBook(id);
    }
    @Transactional
    public Book getBookId(int id) {
        return bookDao.getBookId(id);
    }
    @Transactional
    public List<Book> listBooks() {
        return bookDao.listBooks();
    }

    @Transactional
    public Book searchBook(String title) {
        return bookDao.searchBook(title);
    }
}
