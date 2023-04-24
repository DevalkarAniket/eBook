<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add books</title>
<%@include file="allCss.jsp"%>
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
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center container text-dark"
			role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger text-center container text-dark"
			role="alert">${failMsg }</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body p-4">
						<h4 class="text-center p-1">Add Books</h4>
						<form action="../addBooks" method="post"
							enctype="multipart/form-data">
							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="bname" aria-describedby="emailHelp" required="required"
									placeholder="Book name (Required)*">
							</div>

							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="author" required="required" aria-describedby="emailHelp"
									placeholder="Author name (Required)*">
							</div>

							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									name="price" required="required" aria-describedby="emailHelp"
									placeholder="Price (Required)*">
							</div>

							<div class="my-3">
								<select id="inputState"
									class="form-select form-control-plaintext px-2"
									style="color: #666666;" aria-label="Default select example"
									name="category">
									<option disabled="disabled" selected>Select book
										category</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="my-3">
								<select id="inputState"
									class="form-select form-control-plaintext px-2"
									style="color: #666666;" aria-label="Default select example"
									name="status">
									<option selected disabled="disabled">Select book
										status</option>
									<option value="Active">Active</option>
									<option value="In-active">In-Active</option>
								</select>
							</div>

							<div class="my-3">
								<label for="exampleFormControlFile" class="pb-2">Upload
									Photo</label> <input type="file" class="form-control-file"
									id="exampleFormControlFile" name="bimg">
							</div>

							<div class="text-center d-grid">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div><%@include file="/allComponent/footer.jsp"%></div>
</body>
</html>