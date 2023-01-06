<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/Spacetop" />

<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">1. 회원아이디로 예약 내역 가져오기(언제 어디에 포인트 사용했는지)
					2. 회원아이디로 포인트 충전 내역 가져오기 3. 포인트 충전 - 포인트테이블</h1>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12">
				<form name="orderF" id="orderF" action="order">
					<table class="table table-striped">
						<thead>
							<tr class="info text-center">
								<th>상품번호</th>
								<th>상품명</th>
								<th>수량</th>
								<th>단가</th>
								<th>금액</th>
								<th>삭제</th>
							</tr>
						</thead>

						<c:choose>
							<c:when test="${cartArr eq null or empty cartArr}">
								<tr>
									<td colspan="6"><b>장바구니에 담긴 상품이 없습니다</b></td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="cvo" items="${cartArr}" varStatus="state">
									<tr>
										<td><label> <input type="checkbox" name="pnum"
												id="pnum${state.index}" value="${cvo.pnum_fk}">
												${cvo.pnum_fk}
										</label></td>

										<td>
											<h4>${cvo.pname}</h4> <br> <a
											href="../prodDetail?pnum=${cvo.pnum_fk}" target="_blank">
												<img src="../resources/product_images/${cvo.pimage1}"
												class="img-thumbnail" style="width: 140px">
										</a>
										</td>

										<td><input type="number" name="oqty"
											id="oqty${state.index}" value="${cvo.oqty}" min="1" max="50"
											size="3">
											<button type="button" class="btn btn-success"
												onclick="cartEdit('${cvo.cartNum}','${state.index}')">수정</button>
										</td>

										<td><fmt:formatNumber value="${cvo.saleprice}"
												pattern="###,###" />원<br> <span
											class="badge badge-danger">${cvo.point}</span>POINT</td>

										<td><fmt:formatNumber value="${cvo.totalPrice}"
												pattern="###,###" />원<br> <span
											class="badge badge-danger">${cvo.totalPoint}</span>POINT</td>

										<td><a href="#" onclick="cartDel('${cvo.cartNum}')">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>

						<tr>
							<td colspan="3">
								<h5>
									장바구니 총 액: <span class="text-danger"> <fmt:formatNumber
											value="${cartTotal.cartTotalPrice}" pattern="###,###" /> 원
									</span>
								</h5>
								<h5>
									장바구니 총포인트: <span class="text-success">
										${cartTotal.cartTotalPoint} POINT</span>
								</h5>
							</td>

							<td colspan="3">
								<button type="button" onclick="goOrder()"
									class="btn btn-outline-info">주문하기</button> <!-- form tag안에 버튼이 있으면 default 로 submit ==> order.jsp -->
								<button type="button" class="btn btn-outline-warning"
									onclick="location.href='../index'">계속쇼핑</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<c:import url="/Spacefoot" />