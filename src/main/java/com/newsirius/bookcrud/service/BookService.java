package com.newsirius.bookcrud.service;

import com.newsirius.bookcrud.model.Book;

import java.util.List;

public interface BookService {
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    Book getBookId(int id);
    List<Book> listBooks();
    Book searchBook(String title);
}
