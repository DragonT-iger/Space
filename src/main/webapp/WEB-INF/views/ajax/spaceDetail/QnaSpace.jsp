<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.box{
margin:10px;
}

.qlist{
	background-color:#fdf5e6;
}
.qrlist{
	background-color:#FFEFD5;
}
#qna_qnum{
	font-size: 1px;
}
.qd{
	font-size:10px;
}
#qna_title{
	font-weight:bold;
}
.leftq{
	text-align:right;
}
.user_name{
	float:left;

}
</style>

<div id="s_qna">
<div id="qna_question">
	<div id="qna_head">
		<h4 class="fa-solid fa-meteor">Q&A
			<strong>${paging.totalCount}</strong>
		
		</h4>
	</div>
	
	<a class=".btn1 btn btn-primary btn_qna_write">
			<span onclick="qna_write()">질문 작성하기</span>
		</a>
	
	<div id="body_change_qna">
	<div class="qna_body">
		<ul class="qna_list">
		
		<c:if test="${qnaArr eq null or empty qnaArr}">
			<div>
				<span><b>아직 등록된 질문이 없습니다.</b></span>
			</div>
		</c:if>
		
		<c:if test="${qnaArr ne null or not empty qnaArr}">
		<c:forEach var="qna" items="${qnaArr}">
			<li class="qlist">
			<!-- 답변레벨에 따라 색상 변경 -->
			<c:if test="${qna.qgorder>0}">
				<li class="qrlist">
			</c:if>
		
				<div class="box">
					<div id="qna_qnum">${qna.qnum}
					
					<c:if test="${sdvo.userid eq loginUser.userid}">
						<c:if test="${qna.qgorder eq 0}">
							<span class="leftq" onclick="qna_rewrite('${qna.qnum}')">답변 작성하기</span>
						</c:if>
						<%-- <c:if test="${qna.qgorder>0}">
							<div onclick="qna_UpdateRewrite()">답변 수정하기</div>
						</c:if> --%>
					</c:if>
					
					</div>
					
					<div class="user_name">${qna.userid}
						<span class="leftq" onclick="delete_qnum(${qna.qnum},'${qna.qpwd}')">x</span>
				</div>
					<div>
						<p id="qna_title">${qna.qtitle}</p>
						<p>${qna.qcontent}</p>
						<p class="qd">${qna.qdate}</p>
					</div>
				</div>
			</li>
		</c:forEach>
		</c:if>
		</ul>
	</div>
	
	<div class="qna_paging">
		<ul class="pagination justify-content-center">
			<c:if test="${paging.prevBlock>0 }">
				<li class="page-item">
				<a class="page-link" href="/spaceDetail/qnalist?cpage=<c:out value="${paging.prevBlock }"/>">Prev</a>   
				</li>
			</c:if>

			<c:forEach var="i" begin="${paging.prevBlock+1 }" end="${paging.nextBlock-1}"> 
				<c:if test="${i <=paging.pageCount }"> 
					<li class="page-item <c:if test="${i eq paging.cpage}">active</c:if>">
					<a  class="page-link" href="/spaceDetail/qnalist?cpage=<c:out value="${i }"/>"> <c:out value="${i }"/></a>
					</li>
				</c:if>
			</c:forEach>

			<c:if test="${paging.nextBlock <=paging.pageCount }">
				<li class="page-item">
				<a class="page-link" href="/spaceDetail/qnalist?cpage=<c:out value="${paging.nextBlock }"/>">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	</div>
</div>

</div>




<script>
const qna_write=function(){
	$.ajax({
		type:'post',
		url:'/space/spaceDetail/qnawrite',
		dataType:'html',
		cache:false,
		success:function(res){
			$('#body_change_qna').html("");
			$('#body_change_qna').html(res);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}

const qna_rewrite=function(qnum){
	alert(qnum);
	$.ajax({
		type:'post',
		url:'/space/spaceDetail/qnarewrite',
		data:qnum,
		cache:false,
		success:function(res){
			$('#nav4_re').html("");
			$('#nav4_re').html(res);
			$('#qnum').val(qnum);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}

const delete_qnum=function(ss,qp){
	//alert(snum);
	//let qn=$('#qna_qnum').html();
	//alert(qn);
	//var qp=$('#check_qpwd').val()
	//alert(qp);
	//alert(ss);
	var text=prompt('비밀번호를 입력해주세요');
	//document.write("</h4>"+text+"</h4>");
	//alert(text);
	data={
		qnum:ss,
		qpwd:text
	}
	if(text==qp){
		$.ajax({
			type:'post',
			url:'/space/spaceDetail/qnadelete',
			data:data,
			cache:false,
			success:function(res){
				//alert(res);
				//if(res>0){
				alert('글이 삭제되었습니다')
				location.reload();
				//}
					//alert('비밀번호가 일치하지 않습니다')
					//window.location.replace();
				//}
			},
			error:function(err){
				alert('err: '+err.status);
				location.reload();
			}
		});
	}else if(text==null){
		alert('비밀번호를 입력해주세요');
		location.reload();
	}else if(text!=qp){
		alert('비밀번호가 일치하지 않습니다');
		location.reload();
	}
}
</script>