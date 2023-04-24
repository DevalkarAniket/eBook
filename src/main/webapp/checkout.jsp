<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Cart</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.card {
	background-color: transparent;
	border: none;
}

.card-body {
	background-color: #eeeeee;
	border-radius: 15px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
}

.form-control-plaintext {
	border: 1px solid #ccc;
	background-color: #f4f4f4;
	border-radius: 6px;
}

.th-bg {
	background-color: #fb8c00;
}

.tb-bg {
	background-color: #e8e8e8;
}

.tr-td {
	color: #1a237e;
	vertical-align: middle;
}

.tr-th {
	vertical-align: middle;
}
</style>
</head>
<body style="background-color: #F9F1F0;">
	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger text-center" role="alert">${failMsg }</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-2">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center p-1">
							<b>YOUR &nbsp;SELECTED &nbsp;ITEMS</b>
						</h4>
						<table class="table table-hover">
							<thead class="th-bg text-white">
								<tr class="tr-th text-center">
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody class="tb-bg">

								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookUserId(u.getId());
								float totalPrice = 0.0f;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr class="tr-td text-center">
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=c.getPrice()%></td>
									<td><a
										href="removeBook?bookId=<%=c.getBookId()%>&&userId=<%=c.getUserId()%>&&cartId=<%=c.getCartId()%>"
										class="btn btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr class="tr-td text-center" style="background-color: #a0a0a0;">
									<th scope="row">Total Price</th>
									<td></td>
									<th scope="row"><i class="fa-solid fa-indian-rupee-sign"></i>
										<%=totalPrice%></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6 p-2">
				<div class="card">
					<div class="card-body p-4">
						<h4 class="text-center p-1">
							<b>ADD &nbsp;DELIVERY&nbsp; ADDRESS</b>
						</h4>
						<form action="order" class="row g-3" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2"
									value="${userobj.name}" name="un" required
									placeholder="Full name (Required)*">
							</div>
							<div class="col-md-6 my-3">
								<input type="email" class="form-control-plaintext px-2"
									id="inputEmail4" value="${userobj.email}" name="email" required
									placeholder="Email address (Required)*">
							</div>

							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2"
									value="${userobj.phno}" name="phno" required
									placeholder="Phone number (Required)*">
							</div>
							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="address" required
									placeholder="Flat No.,Build.Name (Required)*"
									value="${userobj.address}">
							</div>

							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="landmark" required placeholder="Landmark"
									value="${userobj.landmark}">
							</div>
							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2" required
									placeholder="City (Required)*" value="${userobj.city}">
							</div>

							<div class="col-md-6 my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="state" required placeholder="State (Required)*"
									value="${userobj.state}">
							</div>
							<div class="col-md-6 my-3">
								<input type="number" class="form-control-plaintext px-2"
									name="Pincode" required placeholder="Pincode (Required)*"
									value="${userobj.pincode}">
							</div>

							<div class="col-md-12 my-3">
								<select class="form-select form-control-plaintext px-2 "
									name="payment" style="color: #666666;">
									<option selected value="NS">---Select
										payment method---</option>
									<option value="NB">Net Banking</option>
									<option value="UPI">UPI</option>
									<option value="COD">COD</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div><%@include file="allComponent/footer.jsp"%></div>
</body>
</html>