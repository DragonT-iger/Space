<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="s_revw">
<div id="revw_question">
	<div id="revw_head">
		<h4>Review
			<strong>${paging.totalCount}</strong>
		</h4>
	</div>
	
	<div id="body_change">
	<div class="qna_body">
		<ul class="qna_list">
		
		<c:if test="${reviewArr eq null or empty reviewArr}">
			<div>
				<span><b>아직 등록된 리뷰가 없습니다.</b></span>
			</div>
		</c:if>
		
		<c:if test="${reviewArr ne null or not empty reviewArr}">
		<c:forEach var="review" items="${reviewArr}">
			<li class="review">
				<div class="box">
					<p>${review.review_num}</p>
					<!-- 답변레벨에 따라 들여쓰기 -->
					<c:if test="${review.rlevel>0}">
					<c:forEach var="k" begin="0" end="${review.rlevel}">
						&nbsp;&nbsp;
					</c:forEach>
					</c:if>
					<strong class="user_name">${review.userid}</strong>
					<p>${review.rscore}</p>
					<p>${review.rdate}</p>
					<p>${review.rtitle}</p>
					<p>${review.rcontent}</p>
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
