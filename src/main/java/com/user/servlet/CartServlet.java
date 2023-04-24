package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.BookDAOImpl;
import com.DOA.CartDAOImpl;
import com.entity.BookDetail;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(req.getParameter("bookId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDetail b = dao.getBookId(bookId);

			Cart c = new Cart();
			c.setBookId(bookId);
			c.setUserId(userId);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getPrice());

			CartDAOImpl dao1 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao1.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Added to Cart");
				resp.sendRedirect("allNewBook.jsp");
			} else {
				session.setAttribute("failMsg", "Something Wrong on Server");
				resp.sendRedirect("allNewBook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
