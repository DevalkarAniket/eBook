<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Edit profile</title>
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
</style>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body p-4">
						<h4 class="text-center p-1"><b>EDIT &nbsp;PROFILE</b></h4>

						<c:if test="${not empty failMsg}">
							<h5 class="text-center text-danger">${failMsg}</h5>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="updateProfile" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="my-3">
								<label class="form-label">Name</label> <input type="text"
									class="form-control-plaintext px-2" name="fname"
									value="${userobj.name}">
							</div>

							<div class="my-3">
								<label class="form-label">Email</label> <input type="email"
									class="form-control-plaintext px-2" name="email"
									value="${userobj.email }" required="required">
							</div>

							<div class="my-3">
								<label class="form-label">Phone</label> <input type="text"
									class="form-control-plaintext px-2" name="phno"
									required="required" value="${userobj.phno }">
							</div>

							<div class="my-3">
								<label class="form-label">Password</label> <input
									type="password" class="form-control-plaintext px-2"
									name="password" required="required">
							</div>

							<div class="text-center d-grid">
								<button type="submit" class="btn btn-primary">Update</button>
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