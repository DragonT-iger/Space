<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/top" />
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

<script>
$(function(){
	$('#rvf').submit(function(){
		var id=$('#userid').val();
		//alert(id);
		
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
</script>

<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
   <h4>답변 작성하기</h4>

   <form name="rvf" id="rvf" role="form" action="/space/spaceDetail/reviewrewriteEnd" method="POST">
   <input type="hidden" name="mode" value="rewrite">
   <input type="text" id="renum" name="review_num" value="">
   <input type="hidden" id="userid" name="userid" value="${loginUser.userid}" class="form-control">
   <input type="hidden" id="snum" name="snum" value="${sdvo.snum}" class="form-control">
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
       <tr>
          <td style="width:20%"><b>답변</b></td>
          <td style="width:80%">
          <textarea name="rcontent" id="rcontent" rows="10" cols="50" class="form-control"></textarea>
          </td>
       </tr>
      <tr>
         <td colspan="2" class="text-center">
            <button type="submit" id="btnWrite" class="btn btn-success">글쓰기</button>
            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
         </td>
      </tr>
   
      </table>
</form>       
</div>










