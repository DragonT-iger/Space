<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageTop.jsp" %>
<c:set var="myctx" value="${pageContext.request.contextPath }"/>
<style>
	.userlist-filter-bar{
		display:flex;
		flex-wrap:wrap;
		justify-content: flex-start;
	}
	.userlist-filter-item{
		padding:2px;
		width:32%;
	}
	.dropdown-menu{
		padding:5px;
	}
</style>
	<div class="container mt-3" id="userlist">
	<h1 class="text-center">회원 목록</h1>
		<form method="post" id="searchf" name="searchf">
				<div class="userlist-filter-bar">
				<div class="userlist-filter-item">
					<label>나이 설정</label>
					<button id="FmageSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    나  이
					</button>
					<div class="dropdown-menu" id="Fmage">
					    <input type="number" id="minFmage" name="minFmage" placeholder="최소나이" onchange="btntextSet('Fmage')">~
					    <input type="number" id="maxFmage" name="maxFmage" placeholder="최대나이" onchange="btntextSet('Fmage')">
					    <p>ex) 17 ~20 17세이상 20세이하로 검색됩니다.</p>
					    <button class="btn btn-sm btn-primary" type="button" onclick="btntextSet('Fmage')">설정</button>
					</div>
				</div>
				<div class="userlist-filter-item">
					<label>회원등급 설정</label>
					<button id="FmrankSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    등  급
					</button>
					<div class="dropdown-menu" id="Fmrank">
					    <input type="number" id="minFmrank" name="minFmrank" placeholder="최소등급" onchange="btntextSet('Fmrank')">~
					    <input type="number" id="maxFmrank" name="maxFmrank" placeholder="최대등급" onchange="btntextSet('Fmrank')">
					    <p>검색할 등급범위를 입력해주세요.</p>
					    <button class="btn btn-sm btn-primary" type="button" onclick="btntextSet('Fmrank')">설정</button>
					</div>
				</div>
				<div class="userlist-filter-item">
					<label>가입일자 설정</label>
					<button id="FmdateSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    가입일자
					</button>
					<div class="dropdown-menu" id="Fmdate">
					    <input type="date" id="minFmdate" name="minFmdate" placeholder="가입날짜 시작" onchange="btntextSet('Fmdate')">~
					    <input type="date" id="maxFmdate" name="maxFmdate" placeholder="가입날짜 끝" onchange="btntextSet('Fmdate')">
					    <p>검색할 가입일자 범위를 입력해주세요.</p>
					    <button class="btn btn-sm btn-primary" type="button" onclick="btntextSet('Fmdate')">설정</button>
					</div>
				</div>
				<div class="userlist-filter-item">
					<label>누적포인트 설정</label>
					<button id="FpointAddSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    충전 누적포인트
					</button>
					<div class="dropdown-menu" id="FpointAdd">
					    <input type="number" id="minFpointAdd" name="minFpointAdd" placeholder="최소누적포인트" onchange="btntextSet('FpointAdd')">~
					    <input type="number" id="maxFpointAdd" name="maxFpointAdd" placeholder="최대누적포인트" onchange="btntextSet('FpointAdd')">
					    <p>검색할 누적포인트 범위를 입력해주세요.</p>
					    <button class="btn btn-sm btn-primary" type="button" onclick="btntextSet('FpointAdd')">설정</button>
					</div>
				</div>
				<div class="userlist-filter-item">
					<label>예약횟수 설정</label>
					<button id="FrcountSetbtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    예약횟수
					</button>
					<div class="dropdown-menu" id="Frcount">
					    <input type="number" id="minFrcount" name="minFrcount" placeholder="최소 예약횟수" onchange="btntextSet('Frcount')">~
					    <input type="number" id="maxFrcount" name="maxFrcount" placeholder="최대 예약횟수" onchange="btntextSet('Frcount')">
					    <p>검색할 예약횟수 범위를 입력해주세요.</p>
					    <button class="btn btn-sm btn-primary" type="button" onclick="btntextSet('Frcount')">설정</button>
					</div>
				</div>
			</div>
			<div class="userlist-search-bar text-center m-3">
				<select name="FkeywordOption">
					<option value="Fname">이름</option>
					<option value="Fuserid">아이디</option>
				</select>
				<input type="text" id="keyword" name="keyword" style="width:30%">
				<button type="button" onclick="userlist_search_btn()">검색</button>
			</div>
		</form>
		
		<!-- result div -->
		<div id="container-userlist">
		</div>
	</div>
