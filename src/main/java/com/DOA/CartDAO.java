package com.DOA;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);

	public List<Cart> getBookUserId(int userId);

	public boolean deleteBook(int bookId, int userId,int cartId);
	
	
}
