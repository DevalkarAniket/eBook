<%@page import="com.entity.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All books</title>
<%@include file="allCss.jsp"%>
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
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg}">
		<h5 class="text-center text-danger">${failMsg}</h5>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<div class="container p-3">
		<h3 class="text-center p-1">
			<b>HELLO &nbsp;ADMIN</b>
		</h3>
		<table class="table table-hover">
			<thead class="th-bg text-white">
				<tr class="tr-th text-center">
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody class="tb-bg">
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetail> list = dao.getAllBooks();
				for (BookDetail b : list) {
				%>
				<tr class="tr-td text-center">
					<td><%=b.getBookId()%></td>
					<td><img alt="image" src="../book/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="editBook.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a>
						<a href="../delete?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>Delete</a></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div style="margin-top: 317px;"><%@include file="/allComponent/footer.jsp"%></div>
</body>
</html>