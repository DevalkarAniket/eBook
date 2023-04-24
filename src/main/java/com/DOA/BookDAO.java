package com.DOA;

import java.util.List;

import com.entity.BookDetail;

public interface BookDAO {
	public boolean addBooks(BookDetail b);

	public List<BookDetail> getAllBooks();

	public BookDetail getBookId(int id);

	public boolean updateEditBook(BookDetail b);

	public boolean deleteBook(int id);

	public List<BookDetail> getNewBook();

	public List<BookDetail> getRecentBook();

	public List<BookDetail> getOldBook();

	public List<BookDetail> getAllRecentBooks();

	public List<BookDetail> getAllNewBooks();

	public List<BookDetail> getAllOldBooks();

	public List<BookDetail> getBookByOld(String email, String cate);

	public boolean oldBookDelete(String email, String cate, int id);

	public List<BookDetail> getBookBySearch(String ch);
}
