<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBooks:Reset password</title>
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

.input-group {
	border: none;
	border-bottom: 1px solid #ccc;
}

.form-control, .input-group-text {
	border: none;
	background-color: #eeeeee;
}

.form-control:focus {
	background-color: #f4f4f4;
	box-shadow: none;
}
</style>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card me-5">
					<div class="card-body p-4">
						<h4 class="text-center p-1">Forgot Your Password?</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success" role="alert">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger" role="alert">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						<p class="text-center px-4 p-1">Enter your email below to
							receive your password reset instructions</p>
						<form class="mx-auto" action="reset" method="post">

							<div class="input-group my-3">
								<input type="text" class="form-control"
									placeholder="Registered email ID" required="required">
								<div class="input-group-text">
									<i class="fa-solid fa-envelope"></i>
								</div>
							</div>

							<div class="input-group my-3">
								<input type="text" class="form-control"
									placeholder="Registered mobile number" required="required">
								<div class="input-group-text">
									<i class="fa-solid fa-phone"></i>
								</div>
							</div>
							<div class="text-center d-grid my-3">
								<button type="submit" class="btn btn-danger">Send</button>
							</div>

							<div class="text-center">
								<a href="login.jsp" class="text-primary"><i
									class="fa-solid fa-arrow-left"></i> Back to Login Page</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 75px;">
		<%@include file="allComponent/footer.jsp"%></div>
</body>
</html>