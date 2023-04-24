<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="allComponent/style1.css">
<meta charset="UTF-8">
<title>User:View old book</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
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
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg}">
		<p class="text-center text-danger" role="alert">${failMsg}</p>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<div class="container p-3">
		<h3 class="text-center p-1">
			<b>VIEW &nbsp;OLD&nbsp; BOOKS</b>
		</h3>
		<table class="table table-hover">
			<thead class="th-bg text-white">
				<tr class="tr-th text-center">
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody class="tb-bg">
				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetail> list = dao.getBookByOld(email, "Old");
				for (BookDetail b : list) {
				%>

				<tr class="tr-td text-center">
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="deleteOldBook?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div style="margin-top: 317px;"><%@include
			file="allComponent/footer.jsp"%></div>
</body>
</html>