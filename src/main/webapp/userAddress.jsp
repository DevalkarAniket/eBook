<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Edit address</title>
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
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body p-4">
						<h4 class="text-center p-1">
							<b>EDIT &nbsp;ADDRESS</b>
						</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="./addaddress" method="post">
							<div class="my-3">
								<input type="hidden" value="${userobj.email }" name="usermail">
								<input type="text" class="form-control-plaintext px-2"
									required="required"
									placeholder="Flat no. , building name (Required)*"
									name="address" value="${userobj.address }">
							</div>
							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									required="required" placeholder="Landmark (Required)*"
									name="landmark" value="${userobj.landmark }">
							</div>
							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									required="required" placeholder="City (Required)*" name="city"
									value="${userobj.city }">
							</div>
							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									required="required" placeholder="State (Required)*"
									name="state" value="${userobj.state }">
							</div>

							<div class="my-3">
								<input type="text" class="form-control-plaintext px-2"
									required="required" placeholder="Pincode (Required)*"
									name="pincode" value="${userobj.pincode }">
							</div>

							<div class="text-center d-grid">
								<button type="submit" class="btn btn-primary">Add
									address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 15px;"><%@include
			file="allComponent/footer.jsp"%></div>
</body>
</html>