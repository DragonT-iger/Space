<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<c:import url="/Spacetop" charEncoding="utf-8" />
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d46c89f3b6dd702f6ea692b4e562a79&libraries=services"></script>
<script>
	function postfind() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	        	document.getElementById('spost').value = data.zonecode; //우편 번호
				document.getElementById('saddr1').value = addr; //도로명 주소
	            Promise.resolve(data).then(o => {
	                const { address } = data;

	                return new Promise((resolve, reject) => {
	                    const geocoder = new daum.maps.services.Geocoder();

	                    geocoder.addressSearch(address, (result, status) =>{
	                        if(status === daum.maps.services.Status.OK){ //다음map api service가 정상호출됫을대
	                            const { x, y } = result[0];
								alert(result[0].x);
								alert(result[0].y);
	                            resolve({ lat: y, lon: x }) //성공시 object객체에 lat에 y값담기고 lon에 x값담김
	                        }else{
	                            reject(); //실패
	                        }
	                    });
	                })
	            }).then(result => {
	                //alert( JSON.stringify(result)); //오브젝트값확인
	                document.getElementById('slong').value = result.lon;
	                document.getElementById('slat').value = result.lat;
	            }).catch(function(err) {
	            	  console.log(err); //reject 실패시 에러코드 콘솔에 출력
	           	});
	        }
	    }).open();
	}
</script>

<script>
	function ex_info(){
		var sname = $("#sname").val();
		var userid = $("#userid").val();
		$.ajax({
			url : "spaceInsertAjax",
			type : "post",
			data : {
				sname : sname,
				userid : userid
			},
			success : function(data) {
				alert(JSON.stringify(data));
				$("#srule").val(data.srule);
				$("#minn").val(data.minn);
				$("#maxn").val(data.maxn);
				$("#bcost").val(data.bcost);
				$("#ecost").val(data.ecost);
				$("#saddr1").val(data.saddr1);
				$("#saddr2").val(data.saddr2);
				$("#simage1").val(data.simage1);
				$("#simage2").val(data.simage2);
				$("#simage3").val(data.simage3);
				$("#simage4").val(data.simage4);
				$("#scontents").val(data.scontents);
				$("#srule").val(data.srule);
				$("#spost").val(data.spost);
				$("#slong").val(data.slong);
				$("#slat").val(data.slat);
				
				// h_code 값에 해당하는 option 요소 찾기
				var $option = $('#h_code option[value=' + data.h_code + ']');
				// 찾은 option 요소에 selected 속성 추가
				$option.attr('selected', true);

			},
			error : function() {
				alert("실패");
			}
		})
	}
</script>




<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
	<h1 class="my-5">공간등록, 수정 페이지</h1>





	<form name="sf" id="sf" role="form" action="spaceInsert" method="POST"
		enctype="multipart/form-data">
		<!-- 등록유저 누군지 확인  -->
		<input type="hidden" name="userid" id="userid" value="<c:set var="space" value="${ex_spaceinfo[0]}"/>${space.userid}">
		<table class="table">
			<tr>
				<td style="width: 20%"><b>공간명칭</b></td>
				<td style="width: 80%">
				<!-- <input class="form-control" list="hashlist" name="sname" id="sname" value="<c:set var="space" value="${ex_spaceinfo[0]}"/>${space.sname}"> -->
					<input class="form-control" list="hashlist" name="sname" id="sname" onchange ="ex_info()">
					<datalist id="hashlist">
						<!-- for문으로 생성 해시태그등록한거 차례대로 -->
						<!-- ex option) -->
						<c:forEach var="rep" items="${ex_spaceinfo}">
							<option value="${rep.sname}"></option>
						</c:forEach>
						<!-- for end -->
					</datalist>
				</td>
			</tr>
			<tr>
				<td style="width: 20%"><b>컨셉카테고리</b></td>
				<td style="width: 80%">
					<select name ="h_code" id="h_code">
						<option value="1">Option 1</option>
						<option value="2">Option 2</option>
						<option value="3">Option 3</option>
						<option value="4">Option 4</option>
						<option value="5">Option 5</option>
					</select>
					  
					
				</td>
			</tr>
			<tr>
				<td style="width:20%">
					<b>비용</b>
				</td>
				<td style="width:80%">
					<div class="row">
						<div class="col">
					      	<input type="number" name="bcost" id="bcost" class="form-control" placeholder="기본비용">
					    </div>
					    <div class="col">
							<input type="number" name="ecost" id="ecost" class="form-control" placeholder="인원추가금">
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
					      	<input type="number" name="minn" id="minn" class="form-control" placeholder="최소 인원수">
					    </div>
					    <div class="col">
							<input type="number" name="maxn" id="maxn" class="form-control" placeholder="최대 인원수">
					    </div>
				    </div>
				</td>
			</tr>
			<tr>
				<td style="width: 20%"><b>공간 규칙</b></td>
				<td style="width: 80%"><textarea name="scontents" id="scontents"
						rows="10" cols="50" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>공간 규칙</b></td>
				<td style="width: 80%"><textarea name="srule" id="srule"
						rows="10" cols="50" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>우편번호</b></td>
				<td width="80%" class="m2"><input type="text" name="spost"
					id="spost" placeholder="Post" maxlength="5" >
					<button type="button" class="btn btn-success" onclick="postfind()">우편번호
						찾기</button></td>
			</tr>
			<tr>
				<td width="20%"><b>주소</b></td>
				<td width="80%">
					<input type="text" class="form-control" name="saddr1" id="saddr1" placeholder="Address"><br> 
					<input type="text" class="form-control" name="saddr2" id="saddr2" placeholder="상세주소"><br>
					<input type="hidden" class="form-control" name="slong" id="slong" placeholder="좌표값Y"><br>
					<input type="hidden" class="form-control" name="slat" id="slat" placeholder="좌표값X"></td>
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
	<div id="postcode"></div>
</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />