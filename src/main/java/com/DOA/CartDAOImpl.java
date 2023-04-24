package com.DOA;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String query = "INSERT INTO CART(BOOKID,USERID,BOOKNAME,AUTHOR,PRICE,TOTALPRICE) VALUES (?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c.getBookId());
			pstmt.setInt(2, c.getUserId());
			pstmt.setString(3, c.getBookName());
			pstmt.setString(4, c.getAuthor());
			pstmt.setFloat(5, c.getPrice());
			pstmt.setFloat(6, c.getTotalPrice());
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getBookUserId(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		float totalPrice = 0.00f;
		try {
			String query = "SELECT * FROM CART WHERE USERID=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCartId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getFloat(6));
				totalPrice += rs.getFloat(6);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bookId, int userId, int cartId) {
		boolean f = false;
		try {
			String query = "DELETE FROM CART WHERE BOOKID = ? AND USERID=? and CARTID=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bookId);
			pstmt.setInt(2, userId);
			pstmt.setInt(3, cartId);
			int i = pstmt.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}

}
