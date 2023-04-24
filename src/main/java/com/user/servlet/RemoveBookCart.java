package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.CartDAOImpl;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookId = Integer.parseInt(req.getParameter("bookId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		int cartId = Integer.parseInt(req.getParameter("cartId"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bookId, userId, cartId);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Book Removed From Cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failMsg", "Something Wrong on Server");
			resp.sendRedirect("checkout.jsp");
		}
	}

}
