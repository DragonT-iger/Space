<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="s_qna">
<div id="qna_question">
	<div id="qna_head">
		<h4>Q&A
			<strong>${paging.totalCount}</strong>
		</h4>
		<a class="btn_qna_write">
			<span onclick="qna_write()">질문 작성하기</span>
		</a>
	</div>
	
	<div id="body_change">
	<div class="qna_body">
		<ul class="qna_list">
		
		<c:if test="${qnaArr eq null or empty qnaArr}">
			<tr>
				<td colspan="3"><b>아직 등록된 질문이 없습니다.</b></td>
			</tr>
		</c:if>
		
		<c:if test="${qnaArr ne null or not empty qnaArr}">
		<c:forEach var="qna" items="${qnaArr}">
			<li class="qlist">
				<div class="box">
					<div id="qna_qnum">${qna.qnum}</div>
					<span onclick="delete_qnum()">x</span>
					<input id="check_qpwd" type="text" value="${qna.qpwd}">
					<!-- 답변레벨에 따라 들여쓰기 -->
					<c:if test="${qna.qlevel>0}">
					<c:forEach var="k" begin="0" end="${qna.qlevel}">
						&nbsp;&nbsp;
					</c:forEach>
					</c:if>
					<div class="user_name">${qna.userid}</div>
					<p>${qna.qtitle}</p>
					<p>${qna.qcontent}</p>
					<p>${qna.qdate}</p>
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
			$('#s_qna').html("");
			$('#s_qna').html(res);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}

const delete_qnum=function(){
	let qn=$('#qna_qnum').html();
	//alert(qn);
	var qp=$('#check_qpwd').val()
	//alert(qp);
	var text=prompt('비밀번호를 입력해주세요');
	document.write("</h4>"+text+"</h4>");
	//alert(text);

	data={
		qnum:qn,
		qpwd:text
	}
	
	if(text==qp){
		$.ajax({
			type:'post',
			url:'/space/spaceDetail/qnadelete',
			data:data,
			cache:false,
			suceess:function(res){
				if(res.result>0){
					console.log('success');
					console.log(res);
				}else{
					alert('Fail');
				}
			},
			error:function(err){
				alert('err: '+err.status);
			}
		});
	}else{
		alert('Fail');
	}
	qna_write();
}
</script>