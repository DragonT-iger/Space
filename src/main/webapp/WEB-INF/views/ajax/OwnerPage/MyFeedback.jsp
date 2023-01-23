<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
<head>
<style>

	.container{
	
	padding: 0px 100px 0px 100px;
	
	}
	
	.search{
		display:inline-block;
	}

</style>
</head>
<div class="container mt-3" style="height:600px;overflow:auto;">
	<h1 class="text-center">나의 공간 피드백</h1>
<br>
	<!-- 검색 폼 -->
	<form class="search" name="searchF" action="searchForm" id="searchF" method="post">
		<input type="hidden" id="userid" name="userid" value="${loginUser.userid}">
		<div class="feedbackList-filter-bar">
		<span class="feedbackList-filter-item">
			<button id="FsnumSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			    공간 선택
			</button>
			<input type="hidden" id="Fsnum" name="Fsnum" value="">
			<div class="dropdown-menu">
			    <c:forEach var="sArr" items="${sArr}">
			    <a class="dropdown-item" href="#" onclick="btnSelectOption('Fsnum','${sArr.snum}')">${sArr.sname}</a>
			    </c:forEach>
			</div>
		</span>
		<span class="spacelist-filter-item">
			<input type="hidden" id="Freason" name="Freason" value="">
			<button id="FreasonSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			    사  유
			</button>
			<div class="dropdown-menu">
				<c:forEach var="rArr" items="${rArr}">
					<a class="dropdown-item" href="#" onclick="btnSelectOption('Freason','${rArr.r_code}')">${rArr.r_content}</a>
				</c:forEach>
			</div>
		</span>
		<button class="btn btn-outline-primary" type="button" onclick="search_btn()">검색</button>
		</div>
		<br>
		<%-- <select name="SpaceType" style="padding:6px;">
			<option value="">::공간 선택::</option>
			<c:if test="${sArr eq null or empty sArr}">
			<option value="${sArr.snum}" <c:if test="${paging.findType eq 1}">selected</c:if>>${sArr.sname}</option>
			<option value="2" <c:if test="${paging.findType eq 2}">selected</c:if>>작성자</option>
			<option value="3" <c:if test="${paging.findType eq 3}">selected</c:if>>글내용</option>
			</c:if>
		</select> --%>
		
		
		
	</form>
<!-- ========================================================-->
<table class="table table-condensed table-striped">
	<thead>
		<tr>
			<th>공간명</th>
			<th>사유</th>
			<th>피드백</th>
		</tr>
	</thead>


	<tbody id="FeedBody">
	<c:if test="${fArr eq null or empty fArr}">
		<tr>
			<td colspan="3"><b>취소 내역이 없습니다</b></td>
		</tr>
	</c:if>
	
	<c:if test="${fArr ne null or not empty fArr}">
		<c:forEach var="fb" items="${fArr}">
		<tr>
			<td>${fb.sname}</td>
			<td>${fb.r_content}</td>
			<td>${fb.etc}</td>
		</tr>
		</c:forEach>
	</c:if>
	</tbody>
	
	<%-- <tfoot>
		<tr>
			<td colspan="3" class="text-center">${pageNavi}</td>
		</tr>
	</tfoot> --%>
</table>
</div>
		  
<c:import url="/Spacefoot" charEncoding="utf-8" />
<script>
const btnSelectOption = function(sel,str){
	$('#'+sel).val(str);
	$('#'+sel+'Setbtn').html(str);
}

const search_btn = function(){
	let param = $('#searchF').serializeArray();
	var data={};
	for (var i in param) {
	    data[param[i].name] = param[i].value;
	}
	//alert(JSON.stringify(data));
	$.ajax({
		type:'post',
		url:'/space/owner/searchFeedback',
		contentType:'application/json',
		data: JSON.stringify(data),
		dataType:'json',
		success : function(res){
			//alert(res);
			if(res==''){
				showFeedbackListNo(res);
			}else{
				showFeedbackList(res);
			}
		},
		error: function(err){
			alert("실패!"+err.status)
		}
	});
}

const showFeedbackList = function(res){
	let str='';
	$.each(res,function(i,fb){
	//alert(fb.sname);
	str+=`<tr>
			<td>\${fb.sname}</td>
			<td>\${fb.r_content}</td>
			<td>\${fb.etc}</td>
		</tr>`
	});
	//alert(str)
	$("#FeedBody").html("");
	$("#FeedBody").html(str);
}

const showFeedbackListNo = function(res){
	let str=`<tr>
			<td colspan="3"><b>취소 내역이 없습니다</b></td>
		</tr>`;
	//alert(str)
	$("#FeedBody").html("");
	$("#FeedBody").html(str);
}
</script>