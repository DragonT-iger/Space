<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Space</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<c:set var="myctx" value="${pageContext.request.contextPath }"/> 
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${myctx }/lib/animate/animate.min.css" rel="stylesheet">
<%-- <link href="${myctx }/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${myctx }/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" /> --%>

<!-- Customized Bootstrap Stylesheet -->
<link href="${myctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${myctx }/css/style.css" rel="stylesheet">

<!-- Template Stylesheet -->



<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/ce9db0be33.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<!-- <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div> -->
		<!-- Spinner End -->
		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="${myctx}/" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa-solid fa-meteor"></i> Space
					</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						
						<!-- Home Reservation Services Contact Pages MyPage MyReservation -->
						<div class="nav-item dropdown">
							<c:if test="${loginUser.status ne null}">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
							</c:if>
							<c:if test="${loginUser.status eq null}">
								<a href="#" class="nav-link dropdown-toggle">로그인해주세요</a>
							</c:if>
							<div class="dropdown-menu m-0">
								
								<a href="${myctx}/user/MyPage" class="dropdown-item">MyPage</a>
								
								<!-- 일반유저 -->
								<c:if test="${loginUser.status eq 0 }">
								<a href="${myctx}/user/MyReservation" class="dropdown-item">MyReservation</a>
								<a href="${myctx}/user/MyZimm" class="dropdown-item">MyZimm</a>
                                <a href="${myctx}/user/MyReviewList" class="dropdown-item">MyReviewList</a> 
								</c:if>
								<c:if test="${loginUser.status eq 1 }">
                                <a href="${myctx}/owner/MyReservationCheck" class="dropdown-item">MyReservationCheck</a>
                                <a href="${myctx}/owner/MySpaceEdit" class="dropdown-item">MySpaceEdit</a>
                                <a href="${myctx}/owner/MySpaceInsert" class="dropdown-item">MySpaceInsert</a>
                                <a href="${myctx}/owner/MySpaceList" class="dropdown-item">MySpaceList</a>
                                </c:if>
                                <c:if test="${loginUser.status eq 9 }">
                                <a href="${myctx}/admin/MyPageAdminPage" class="dropdown-item">AdminPage</a>
                                </c:if>
							</div>

						</div>
					</div>
					<!-- 세션에 user정보가있으면 로그아웃버튼으로 변경 -->
					<c:if test="${loginUser eq null }">
					<a href="${myctx}/Login"
						class="btn btn-primary py-2 px-4">로그인</a>
					</c:if>
					<c:if test="${loginUser ne null }">
						<a href="${myctx}/logout"
						 class="btn btn-primary py-2 px-4">로그아웃</a>
					</c:if>
				</div>
			</nav>