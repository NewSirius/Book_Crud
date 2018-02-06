package com.newsirius.bookcrud.dao;

import com.newsirius.bookcrud.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
    }

    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
    }

    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);

        if (book != null) {
            session.delete(book);
        }
    }

    public Book getBookId(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return (Book) session.get(Book.class, id);
    }

    @SuppressWarnings("unchecked")
    public Book searchBook(String title) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> booklist = session.createQuery("from Book where title =:title").setParameter("title", title).list();
        return booklist.get(0);
    }
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();

        return (List<Book>) session.createQuery("from Book").list();
    }
}
