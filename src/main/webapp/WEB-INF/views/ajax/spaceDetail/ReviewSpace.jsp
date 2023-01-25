<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #ff4500;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: #ff4500;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}			

.sizes,.leftr{
	font-size:1px;
}
.reviewList{
	background-color:#fdf5e6;
}
.reviewrList{
	background-color:#FFEFD5;
}
.box{
overflow:hidden;
padding:10px 10px 5px 10px;
}

.sizes{
		font-size:15px;
font-weight:bolder;
padding:20px 20px 10px 20px;
}

.star{
padding:0px 0px 20px 20px;
}

.title{
font-weight:bold;
	display: inline-block;
	padding:0px 10px 20px 20px;
}

.content{
font-weight:bold;

	padding:0px 10px 20px 20px;
}
</style>

<div id="s_revw">
<div id="revw_question">
	<div id="revw_head">
		<h4 class="fa-solid fa-meteor"> Review
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
		<c:set var="w" value="0"/>
		<c:forEach var="review" items="${reviewArr}">
		<c:set var="w" value="${review.rscore*20}"/>
			<li class="reviewList">
			<!-- 답변레벨에 따라 색상 변경 -->
			<c:if test="${review.rgorder>0}">
				<li class="reviewrList">
			</c:if>
			
				<table class="box">
					<tr>
						<td class="sizes" >${review.review_num}. &nbsp;&nbsp;&nbsp;${review.review_date}&nbsp;&nbsp;&nbsp;&nbsp${review.userid}</td>
						<td colspan="3">
						<c:if test="${sdvo.userid eq loginUser.userid}">
							<c:if test="${review.rgorder<1}">
								<span class="leftr btn btn-primary" onclick="review_rewrite()">답변 작성하기</span>
							</c:if>
						</c:if>
						</td>
					</tr>
					
					<tr>
						<td class="star"colspan="2">
							<div class="star-ratings">
								<div class="star-ratings-fill space-x-2 text-lg" style="width:${w}%">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-base space-x-2 text-lg">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
							</div>
						</td>
					
					</tr>
					
					<c:if test="${review.rimage1 ne null or review.rimage2 ne null}">
					<tr>
						<td rowspan="5" colspan="3">
							<img class="review_img" src="../resources/SpaceInfoImg/${review.rimage1})"></img>
						</td>
						<td rowspan="5" colspan="3">
							<img class="review_img" src="../resources/SpaceInfoImg/${review.rimage2})"></img>
						</td>
					</tr>
					</c:if>

					<tr>
						<td class="title"colspan="6">${review.rtitle}</td>
					</tr>
					
					<tr>
						<td class="content"colspan="6">${review.rcontent}</td>
					</tr>
				</table>
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
const review_rewrite=function(qnum){
	$.ajax({
		type:'post',
		url:'/space/spaceDetail/qnarewrite',
		data:qnum,
		cache:false,
		success:function(res){
			$('#nav3_re').html("");
			$('#nav3_re').html(res);
			$('#qnum').val(qnum);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}

</script>
