<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.myrescheck-wrap{
		width:80%;
	}         
	.myrescheck-list-item>td{
		width:20%;
		vertical-align: middle;
	}
	.myrescheck-list-item>td>ul{
		list-style:none;
	}
</style>
<div class="myrescheck-wrap container text-center">
	<div class="myrescheck-header">
		<h1><c:out value="${space_info.sname}"/>공간명</h1>
		<h3>승인 유무 체크</h3>
	</div>
	<table class="myrescheck-list table border-1">
		<thead>
			<tr>
				<td>예약자명</td>
				<td>예약날짜</td>
				<td>예약시간</td>
				<td>예약인원</td>
				<td>승인유무</td>
			</tr>
		</thead>
		<tbody>
			<tr class="myrescheck-list-item">
				<td>홍길동</td>
				<td>
					<ul>
						<li>년도날짜</li>
						<li>시간</li>
					</ul>
				</td>
				<td>
					<ul>
						<li>년도날짜</li>
						<li>시간</li>
					</ul>
				</td>
				<td>예약인원</td>
				<td>
					<ul class="myrescheck-check-btn">
						<li><button class="btn btn-primary">승인</button></li>
						<li><button class="btn btn-danger">취소</button></li>
					</ul>
				</td>
			</tr>
		</tbody>
		<tfoot></tfoot>
	</table>
</div>