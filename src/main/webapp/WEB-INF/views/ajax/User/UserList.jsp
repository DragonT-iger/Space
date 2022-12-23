<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user list</title>
</head>
<body>
	<div class="container mt-3" id="userlist" style="height:600px; overflow: auto;">
	<h1 class="text-center">회원목록</h1>
	<div>
		<%-- ${userArr} --%>
		<table class="table table-bordered mt-3">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>연락처</th>
				<th>회원상태</th>
				<th>수정|삭제</th>
			</tr>
			<!-- ----------------------------- -->
			<c:forEach var="user" items="${userArr }">
			<tr>
				<td>${user.idx}</td>
				<td>${user.name}</td>
				<td>${user.userid}</td>
				<td>${user.allHp}</td>
				<td class="txt${user.status}">${user.statusStr}</td>
				<td>
				<a href="javascript:userEdit('${user.idx}')">수정</a>
				<a href="#" onclick="userDel('${user.idx}')">삭제</a>
				</td>
			</tr>
			</c:forEach>
			<!-- ----------------------------- -->
		</table>
	</div>
</body>
</html>