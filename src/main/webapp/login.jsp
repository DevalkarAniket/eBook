<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBooks:Login</title>
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
							<b>LOGIN</b>
						</h4>

						<c:if test="${not empty failmsg}">
							<h5 class="text-center text-danger">${failmsg}</h5>
							<c:remove var="failmsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="login" method="post">
							<div class="my-3">
								<input type="email" class="form-control-plaintext px-2"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email"
									placeholder="Mobile number or email address">
							</div>
							<div class="my-3">
								<input type="password" class="form-control-plaintext px-2"
									id="exampleInputPassword1" required="required" name="password"
									placeholder="Password">
							</div>
							<div class="text-center d-grid my-3">
								<button type="submit" class="btn btn-primary text-white"
									style="font-size: 20px;">Log In</button>
								<div class="my-2">
									<a href="forgotPassword.jsp" class="text-primary">Forgotten
										password?</a>
								</div>
								<div style="border-bottom: 1px solid #a0a0a0;"></div>
							</div>
							<div class="btn btn-success d-grid col-8 mx-auto mt-4">
								<a href="register.jsp" class="text-white">Create new account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 68px;"><%@include
			file="allComponent/footer.jsp"%></div>
</body>
</html>