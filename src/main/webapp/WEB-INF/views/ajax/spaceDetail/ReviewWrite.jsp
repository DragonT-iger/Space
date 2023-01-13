<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <script>
$(function(){
	$('#rwf').submit(function(){
		var id=$('#userid').val();
		alert(id);
		
		if(id=='' || id==null || id=='undefined'){
			alert('로그인 후 이용이 가능합니다');
			return false;
		}
		if($('#rtitle').val()==''){
			alert('제목을 입력하세요');
			$('#rtitle').focus();
			return false;
		}
		if($('#rcontent').val()==''){
			alert('글 내용을 입력하세요');
			$('#rcontent').focus();
			return false;
		}
		return true;
	}) //submit
})  //$() end
</script> -->

<!-- The Modal -->
<div class="modal" id="ReviewModal">
<div class="modal-dialog">
<div class="modal-content">

<form name="rwf" id="rwf" role="form" action="reviewWrite" method="post" enctype="multipart/form-data">

<!-- Modal Header --> 
<div class="modal-header">
<h4 class="modal-title">리뷰 작성하기</h4>
<button type="button" class="close" data-dismiss="modal">×</button>
</div>

<!-- Modal body -->
<div class="modal-body">

   <input type="hidden" name="mode" value="write">
   <input type="hidden" id="userid" name="userid" value="${loginUser.userid}" class="form-control">
   <input type="hidden" id="rtnum" name="rtnum" value="" class="form-control">
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
    	<tr>
          <td style="width:20%"><b>별점</b></td>
          <td style="width:80%">
              <fieldset>
		          <input type="radio" name="rscore" value="5" id="rate1"><label for="rate1">★</label>
				  <input type="radio" name="rscore" value="4" id="rate2"><label for="rate2">★</label>
				  <input type="radio" name="rscore" value="3" id="rate3"><label for="rate3">★</label>
				  <input type="radio" name="rscore" value="2" id="rate4"><label for="rate4">★</label>
				  <input type="radio" name="rscore" value="1" id="rate5"><label for="rate5">★</label>
			  </fieldset>
          </td>
      </tr>
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
          <input type="text" name="rtitle" id="rtitle" class="form-control">
          </td>
       </tr>      
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          <textarea name="rcontent" id="rcontent" rows="10" cols="50" class="form-control"
          		placeholder="상세한 리뷰를 남겨주시면 큰 힘이 됩니다! 1000p도 지급됩니다!!"></textarea>
          </td>
       </tr>
      <tr>
          <td style="width:20%"><b>이미지1</b></td>
          <td style="width:80%">
          <input type="file" name="rimage" id="rimage1" class="form-control" >
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>이미지2</b></td>
          <td style="width:80%">
          <input type="file" name="rimage" id="rimage2" class="form-control" >
          </td>
       </tr>
      </table>
</div>
      
<!-- Modal footer -->
<div class="modal-footer">
	<button class="btn btn-info">리뷰작성</button>
	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
</div>
      
</form>       
</div>
</div>
</div>

<style>
#rwf fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#rwf fieldset legend{
    text-align: right;
}
#rwf input[type=radio]{
    display: none;
}
#rwf label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#rwf label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#rwf label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#rwf input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#rcontent {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>







