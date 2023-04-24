package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetail;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetail b) {
		boolean f = false;
		try {
			String query = "INSERT INTO BOOKDETAIL(BOOKNAME,AUTHOR,PRICE,BOOKCATEGORY,STATUS,PHOTONAME,EMAIL) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBookName());
			pstmt.setString(2, b.getAuthor());
			pstmt.setFloat(3, b.getPrice());
			pstmt.setString(4, b.getBookCategory());
			pstmt.setString(5, b.getStatus());
			pstmt.setString(6, b.getPhotoName());
			pstmt.setString(7, b.getEmail());

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
	public List<BookDetail> getAllBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String query = "SELECT * FROM BOOKDETAIL";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetail getBookId(int id) {
		BookDetail b = null;
		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKID = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBook(BookDetail b) {
		boolean f = false;
		try {
			String query = "UPDATE BOOKDETAIL SET BOOKNAME=?,AUTHOR=?,PRICE=?,STATUS=? WHERE BOOKID=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBookName());
			pstmt.setString(2, b.getAuthor());
			pstmt.setFloat(3, b.getPrice());
			pstmt.setString(4, b.getStatus());
			pstmt.setInt(5, b.getBookId());

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
	public boolean deleteBook(int id) {
		boolean f = false;
		try {
			String query = "DELETE FROM BOOKDETAIL WHERE BOOKID=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
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
	public List<BookDetail> getNewBook() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKCATEGORY =? AND STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "New");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getRecentBook() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getOldBook() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKCATEGORY =? AND STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Old");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getAllRecentBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Active");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getAllNewBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKCATEGORY =? AND STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "New");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getAllOldBooks() {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;

		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKCATEGORY =? AND STATUS=? ORDER BY BOOKID DESC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Old");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetail> getBookByOld(String email, String cate) {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE BOOKCATEGORY=? AND EMAIL=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cate);
			pstmt.setString(2, email);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cate, int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM BOOKDETAIL WHERE BOOKCATEGORY=? AND EMAIL=? AND BOOKID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate);
			pstmt.setString(2, email);
			pstmt.setInt(3, id);

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
	public List<BookDetail> getBookBySearch(String ch) {
		List<BookDetail> list = new ArrayList<BookDetail>();
		BookDetail b = null;
		try {
			String query = "SELECT * FROM BOOKDETAIL WHERE UPPER(BOOKNAME) LIKE UPPER(?) OR UPPER(AUTHOR) LIKE UPPER(?) OR UPPER(BOOKCATEGORY) LIKE UPPER(?) AND STATUS = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + ch + "%");
			pstmt.setString(2, "%" + ch + "%");
			pstmt.setString(3, "%" + ch + "%");
			pstmt.setString(4, "Active");

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new BookDetail();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
