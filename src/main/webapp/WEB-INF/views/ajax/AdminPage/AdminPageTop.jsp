<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="myctx" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Space Admin Page</title>
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

<!-- Customized Bootstrap Stylesheet -->
<link href="${myctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${myctx }/css/style.css" rel="stylesheet">

<!-- Template Stylesheet -->



<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/ce9db0be33.js" crossorigin="anonymous"></script>
</head>
<style>
.admincontainer{
	overflow:hidden;
}
#content-nav{
	width:15%;
	padding:1%;
	float:left;
	background-color:lightgray;
}
#content-wrap{
	width:85%;
	float:left;
}
</style>
<body>
	<c:set var="myctx" value="${pageContext.request.contextPath }"/>
	<div class="bg-white p-0">
		<!-- Navbar & Hero Start -->
		<div class="position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="${myctx}/" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa-solid fa-meteor"></i> AdminPage
					</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<div class="nav-item nav-link" style="height:50px;">
						</div>
					</div>
					<!-- 세션에 user정보가있으면 로그아웃버튼으로 변경 -->
					<c:if test="${loginUser ne null }">
						<a href="${myctx}/logout"
						 class="btn btn-primary py-2 px-4">나가기</a>
					</c:if>
				</div>
			</nav>
		</div>
	<div class="admincontainer" >
		<div id="content-nav">
			<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminNav.jsp" %>
		</div>
		<div id="content-wrap">