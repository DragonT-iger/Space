<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<style>
.container{
	width:30%;
	background-color:red;
}
</style>
<html lang="en">
<head>
	<title>admin page</title>
	<meta charset="utf-8">
	<meta name="viewport" , initial-scale=1">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:set var="myctx" value="${pageContext.request.contextPath }"/>
	<div class="container" style="width:300px; margin:0;" >
		<br>
		<h2><b>관리자 페이지</b></h2>
		<br>
		<div>
			<ul class="nav flex-column">
				<li class="nav-item dropdown"><a class="nav-link disabled" href="#"><b>회원관리</b></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${myctx}/userlist">&nbsp;&nbsp;회원목록</a></li>
				<li class="nav-item"><a class="nav-link" href="#">&nbsp;&nbsp;예약내역</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"><b>호스트관리</b></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">&nbsp;&nbsp;호스트목록</a></li>
				<li class="nav-item"><a class="nav-link" href="#">&nbsp;&nbsp;등록내역</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><b>온라인문의</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><b>정산관리</b></a></li>
			</ul>
		</div>
	</div>

</body>
</html>