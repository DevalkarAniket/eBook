<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid bg-custom" style="height: 10px;"></div>
<div class="container-fluid p-3"
	style="background-image: linear-gradient(to right, #e0d3ed, #e5cce1);">
	<div class="clearfix">
		<div class="float-start">
			<h3>
				<i class="fa-solid fa-book"></i> EBooks
			</h3>
		</div>
		<div class="float-start mx-5">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-3" type="search" name="ch"
					placeholder="Search" aria-label="Search"
					style="background-color: #f4f4f4;">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>
		<div class="float-end">
			<div>
				<c:if test="${not empty userobj}">
					<a href="checkout.jsp" class="btn text-warning"><i
						class="fas fa-cart-plus fa-2xl text-danger"></i></a>
					<a href="login.jsp" class="btn btn-success"><i
						class=" fas fa-duotone fa-user-plus"></i> ${userobj.name}</a>
					<a data-bs-toggle="modal"
						data-bs-target="#staticBackdrop"
						class="btn btn-primary text-white"><i
						class=" fas fa-sign-out-alt"></i> Logout</a>
				</c:if>
			</div>
			<div>
				<c:if test="${empty userobj}">
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-duotone fa-right-to-bracket"></i> Login</a>
					<a href="register.jsp" class="btn btn-primary"><i
						class=" fas fa-duotone fa-user-plus"></i> Register</a>
				</c:if>
			</div>
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
				<a href="logout" type="button" class="btn text-white btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- end logout model -->

<nav class="navbar navbar-expand-lg navbar-dark mb-1 bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i
			class="fas fa-duotone fa-house-chimney"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item  px-1"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item  px-1"><a class="nav-link active"
					aria-current="page" href="allRecentBook.jsp"><i
						class="fa-solid fa-duotone fa-book-open"></i> Recent Book</a></li>
				<li class="nav-item px-1"><a class="nav-link active"
					aria-current="page" href="allNewBook.jsp"><i
						class="fa-solid fa-duotone fa-book-open"></i> New Book</a></li>
				<li class="nav-item px-1"><a class="nav-link active"
					aria-current="page" href="allOldBook.jsp"><i
						class="fa-solid fa-duotone fa-book"></i> Old Book</a></li>
			</ul>
			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light me-2" type="submit">
					<i class="fas fa-duotone fa-gear"></i> Setting
				</a> <a href="contactus.jsp" class="btn btn-light me-2" type="submit">
					<i class="fas fa-duotone fa-phone"></i> Contact Us
				</a>
			</form>
		</div>
	</div>
</nav>