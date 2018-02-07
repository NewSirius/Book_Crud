package com.newsirius.bookcrud.controller;


import com.newsirius.bookcrud.model.Book;
import com.newsirius.bookcrud.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;


    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookSevice(BookService bookSevice) {
        this.bookService = bookSevice;
    }

    @RequestMapping("/")
    public String home()    {
        return "redirect:/books";
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(@RequestParam(required = false) Integer page, Model model)    {
        model.addAttribute("book", new Book());
        List<Book> list = this.bookService.listBooks();
        setPaging(page, model, list);
        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book)    {
        this.bookService.addBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id") int id)    {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookId(id);
        model.addAttribute("book", book);
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "bookedit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String editPOSTBook(@PathVariable("id") int id, @ModelAttribute("book") Book book) {
        System.out.println("inside EditPOSTBook and id = " + id);
        System.out.println(book.getId());
        this.bookService.updateBook(book);
        return "bookedit";
    }

    @RequestMapping("edit/makeReadBook/{id}")
    public String makeReadBook(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookId(id);

        book.setReadAlready(true);
        this.bookService.updateBook(book);

        model.addAttribute("book", book);
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "bookedit";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookId(id);
        model.addAttribute("book", book);
        return "bookdata";
    }

    @RequestMapping(value = "books/search", method = RequestMethod.POST)
    public String bookSearch(@RequestParam("title") String title, Model model) {
        try {
            Book book = this.bookService.searchBook(title);
            model.addAttribute("book", book);
        } catch (IndexOutOfBoundsException e)   {
            //--//
        }

        return "bookdata";
    }

    private void setPaging(Integer page, Model model, List<Book> list)    {
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(list);
        pagedListHolder.setPageSize(10);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1)   {
            page = 1;
        }

        model.addAttribute("page", page);
        pagedListHolder.setPage(page - 1);
        model.addAttribute("listBooks", pagedListHolder.getPageList());
    }

}
