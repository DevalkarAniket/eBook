package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.UserDAOImpl;
import com.entity.User;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);

			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);

			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg", "Profile Update Successfully...");
					resp.sendRedirect("editProfile.jsp");

				} else {
					session.setAttribute("failMsg", "Something Wrong on Server");
					resp.sendRedirect("editProfile.jsp");
				}
			} else {
				session.setAttribute("failMsg", "Your Password is Incorrect...");
				resp.sendRedirect("editProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
