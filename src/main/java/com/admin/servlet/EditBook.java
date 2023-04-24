package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.BookDAOImpl;
import com.entity.BookDetail;

@WebServlet("/editBook")
public class EditBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			float price = Float.parseFloat(req.getParameter("price"));
			String status = req.getParameter("status");
			BookDetail b = new BookDetail();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBook(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Update Successfully");
				resp.sendRedirect("admin/allBooks.jsp");
			} else {
				session.setAttribute("failMsg", "Somthing Wromg On Server");
				resp.sendRedirect("admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
