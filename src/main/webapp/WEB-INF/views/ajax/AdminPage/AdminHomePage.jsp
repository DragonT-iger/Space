<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/Spacetop.jsp" %>
<c:set var="myctx" value="${pageContext.request.contextPath }"/>
<style>
.admincontainer{
	display:flex;
	flex-wrap:wrap;
	justify-content: flex-start;
}
#content-nav{
	width:20%;
	margin:2%;
}
#content-wrap{
	width:80%;
	height:1000px;
}
</style>

<div class="admincontainer" style="width:220px;" >
	<div id="content-nav">
		<c:import url="/admin/adminpage"/>
	</div>
	<div id="content-wrap">
		<c:import url="/admin/userlist"/>
	</div>
</div>
<%@ include file="/WEB-INF/views/Spacefoot.jsp" %>
<%-- <c:import url="/Spacefoot" charEncoding="utf-8"/> --%>