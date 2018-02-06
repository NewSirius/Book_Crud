package com.newsirius.bookcrud.dao;

import com.newsirius.bookcrud.model.Book;

import java.util.List;

public interface BookDao {
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    Book getBookId(int id);
    Book searchBook(String title);
    List<Book> listBooks();

}
