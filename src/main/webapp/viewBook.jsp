<%@page import="com.entity.BookDetail"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book Details</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.bg {
	background-color: #eeeeee;
	border-radius: 15px;
}

span {
	font-size: 15px;
}
</style>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDetail b = dao.getBookId(bid);
	%>


	<div class="container p-4">
		<div class="row">
			<div class="col-md-5 text-center border bg py-4 ms-5">
				<img alt="image" src="book/<%=b.getPhotoName()%>"
					style="width: 148px; height: 180px" class="border border-dark mb-3">
				<h5>
					Book Name : <span class="text-primary"><%=b.getBookName()%></span>
				</h5>
				<h5>
					Author Name : <span class="text-primary"><%=b.getAuthor()%></span>
				</h5>
				<h5>
					Category : <span class="text-primary"><%=b.getBookCategory()%></span>
				</h5>
			</div>
			<div class="col-md-6 text-center py-3 border bg ms-4">
				<h2 class="p-1"><%=b.getBookName()%></h2>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i> :
					<%=b.getEmail()%></h5>
				<%
				}
				%>
				<div class="row p-4">
					<div class="col-md-4 text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x text-danger"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fas fa-undo-alt fa-2x text-danger"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fas fa-truck-moving fa-2x text-danger"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="row text-center">
					<div class="col">
						<a href="index.jsp" class="btn btn-success"><i
							class="fas fs-cart-plus"></i>Continue Shopping</a> <a href=""
							class="btn btn-danger"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>

				<%
				} else {
				%>

				<div class="row text-center">
					<div class="col">
						<a href="" class="btn btn-primary"><i class="fas fs-cart-plus"></i>Add
							cart</a> <a href="" class="btn btn-danger"><i
							class="fa-solid fa-indian-rupee-sign"></i>200</a>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>