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

@WebServlet("/addaddress")
public class AddAddress extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String userMail = req.getParameter("usermail");
			User u = new User();
			u.setAddress(address);
			u.setLandmark(landmark);
			u.setCity(city);
			u.setState(state);
			u.setPincode(pincode);
			u.setEmail(userMail);

			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.addAddress(u);
			if (f) {
				session.setAttribute("succMsg", "Address added successfully");
				resp.sendRedirect("userAddress.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("userAddress.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
