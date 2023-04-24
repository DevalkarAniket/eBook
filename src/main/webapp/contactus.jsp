<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-image: linear-gradient(to right, #e0d3ed, #e5cce1);
}

.content {
	padding: 7rem 0;
}

.heading {
	font-size: 2.5rem;
	font-weight: 900;
}

.form-control-plaintext {
	border-bottom: 2px solid #ccc;
	padding-left: 0;
	padding-right: 0;
	border-radius: 0;
}

.col-form-label {
	color: #FADCD9;
	font-size: 13px;
}

.btn, .form-control, .custom-select {
	height: 45px;
}

.contact-wrap .col-form-label {
	font-size: 14px;
	color: #595757;
	margin: 0 0 10px 0;
	display: inline-block;
	padding: 0;
}

.contact-wrap .form, .contact-wrap .contact-info {
	padding: 40px;
}

.contact-wrap .contact-info ul li {
	margin-bottom: 15px;
	color: #f2f2f2;
}

.contact-wrap .contact-info ul li .wrap-icon {
	font-size: 20px;
	color: #fff;
	margin-top: 5px;
}

.contact-wrap .form {
	background: #f2f2f2;
}

.contact-wrap .contact-info {
	background: #1a237e;
}

.contact-wrap .form h3 {
	color: #f2f2f2;
	font-size: 20px;
	margin-bottom: 30px;
}

.contact-wrap .contact-info h3 {
	color: #f2f2f2;
	font-size: 20px;
	margin-bottom: 30px;
}

.content {
	margin-top: -40px;
}
</style>
</head>
<body style="background-color: #F9F1F0;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="content">
		<div class="container">
			<div class="row align-items-stretch no-gutters contact-wrap">
				<div class="col-md-8">
					<div class="form">
						<h3>Send us a message</h3>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						<form action="./contactus" method="post" id="contactForm"
							name="contactForm" novalidate="novalidate">
							<div class="row">
								<div class="col-md-6 form-group mb-5">
									<label for="" class="col-form-label">Name *</label> <input
										type="text" class="form-control-plaintext" name="name"
										id="name" placeholder="Your name" required="required">
								</div>
								<div class="col-md-6 form-group mb-5">
									<label for="" class="col-form-label">Email *</label> <input
										type="text" class="form-control-plaintext" name="email"
										id="email" placeholder="Your email" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group mb-5">
									<label for="" class="col-form-label">Phone *</label> <input
										type="text" class="form-control-plaintext" name="phone"
										id="phone" placeholder="Phone #" required="required">
								</div>
								<div class="col-md-6 form-group mb-5">
									<label for="" class="col-form-label">Address</label> <input
										type="text" class="form-control-plaintext" name="address"
										id="address" placeholder="Your Address" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 form-group mb-5">
									<label for="message" class="col-form-label">Message *</label>
									<textarea class="form-control-plaintext" name="message"
										id="message" cols="30" rows="4"
										placeholder="Write your message" required="required"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 form-group">
									<input style="background-color: #1a237e;" type="submit"
										value="Send Message" class="btn btn-primary py-2 px-4">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-4">
					<div class="contact-info h-100 bg-custom">
						<h3 class="pb-4">Contact Information</h3>
						<ul class="list-unstyled">
							<li class="d-flex"><span><i
									class="fa-solid fa-location-dot me-3"></i></span> <span class="text">207
									Aspen Lane South Richmond Hill, Pune 410502</span></li>
							<li class="d-flex"><span><i
									class="fa-solid fa-phone me-3"></i></span> <span class="text">+1
									(291) 939 9321</span></li>
							<li class="d-flex"><span><i
									class="fa-solid fa-envelope me-3"></i></span> <span class="text">info@ebooks.com</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div><%@include file="allComponent/footer.jsp"%></div>
</body>
</html>