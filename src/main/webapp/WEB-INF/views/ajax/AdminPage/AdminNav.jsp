<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 	
<c:set var="myctx" value="${pageContext.request.contextPath }"/>
	<nav id="admin_nav">
		<br>
		<h2><b>관리자 메뉴</b></h2>
		<br>
		<div>
			<ul class="nav flex-column">
				<li class="nav-item dropdown">
					<a class="nav-link disabled" href="#"><b>회원관리</b></a></li>
					<li class="nav-item"><a class="nav-link" href="${myctx}/admin/userlistform">&nbsp;&nbsp;회원목록</a></li>
				
				<li class="nav-item dropdown"><a class="nav-link disabled" href="#"><b>호스트관리</b></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${myctx}/admin/spacelistform">&nbsp;&nbsp;공간등록내역</a></li>
				
				<li class="nav-item"><a class="nav-link" href="#"><b>온라인문의</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><b>정산관리</b></a></li>
			</ul>
		</div>
	</nav>