<script>
	window.onload= function(){
		$.ajax({
			type:'post',
			url:'userlist',
			contentType:'application/json',
	    	cache:false,
	    	success :function (res){
	    		//alert(JSON.stringify(res));
	    		if(res==""||res==null){ //res값이 없을시
	    			alert("검색결과가 없습니다.");
	    		}else{
	    		  showUserList(res);
	    		}
	    	},
	    	error: function (err){
	    		alert("error"+err.status) //
	    	}
    	  });
	}
	const userlist_search_btn = function(){
		let param = $('#searchf').serializeArray();
		//console.log(JSON.stringify(param));
		//alert(JSON.stringify(param));
		var data={};
		for (var i in param) {
		    data[param[i].name] = param[i].value;
		}
		//alert(JSON.stringify(data));
		$.ajax({
			type:'post',
			url:'searchUser',
			contentType:'application/json',
			data: JSON.stringify(data),
			dataType:'json',
			success : function(res){
				//alert(res);
				showUserList(res);
			},
			error: function(err){
				alert("실패!"+err.status)
			}
		});
	}
	const showUserList = function(res){
		let str=`
			<table class="table table-bordered mt-3">
			<tr>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>가입일자</th>
				<th>연락처</th>
				<th>회원상태</th>
				<th>누적포인트</th>
				<th>현재포인트</th>
				<th>회원등급</th>
				<th>예약횟수</th>
			</tr>`
			$.each(res,function(i,member){
			str+=`<tr onclick="userHistoryCheck('\${member.userid}')">
					<td>\${member.mname}</td>
					<td>\${member.nickname}</td>
					<td>\${member.userid}</td>
					<td>\${member.birth}</td>
					<td>\${member.mdate}</td>
					<td>\${member.hp}</td>
					<td class="txt\${member.status}">\${member.statusStr}</td>
					<td>\${member.pointadd}</td>
					<td>\${member.point}</td>
					<td>\${member.mrank}</td>
					<td>\${member.rcount}</td>
				</tr>`
			});
			str+=`</table>`;
		$("#container-userlist").html(str);
	}
	const btntextSet = function(sel){
		//console.log(sel);
		str = $('#min'+sel).val()+"~"+$('#max'+sel).val();
		//console.log(str);
		$('#'+sel+'Setbtn').html(str);
	}
	const userHistoryCheck = function(userid){
		alert("userid===>"+userid);
		let str ="";
		$.ajax({
			type:'get',
			url:'UserHistroyCheck',
			data:'userid='+userid,
			dataType:'json',
			success : function(res){
				$('#UserHistoryModal').modal();
				str +=`
					<tr>
						<th>공간명</th>
						<th>해시태그</th>
						<th>사용금액</th>
						<th>예약횟수</th>
					</tr>`
				$.each(res.historylist,function(i,history){
				str += `
					<tr>
						<td>\${history.sname}</td>
						<td>\${history.h_name}</td>
						<td>\${history.sumtp} 원</td>
						<td>\${history.rcount} 회</td>
					</tr>
				`
				})
				$('#historyitem').html(str);
				$('#SumTotalPrice').html("총사용금액은 = " + res.sumtotal + "원");
			},
			error : function(err){
				alert(res);
			}
		});
		
	}
</script>
<%@include file="/WEB-INF/views/ajax/AdminPage/UserHistory.jsp" %> 
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageFoot.jsp" %>