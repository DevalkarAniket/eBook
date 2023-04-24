<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetail"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.card-body {
	background-color: #eeeeee;
}

.form-control-plaintext {
	border: 1px solid #ccc;
	background-color: #f4f4f4;
	border-radius: 6px;
}
</style>
</head>
<body style="background-color: #F9F1F0;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body p-4">

						<h4 class="text-center pb-3">Edit Book</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetail b = dao.getBookId(id);
						%>

						<form action="../editBook" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="my-3">
								<label class="form-label">Book name*</label> <input type="text"
									class="form-control-plaintext px-2" name="bname"
									aria-describedby="emailHelp" required="required"
									value="<%=b.getBookName()%>">
							</div>

							<div class="my-3">
								<label class="form-label">Author name*</label> <input
									type="text" class="form-control-plaintext px-2" name="author"
									required="required" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="my-3">
								<label class="form-label">Price*</label> <input type="text"
									class="form-control-plaintext px-2" name="price"
									required="required" aria-describedby="emailHelp"
									value="<%=b.getPrice()%>">
							</div>

							<div class="my-3">
								<label for="inputState" class="form-label">Book status</label> <select
									id="inputState" class="form-select form-control-plaintext px-2"
									aria-label="Default select example" name="status">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="In-active">In-active</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="In-active">In-active</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mt-3 d-grid">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 50px"><%@include file="/allComponent/footer.jsp"%></div>
</body>
</html>