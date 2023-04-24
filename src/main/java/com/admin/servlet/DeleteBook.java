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
@WebServlet("/delete")
public class DeleteBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f =  dao.deleteBook(id);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Book Delete Successfully");
				resp.sendRedirect("admin/allBooks.jsp");
			}else {
				session.setAttribute("failMsg", "Somthing Wromg On Server");
				resp.sendRedirect("admin/allBooks.jsp");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
