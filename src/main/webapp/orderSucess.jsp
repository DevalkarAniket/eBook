<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="allComponent/allCss.jsp"%>
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}
</style>
</head>
<body style="background-color: #F9F1F0;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You!</h1>
		<h2>Your Order Successfully</h2>
		<h5>With in 7 Days Your Order Will be Delivered In Your Address.</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
</body>
</html>