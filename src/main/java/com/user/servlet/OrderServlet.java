package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.BookOrderImpl;
import com.DOA.CartDAOImpl;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("un");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> blist = dao.getBookUserId(id);

			if (blist.isEmpty()) {
				session.setAttribute("failMsg", "Please First Add Item");
				resp.sendRedirect("checkout.jsp");
			} else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				BookOrder o = null;

				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
				Random r = new Random();
				for (Cart c : blist) {
					o = new BookOrder();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUn(name);
					o.setEmail(email);
					o.setPhNo(phno);
					o.setFullAdd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}

				if ("NS".equals(paymentType)) {
					session.setAttribute("failMsg", "Please Choose Payment Method...");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);
					if (f) {
						resp.sendRedirect("orderSucess.jsp");
					} else {
						session.setAttribute("failMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
