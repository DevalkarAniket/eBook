package com.user.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.DOA.BookDAOImpl;
import com.entity.BookDetail;

@MultipartConfig
@WebServlet("/addOldBook")
public class AddOldBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			float price = Float.parseFloat(req.getParameter("price"));
			String category = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			String userMail = req.getParameter("user");

			BookDetail b = new BookDetail(bookName, author, price, category, status, fileName, userMail);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {
				String path = getServletContext().getRealPath("") + "book";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Book Add Sucessfully");
				resp.sendRedirect("sellBook.jsp");
			} else {
				session.setAttribute("failMsg", "Something Wrong on server");
				resp.sendRedirect("sellBook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
