<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/top" />
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

<script>
$(function(){
	$('#bf').submit(function(){
		var id=$('#userid').val();
		//alert(id);
		
		if(id=='' || id==null || id=='undefined'){
			alert('로그인 후 이용이 가능합니다');
			return false;
		}
		if($('#qtitle').val()==''){
			alert('제목을 입력하세요');
			$('#qtitle').focus();
			return false;
		}
		if($('#qcontent').val()==''){
			alert('글 내용을 입력하세요');
			$('#qcontent').focus();
			return false;
		}
		if($('#qpwd').val()==''){
			alert('비밀번호를 입력하세요');
			$('#qpwd').focus();
			return false;
		}
		return true;
	}) //submit
})  //$() end
</script>

<div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
   <h4>질문 작성하기</h4>

   <form name="bf" id="bf" role="form" action="/space/spaceDetail/qnawriteEnd" method="POST">
   <input type="hidden" name="mode" value="write">
   <input type="hidden" id="userid" name="userid" value="${loginUser.userid}" class="form-control">
   <input type="hidden" id="snum" name="snum" value="${sdvo.snum}" class="form-control">
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
       <tr>
          <td style="width:20%"><b>제목</b></td>
          <td style="width:80%">
          <input type="text" name="qtitle" id="qtitle" class="form-control">
          </td>
       </tr>      
       <tr>
          <td style="width:20%"><b>글내용</b></td>
          <td style="width:80%">
          <textarea name="qcontent" id="qcontent" rows="10" cols="50" class="form-control"></textarea>
          </td>
       </tr>
       <tr>
          <td style="width:20%"><b>비밀번호</b></td>
          <td style="width:80%">
          <div class="col-md-5">
          <input type="password" name="qpwd" id="qpwd" class="form-control">
          </div>
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










