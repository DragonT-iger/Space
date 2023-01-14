<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="modal" id="UserHistoryModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		
			<div class="modal-header">
			<h4 class="modal-title">유저 이용내역</h4>
			<button type="button" class="close" data-dismiss="modal">X</button>
			</div>
		
			<div class="modal-body">
				<table class="table table-bordered" id="historyitem">
					
				
				</table>
				<div id="SumTotalPrice">
				</div>
			</div>
		
			<div class="modal-footer">
			
			<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			
			</div>
		
		</div>
	
	</div>

</div>