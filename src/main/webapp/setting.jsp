<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting</title>
<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

a div {
	background-color: #e8e8e8;
	color: #000000;
	border-radius: 15px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
}

a div:hover {
	-webkit-transform: scale(1.04);
	transform: scale(1.04);
	background: #c0c0c0;
}

.card {
	background: transparent;
	border: none;
}

.card:hover {
	background: transparent;
}
</style>

</head>
<body style="background-color: #F9F1F0;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-3">
		<h3 class="text-center text-dark p-1">Hello, ${userobj.name }</h3>
		<div class="row p-2">
			<div class="col-md-3 p-3 offset-md-1">
				<a href="sellBook.jsp" style="background: #000000">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-4x text-primary"></i>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3 p-3 offset-md-1">
				<a href="oldBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-4x text-danger"></i>
							<h3>View Old Books</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 p-3 offset-md-1">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-edit fa-4x text-success"></i>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 offset-md-3 p-3">
				<a href="userAddress.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-map-marker-alt fa-4x text-warning"></i>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3 offset-md-1 p-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-4x text-info"></i>
							<h3>My Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 offset-md-5 p-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-user-circle fa-4x text-secondary"></i>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div><%@include file="../allComponent/footer.jsp"%></div>
</body>
</html>