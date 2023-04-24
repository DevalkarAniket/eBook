<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Help center</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.card {
	background-color: #e8e8e8;
}
</style>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="card p-4">
					<div class=" p-1">
						<i class="fas fa-square-phone fa-6x text-success"></i>
					</div>
					<h3 class="py-2">24*7 Service</h3>
					<h4 class="py-2">HelpLine Number</h4>
					<h5 class="py-2">0671-7865349</h5>
					<div class="">
						<a href="index.jsp" class="btn btn-primary">Home</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 73px;"><%@include
			file="allComponent/footer.jsp"%></div>
</body>
</html>