<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
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

h4 {
	border-bottom: 1px solid #a8a8a8;
	display: inline;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="/login.jsp" />
	</c:if>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-3 p-3">
				<a href="addBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-4x text-primary py-2"></i><br>
							<h4>Add Books</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 p-3">
				<a href="allBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-4x text-danger py-2"></i><br>
							<h4>All Books</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 p-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-4x text-warning py-2"></i><br>
							<h4>Orders</h4>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 p-3">
				<a data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-4x text-primary py-2"></i><br>
							<h4>Logout</h4>
						</div>
					</div>
				</a>

			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="background-color: #eeeeee;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">
						<i class="fas fa-sign-out-alt pe-3"></i><b>Logout</b>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<i class="fas fa-sign-out-alt fa-4x text-primary"></i>
						<p>Are you sure you want to exit the system ?</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../logout" type="button"
						class="btn text-white btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- end logout model -->
	<div style="margin-top: 423px"><%@include
			file="/allComponent/footer.jsp"%></div>

</body>
</html>