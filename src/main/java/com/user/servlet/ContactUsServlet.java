package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.ContactUsDAOImpl;
import com.entity.ContactInfo;

@WebServlet("/contactus")
public class ContactUsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String message = req.getParameter("message");
			ContactInfo c = new ContactInfo(name, email, phone, address, message);
			ContactUsDAOImpl dao = new ContactUsDAOImpl(DBConnect.getConn());

			boolean f = dao.addMessage(c);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Message sent successfully");
				resp.sendRedirect("contactus.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("contactus.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
