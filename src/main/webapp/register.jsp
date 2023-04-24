<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBooks:Registration</title>
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
						<h4 class="text-center p-1">
							<b>REGISTRATION &nbsp;PAGE</b>
						</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success" role="alert">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger" role="alert">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>


						<form class="mx-auto" action="register" method="post">
							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									required="required" name="fname" placeholder="Full name">
							</div>

							<div class="my-3">
								<input type="email" class="form-control-plaintext px-2"
									required="required" name="email" placeholder="Email address">
							</div>

							<div class="my-3">
								<input type="tel" class="form-control-plaintext px-2"
									required="required" name="phno" placeholder="Mobile number">
							</div>

							<div class="my-3">
								<input type="password" class="form-control-plaintext px-2"
									required="required" name="password" placeholder="New password">
							</div>

							<div class="my-3 form-check">
								<input type="checkbox" name="check" class="form-check-input">
								<label class="form-check-label">Agree Terms & Conditions</label>
							</div>
							<div class="text-center d-flex">
								<button type="submit"
									class="btn btn-success col-md-6 offset-md-3">Register</button>
							</div>
							<div style="border-bottom: 1px solid #a0a0a0;" class="my-2"></div>

							<p class="text-center">
								Already a user? <a href="login.jsp" class="text-primary">Login</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 29px;">
		<%@include file="allComponent/footer.jsp"%></div>
</body>
</html>