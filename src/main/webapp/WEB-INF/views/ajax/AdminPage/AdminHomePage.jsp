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
	<div class="article">
		<h2></h2>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
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
		    			  <td>\${todayPopSpace.h_code}</td>
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
			url:'databydate',
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
					console.log("month==>"+(res.month-1));
 					arr.push([date , res.joincount, res.rescount]);
					//arr.push([date ,1, 1]);
					//alert("배열에 닮을값 확인==>"+res.year+","+res.month+","+res.day+","+res.joincount+","+res.rescount);
				});
				//console.log("test log ==>"+arr[0]);
				google.charts.setOnLoadCallback(drawChart(arr));
			},
			error: function(err){
				alert("err"+err.status);
			}
		});
		
		function drawChart(res) {
			  console.log(res);
		      var data = new google.visualization.DataTable();
		      data.addColumn('date');
		      data.addColumn('number', '가입자 수');
		      data.addColumn('number', '예약 횟수');
			  //let rows = res;
			  console.log(res);
		      /* data.addRows([
		        [new Date(2023, 0, 1),  2, 5],
		        [new Date(2023, 0, 2),  1, 6],
		        [new Date(2023, 0, 3),  4, 7],
		        [new Date(2023, 0, 4),  6, 8],
		        [new Date(2023, 0, 5),  3, 6],
		        [new Date(2023, 0, 6),  8, 3],
		        [new Date(2023, 0, 7),  7, 2],
		        [new Date(2023, 0, 8),  1, 9],
		        [new Date(2023, 0, 9),  6, 4],
		        [new Date(2023, 0, 10), 2, 3],
		        [new Date(2023, 0, 11), 5, 7],
		        [new Date(2023, 0, 12), 6, 8],
		        [new Date(2023, 0, 13), 4, 6],
		        [new Date(2023, 0, 14), 4, 2]
		      ]);  */
		      data.addRows(res);

		      var options = {
		        height: 400,
		        axes: {
		          x: {
		            0: {side: 'foot'}
		          }
		        }
		      };

		      var chart = new google.charts.Line(document.getElementById('graphchart'));

		      chart.draw(data, google.charts.Line.convertOptions(options));
		    }
		
	}
    
</script>
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageFoot.jsp" %>
<%-- <c:import url="/AdminPageFoot" charEncoding="utf-8"/> --%>