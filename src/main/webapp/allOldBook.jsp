<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.crd {
	background-color: #f2f2f2;
}

.crd-ho {
	background-color: #F2FA63;
}

.crd-ho:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
	background: #f9fdb1;
}

.card-body {
	background: transparent;
	border: none;
}

.card-body:hover {
	background: transparent;
}
</style>
</head>
<body style="background-color: #F9F1F0;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container p-4">
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		List<BookDetail> list = dao.getAllOldBooks();
		if (list.isEmpty()) {
		%>
		<div class="row p-2">
			<%
			} else {
			%>
			<div class="row p-3 border border-dark rounded crd">
				<%
				}
				for (BookDetail b : list) {
				%>
				<div class="col-md-3 p-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img class="border border-dark" alt="Book Image"
								src="book/<%=b.getPhotoName()%>"
								style="width: 148px; height: 180px" class="img-thumblin">
							<h5 class="p-1"><%=b.getBookName()%></h5>
							<p><%=b.getAuthor()%></p>
							<p><%=b.getBookCategory()%></p>
							<div class="row">
								<div class="col text-center">
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
	</div>
	<div style="margin-top: 407px"><%@include
			file="../allComponent/footer.jsp"%></div>
</body>
</html>