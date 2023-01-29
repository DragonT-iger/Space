<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageTop.jsp" %>
<c:set var="myctx" value="${pageContext.request.contextPath }"/>
<style>
#admin-home{
	display:flex;
	flex-wrap:wrap;
	justify-content: flex-start;
}
.graph{
	width:100%;
	height:500px;
	/* background-color:lightgray; */
}
.article {
	padding:5px;
}
.today-news{
	height:400px;
	/* background-color:skyblue; */
}
.today-pop{
	width:40%;
	border: 1px solid lightgray;
}
.today-news{
	width:30%;
	border: 1px solid lightgray;
}
</style>
<div class="container mt-3" id="admin-home">
	<div class="article graph text-center">
		<h2 class="">날짜별 예약 횟수 및 가입자 수</h2>
		<button onclick="databydate('rescount')">날짜별예약횟수</button>
		<button onclick="databydate('joincount')">날짜별가입자수</button>
		<div id="graphchart">
		</div>
	</div>
	<div class="article today-pop text-center">
		<h2>오늘의 인기 공간</h2>
		<table class="table table-table-bordered" id="popspacelist">
		</table>
	</div>
	<div class="article today-news text-center">
		<h2>금일 가입자</h2>
		<table class="table table-table-bordered" id="todayJoin">
		</table>
	</div>
	<div class="article today-news text-center">
		<h2>금일 등록 공간</h2>
		<table class="table table-table-bordered" id="todaySpaceInsert">
		</table>
	</div>
	<div class="article graph text-center">
		<h2>해시태그별 예약횟수</h2>
		<div id="DataHashTagChart">
		</div>
	</div>
	
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/space/js_datachart/googleChart.js"></script>
<script>
      google.charts.load('current', {'packages':['line','corechart','bar']});
      //google.charts.setOnLoadCallback(drawChart);
    	window.onload = function(){
    	let tjm=`<tr>
			  			<th>이름</th>
			  			<th>나이</th>
			  			<th>연락처</th>
			  	  </tr>`;
		let tis=`<tr>
			  			<th>공간명</th>
			  			<th>주소</th>
			  			<th>해시태그명</th>
			  	  </tr>`;
		let tps=`<tr>
			  			<th>공간명</th>
			  			<th>주소</th>
			  			<th>해시태그명</th>
			  			<th>예약횟수</th>
			  	  </tr>`;
		$.ajax({
			type:'get',
			url:'getTodayData',
			dataType:'json',
	    	cache:false,
	    	async : false,
	    	success :function (res){
	    		  //alert(JSON.stringify(res.todayJoinMem));
	    		  //alert(JSON.stringify(res.todayInsSpace));
	    		  //alert(JSON.stringify(res.todayPopSpace));
	    		  $.each(res.todayJoinMem,function(i,todayJoinMem){
	    		  tjm+=`
	    		  	  <tr>
	    			  <td>\${todayJoinMem.mname}</td>
	    			  <td>\${todayJoinMem.birth}</td>
	    			  <td>\${todayJoinMem.hp}</td>
	    			  </tr>
	    		  `
	    		  });
	    		  $.each(res.todayInsSpace,function(i,todayInsSpace){
		    		  tis+=`
		    			  <tr>
		    			  <td>\${todayInsSpace.sname}</td>
		    			  <td>\${todayInsSpace.saddr1}</td>
		    			  <td>\${todayInsSpace.h_name}</td>
		    			  </tr>
		    		  `
		    	  });
	    		  $.each(res.todayPopSpace,function(i,todayPopSpace){
		    		  tps+=`
		    			  <tr>
		    			  <td>\${todayPopSpace.sname}</td>
		    			  <td>\${todayPopSpace.saddr1}</td>
		    			  <td>\${todayPopSpace.h_name}</td>
		    			  <td>\${todayPopSpace.rescount}</td>
		    			  </tr>
		    		  `
		    	  });
	    		  $('#popspacelist').html(tps);
	    		  
	    		  $('#todayJoin').html(tjm);
	    		  
	    		  $('#todaySpaceInsert').html(tis);
	    	},
	    	error: function (err){
	    		alert("error"+err.status) //
	    	}
    	  });
		
		
		$.ajax({
			tpye:'get',
			url:'databydate?data=joincount',
			dataType:'json',
			cache:false,
			async : false,
			success: function(res){
				//alert(JSON.stringify(res));
				let arr = [];
				$.each(res,function(i,res){
					/* [new Date(2023, 0, 1),  2, 5] < Sample array data type */
					//alert(res.year+"/"+res.month);
					let date = new Date(res.year , res.month-1 , res.day);
					//console.log("month==>"+(res.month-1));
 					arr.push([date , res.rescount]);
					//arr.push([date ,1, 1]);
					//alert("배열에 닮을값 확인==>"+res.year+","+res.month+","+res.day+","+res.joincount+","+res.rescount);
				});
				//console.log("test log ==>"+arr[0]);
				google.charts.setOnLoadCallback(drawLineChart(arr,"joincount"));
			},
			error: function(err){
				alert("err"+err.status);
			}
		});
		
		$.ajax({
			tpye:'get',
			url:'databyHashTag',
			dataType:'json',
			cache:false,
			success:function(res){
				let arr = [];
				$.each(res,function(i,res){
					arr.push([res.hashTagName , res.rescount]);
					console.log(res.hashTagName + "/" + res.rescount);
				});
				google.charts.setOnLoadCallback(drawColumnsChart(arr));
			},
			error: function(err){
				alert("err"+err.status);
			}
		});
	}
    function databydate(data){
    	
    	$.ajax({
			tpye:'get',
			url:'databydate?data='+data,
			dataType:'json',
			cache:false,
			async : false,
			success: function(res){
				//alert(JSON.stringify(res));
				let arr = [];
				$.each(res,function(i,res){
					/* [new Date(2023, 0, 1),  2, 5] < Sample array data type */
					//alert(res.year+"/"+res.month);
					let date = new Date(res.year , res.month-1 , res.day);
					//console.log("month==>"+(res.month-1));
 					arr.push([date ,res.rescount]);
					//arr.push([date ,1, 1]);
					//alert("배열에 닮을값 확인==>"+res.year+","+res.month+","+res.day+","+res.joincount+","+res.rescount);
				});
				//console.log("test log ==>"+arr[0]);
				google.charts.setOnLoadCallback(drawLineChart(arr,data));
			},
			error: function(err){
				alert("err"+err.status);
			}
		});
    }
</script>
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageFoot.jsp" %>
<%-- <c:import url="/AdminPageFoot" charEncoding="utf-8"/> --%>