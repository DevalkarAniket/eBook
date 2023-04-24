<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Index</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.crd {
	background-color: #f2f2f2;
}

.crd-ho {
	background-color: #d1a6a4;
}

.crd-ho:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
	background: #e8d3d2;
}

.card-body {
	background: transparent;
	border: none;
}

.card-body:hover {
	background: transparent;
}

.scroll {
	text-transform: uppercase;
	background: linear-gradient(to bottom, #FF0000 0%, #42378F 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	font-size: 2vw;
}

.scrollhead {
	text-transform: uppercase;
	background: linear-gradient(to bottom, #55EFC4 0%, #000000 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	font-size: 4vw;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="allComponent/navbar.jsp"%>
	<div class="container-fluid col-md-10 my-3">
		<marquee>
			<h3 class="text-center scrollhead p-1">eBooks Management System</h3>
		</marquee>
	</div>


	<!-- Start Recent book -->
	<div class="container p-3">
		<h3 class="text-center scroll">Recent Books</h3>
		<%
		BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
		List<BookDetail> list1 = dao1.getRecentBook();
		if (list1.isEmpty()) {
		%>
		<div class="row p-2">
			<%
			} else {
			%>
			<div class="row p-2 border border-dark rounded crd">
				<%
				}
				for (BookDetail b : list1) {
				%>
				<div class="col-md-3 p-2">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img class="border border-dark" alt="Book Image"
								src="book/<%=b.getPhotoName()%>"
								style="width: 148px; height: 180px" class="img-thumblin">
							<h5 class="p-1"><%=b.getBookName()%></h5>
							<p><%=b.getAuthor()%></p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							<p><%=b.getBookCategory()%></p>
							<div class="row">
								<div class="col">
									<a href="viewBook.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm">View Details</a> <a href="#"
										class="btn btn-danger btn-sm"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
								</div>
							</div>

							<%
							} else {
							%>
							<p><%=b.getBookCategory()%></p>
							<div class="row">
								<div class="col d-flex">
									<%
									if (u == null) {
									%>
									<a href="login.jsp" class="btn btn-danger btn-sm"><i
										class="fas fa-duotone fa-cart-plus"></i> Add</a>
									<%
									} else {
									%>
									<a href="cart?bookId=<%=b.getBookId()%>&&userId=<%=u.getId()%>"
										class="btn btn-danger btn-sm"><i
										class="fas fa-duotone fa-cart-plus"></i> Add</a>
									<%
									}
									%>
									<a href="viewBook.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm mx-1">View Details</a> <a
										href="#" class="btn btn-danger btn-sm"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mb-3 d-flex">
			<a href="allOldBook.jsp"
				class="btn btn-warning col-md-2 offset-md-5 text-dark">View All</a>
		</div>
	</div>
	<!-- End Recent book -->
	<hr>


	<!-- Start New book -->
	<div class="container p-3">
		<h3 class="text-center scroll">New Books</h3>
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		List<BookDetail> list = dao.getNewBook();
		if (list.isEmpty()) {
		%>
		<div class="row p-2">
			<%
			} else {
			%>
			<div class="row p-2 border border-dark rounded crd">
				<%
				}
				for (BookDetail b : list) {
				%>
				<div class="col-md-3 p-2">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img class="border border-dark" alt="Book Image"
								src="book/<%=b.getPhotoName()%>"
								style="width: 148px; height: 180px" class="img-thumblin">
							<h5 class="p-1"><%=b.getBookName()%></h5>
							<p><%=b.getAuthor()%></p>
							<p><%=b.getBookCategory()%></p>
							<div class="row">
								<div class="col d-flex">

									<%
									if (u == null) {
									%>
									<a href="login.jsp" class="btn btn-danger btn-sm"><i
										class="fas fa-duotone fa-cart-plus"></i> Add</a>
									<%
									} else {
									%>
									<a href="cart?bookId=<%=b.getBookId()%>&&userId=<%=u.getId()%>"
										class="btn btn-danger btn-sm"><i
										class="fas fa-duotone fa-cart-plus"></i> Add</a>
									<%
									}
									%>

									<a href="viewBook.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm mx-1">View Details</a> <a
										href="#" class="btn btn-danger btn-sm"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mb-3 d-flex">
			<a href="allOldBook.jsp"
				class="btn btn-warning col-md-2 offset-md-5 text-dark">View All</a>
		</div>
	</div>

	<!-- End New book -->
	<hr>




	<!-- Start Old book -->
	<div class="container p-3">
		<h3 class="text-center scroll">Old Books</h3>
		<%
		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
		List<BookDetail> list2 = dao2.getOldBook();
		if (list2.isEmpty()) {
		%>
		<div class="row p-2">
			<%
			} else {
			%>
			<div class="row p-2 border border-dark rounded crd">
				<%
				}
				for (BookDetail b : list2) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img class="border border-dark" alt="Book Image"
								src="book/<%=b.getPhotoName()%>"
								style="width: 160px; height: 192px" class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p><%=b.getBookCategory()%></p>
							<div class="row">
								<div class="col">
									<a href="viewBook.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm">View Details</a> <a href="#"
										class="btn btn-danger btn-sm"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="text-center mb-3 d-flex">
			<a href="allOldBook.jsp"
				class="btn btn-warning col-md-2 offset-md-5 text-dark">View All</a>
		</div>
	</div>

	<!-- End Old book -->

	<%@include file="allComponent/footer.jsp"%>
</body>
</html>
