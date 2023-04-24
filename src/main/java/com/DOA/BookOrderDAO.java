package com.DOA;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	public int getOrderNo();

	public boolean saveOrder(List<BookOrder> b);

	public List<BookOrder> getBook(String email);

	public List<BookOrder> getAllOrderBooks();
}
