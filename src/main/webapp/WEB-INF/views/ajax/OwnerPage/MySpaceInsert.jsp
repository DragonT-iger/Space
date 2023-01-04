<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<c:import url="/Spacetop" charEncoding="utf-8" />
<script>
	$(function() {
		CKEDITOR.replace('scontents');
	})
	function postfind() {
		new daum.Postcode({
			oncomplete : function(data) {
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('spost').value = data.zonecode; //우편 번호
				document.getElementById('saddr1').value = addr; //도로명 주소
			}
		}).open();
	}
</script>


<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
	<h1 class="my-5">공간등록, 수정 페이지</h1>

	<form name="sf" id="sf" role="form" action="spaceInsert" method="POST"
		enctype="multipart/form-data">
		<!-- 등록유저 누군지 확인  -->
		<input type="hidden" name="userid" id="userid" value="${spaceinfo.userid}"/>
		<table class="table">
			<tr>
				<td style="width: 20%"><b>공간명칭</b></td>
				<td style="width: 80%"><input type="text" name="sname"id="sname" value="<c:out value="${ex_spaceinfo.sname}"/>" class="form-control"></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>컨셉카테고리</b></td>
				<td style="width: 80%">
					<input class="form-control" list="hashlist" name="h_code" id="h_code" value="<c:out value="${ex_spaceinfo.h_code}"/>">
					<datalist id="hashlist">
						  <!-- for문으로 생성 해시태그등록한거 차례대로 -->
						  <!-- ex option) -->
						  <option value="크리스마스">
						  <option value="마블">
						  <option value="로맨스">
						  <option value="생일">
						  <option value="게임">
						  <!-- for end -->
					</datalist>
					
				</td>
			</tr>
			<tr>
				<td style="width:20%">
					<b>비용</b>
				</td>
				<td style="width:80%">
					<div class="row">
						<div class="col">
					      	<input type="number" name="bcost" id="bcost" class="form-control" placeholder="기본비용" value="<c:out value="${ex_spaceinfo.bcost}"/>">
					    </div>
					    <div class="col">
							<input type="number" name="ecost" id="ecost" class="form-control" placeholder="인원추가금" value="<c:out value="${ex_spaceinfo.ecost}"/>">
					    </div>
				    </div>
				</td>
			</tr>
			<tr>
				<td style="width:20%">
					<b>인원설정</b>
				</td>
				<td style="width:80%">
					<div class="row">
						<div class="col">
					      	<input type="number" name="minn" id="minn" class="form-control" placeholder="최소 인원수" value="<c:out value="${ex_spaceinfo.minn}"/>">
					    </div>
					    <div class="col">
							<input type="number" name="maxn" id="maxn" class="form-control" placeholder="최대 인원수" value="<c:out value="${ex_spaceinfo.maxn}"/>">
					    </div>
				    </div>
				</td>
			</tr>
			<tr>
				<td style="width: 20%"><b>공간설명</b></td>
				<td style="width: 80%"><textarea name="scontents" id="scontents" 
						rows="10" cols="50" class="form-control"><c:out value="${ex_spaceinfo.scontents}"/></textarea></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>공간 규칙</b></td>
				<td style="width: 80%"><textarea name="srule" id="srule"
						rows="10" cols="50" class="form-control"><c:out value="${ex_spaceinfo.srule}"/></textarea></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>우편번호</b></td>
				<td width="80%" class="m2"><input type="text" name="spost" 
					id="spost" placeholder="Post" maxlength="5" value="<c:out value="${ex_spaceinfo.spost}"/>">
					<button type="button" class="btn btn-success" onclick="postfind()">우편번호
						찾기</button></td>
			</tr>
			<tr>
				<td width="20%"><b>주소</b></td>
				<td width="80%">
					<input type="text" class="form-control" name="saddr1" id="saddr1" placeholder="Address" value="<c:out value="${ex_spaceinfo.saddr1}"/>"><br> 
					<input type="text" class="form-control" name="saddr2" id="saddr2" placeholder="상세주소" value="<c:out value="${ex_spaceinfo.saddr2}"/>"></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>메인사진</b></td>
				<td style="width: 80%"><input type="file" name="simage" 
					id="simage1" class="form-control" ></td>
			</tr>
			<input type ="file" name ="simage1" style="display: none;">
			<tr>
				<td style="width: 20%"><b>소개사진1</b></td>
				<td style="width: 80%"><input type="file" name="simage"
					id="simage2" class="form-control" ></td>
			</tr>
			<input type ="file" name ="simage2" style="display: none;">
			<tr>
				<td style="width: 20%"><b>소개사진2</b></td>
				<td style="width: 80%"><input type="file" name="simage"
					id="simage3" class="form-control" ></td>
			</tr>
			<input type ="file" name ="simage3" style="display: none;">
			<tr>
				<td style="width: 20%"><b>소개사진3</b></td>
				<td style="width: 80%"><input type="file" name="simage"
					id="simage4" class="form-control" ></td>
			</tr>
			<input type ="file" name ="simage4" style="display: none;">
			<tr>
				<td colspan="2" class="text-center">
					<button type="submit" id="btnWrite" class="btn btn-success">등록</button>
					<button type="reset" id="btnReset" class="btn btn-warning"
						onclick="javascript:CKEDITOR.instances.content.setData('')">다시쓰기</button>
				</td>
			</tr>
			
			

		</table>


	</form>

</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />