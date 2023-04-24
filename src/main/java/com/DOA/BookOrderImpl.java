package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderImpl implements BookOrderDAO {

	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<BookOrder> blist) {
		boolean f = false;
		try {
			String query = "INSERT INTO ORDERS (ORDER_ID,USER_NAME,EMAIL,ADDRESS,PHONE,BOOK_NAME,AUTHOR,PRICE,PAYMENT) VALUES(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(query);
			for (BookOrder b : blist) {
				pstmt.setString(1, b.getOrderId());
				pstmt.setString(2, b.getUn());
				pstmt.setString(3, b.getEmail());
				pstmt.setString(4, b.getFullAdd());
				pstmt.setString(5, b.getPhNo());
				pstmt.setString(6, b.getBookName());
				pstmt.setString(7, b.getAuthor());
				pstmt.setString(8, b.getPrice());
				pstmt.setString(9, b.getPaymentType());
				pstmt.addBatch();
			}
			int[] count = pstmt.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public int getOrderNo() {
		int i = 1;
		try {
			String query = "SELECT * FROM ORDERS";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o = null;
		try {
			String query = "SELECT * FROM ORDERS WHERE EMAIL=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUn(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhNo(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrderBooks() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o = null;
		try {
			String query = "SELECT * FROM ORDERS";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUn(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhNo(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
