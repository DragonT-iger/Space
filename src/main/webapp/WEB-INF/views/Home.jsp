<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/Spacetop.jsp" %>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

<script type="text/javascript">
	  var currentPage = 1;
	  var keyword = "";
	  /* function filter(){

	        var value, name, item, i;

	        value = document.getElementById("value").value.toUpperCase();
	        item = document.getElementsByClassName("item");

	        for(i=0;i<item.length;i++){
	          name = item[i].getElementsByClassName("name");
	          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
	            item[i].style.display = "flex";
	          }else{
	            item[i].style.display = "none";
	          }
	        }
	      } */

      const listPaging= function(pagingType){
    	  if(currentPage=="" || currentPage==null){
    		  alert("값없음에 들어옴")
    		  currentPage = 1;
    	  }
    	  $.ajax({
			type:'get',
			url:'home',
			contentType:'application/json',
			data:{
				currentPage : currentPage,
				pagingType : pagingType,
				keyword : keyword
			},
    	  cache:false,
    	  success :function (res){
    		  currentPage = res.currentPage;
    	  },
    	  error: function (err){
    		  alert("error"+err.status)
    	  }
    	  });
      }
	  
      const searchSpace= function(){
    	  keyword=$('#keyword').val();
    	  //alert(keyword);
    	  $.ajax({
    		  type:'get',
    		  data:"keyword="+keyword,
    		  url:'search',
    		  contentType:'json',
    		  cache:false,
    		  success:function(res){
    			  alert(JSON.stringify(res));
    		  },err:function(err){
    			  alert(err.status);
    		  }
    	  });
      }
      
      const showSpace = function(){
    	  
      }
</script>
</head>

<style>

.text{
text-align:center;
font-family:'Heebo';

}


.img{
width:300px;
height:200px;
padding: 10px;
margin: auto;

text-align:center;
}
.padding80 {
	padding: 10px;
}

.margin50 {
	margin: 10px;
}

@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

.tag {
	font-family: 'Lobster', cursive;
	font-weight: 30;
	text-align: center;
	margin: 20px;
	padding: 20px;
}

.choice {
	text-align: center;
}

.searchbox {
	width: 50%;
	margin: 10px auto;
}

.header {
	background: #ECDFBF;
	overflow: hidden;
	padding: 20px;
	text-align: center;
}

.header h1 {
	text-transform: uppercase;
	color: white;
	margin: 0;
	margin-bottom: 8px;
}

#value {
	border: none;
	background: #E0D3B6;
	padding: 6px;
	font-size: 18px;
	width: 80%;
	border-radius: 6px;
	color: white;
	text-align:center;
}

#value:focus {
	outline: none;
}

.search {
	background: #FFFFF5;
	padding: 1%;
}

.name {
	font-size: 17px;
	font-weight: 470;
	color: #333;
}
</style>



	<div class="tag" 
		class="section-title ff-secondary text-start text-primary fw-normal mb-4">
		<a href="#" class="tag">#Christmas</a> <a href="#" class="tag">#Winter</a>


		<a href="#" class="tag">#Travel</a> <a href="#" class="tag">#New
			Year</a>
	</div>



<div class="search_wrap">
        <div class="search_area">
            <input type="text" id="keyword" name="keyword" value="">
            <button onclick="searchSpace()">Search</button>
        </div>
    </div>  


<section class="padding80 margin50">
		<ul id="spacelist" class="items quarter">

			<br>
			<br>
			<span><button onclick="listPaging('prev')">이전</button></span>
			
			<table>
				<tr>
					<c:forEach var="Space" items="${spaceArr}">
					<td>
					<a href="/spacedetail?snum=${Space.snum}">
					<img class="img" alt=""
						src="resources/SpaceInfoImg/${Space.simage1}"
						  /></a>
						<p class="text">${Space.sname}</p>
						</td>
					</c:forEach>
				<tr>
			</table>
		<span><button onclick="listPaging('next')">다음</button></span>
		</ul>
	</section>
	<a href="http://pf.kakao.com/_xnHWixj">카톡</a>
	<form>
		<input type="hidden" id="currentPage"/>
	</form>


<%@ include file="/WEB-INF/views/Spacefoot.jsp" %>