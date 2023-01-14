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
.today-news,.today-pop{
	width:50%;
	height:400px;
	/* background-color:skyblue; */
}
.today-news{
	display:flex;
}
.today-news> div{
	width:50%;
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
		<div id="popspacelist">
		</div>
	</div>
	<div class="article today-news text-center">
		<div>
			<h2>금일 가입자</h2>
			<div id="todayJoin">
			</div>
		</div>
		<div>
			<h2>금일 등록 공간</h2>
			<div id="todaySpaceInsert">
			</div>
		</div>
	</div>
	<div class="article">
		<h2></h2>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('date', '날짜');
      data.addColumn('number', '예약 횟수');
      data.addColumn('number', '가입자 수');

      data.addRows([
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
      ]);

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
    
    window.onload= function(){
    	let tjm=`<p>오늘가입자명단<p>`;
		let tis=`<p>금일 등록 공간<p>`;
		let tps=`<p>오늘의 인기 공간<p>`;
		$.ajax({
			type:'get',
			url:'getTodayData',
			data:'json',
	    	cache:false,
	    	success :function (res){
	    		  alert(JSON.stringify(res.todayJoinMem));
	    		  alert(JSON.stringify(res.todayInsSpace));
	    		  alert(JSON.stringify(res.todayPopSpace));
	    		  $.each(res.todayJoinMem,function(i,todayJoinMem){
	    		  tjm+=`
	    		  	  <p>
	    			  \${todayJoinMem.mname} / \${todayJoinMem.userid} / \${todayJoinMem.birth}
	    			  <p>
	    		  `
	    		  });
	    		  $.each(res.todayInsSpace,function(i,todayInsSpace){
		    		  tis+=`
		    		  	  <p>
		    			  \${todayInsSpace.sname} / \${todayInsSpace.saddr1} / \${todayInsSpace.h_name}
		    			  <p>
		    		  `
		    	  });
	    		  $.each(res.todayPopSpace,function(i,todayPopSpace){
		    		  tps+=`
		    		  	  <p>
		    			  \${todayPopSpace.sname} / \${todayPopSpace.saddr1} / \${todayPopSpace.rcount} 
		    			  <p>
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
	}
    
  </script>
<%@ include file="/WEB-INF/views/ajax/AdminPage/AdminPageFoot.jsp" %>
<%-- <c:import url="/AdminPageFoot" charEncoding="utf-8"/> --%>