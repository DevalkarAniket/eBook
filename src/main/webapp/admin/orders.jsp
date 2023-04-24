<%@page import="java.util.List"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All orders</title>
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
<body style="background-color: #F9F1F0;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container p-3">
		<h3 class="text-center p-1">
			<b>HELLO &nbsp;ADMIN</b>
		</h3>
		<table class="table table-hover">
			<thead class="th-bg text-white">
				<tr class="tr-th text-center">
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment type</th>
				</tr>
			</thead>
			<tbody class="tb-bg">

				<%
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<BookOrder> blist = dao.getAllOrderBooks();
				for (BookOrder b : blist) {
				%>
				<tr class="tr-td text-center">
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUn()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFullAdd()%></td>
					<td><%=b.getPhNo()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>



			</tbody>
		</table>
	</div>
	<div style="margin-top: 317px"><%@include file="/allComponent/footer.jsp"%></div>

</body>
</html>