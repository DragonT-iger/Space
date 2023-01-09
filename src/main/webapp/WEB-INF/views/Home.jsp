<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/Spacetop.jsp" %>

<style>
.text{
text-align:center;
font-family:'Heebo';
}
.flex-container{
	display:flex;
	flex-wrap:wrap;
	justify-content: flex-start;
}
.flex-item{
	background-color:lightgray;
	width:21%; 
	margin:2%;
}

.img{
width:100%;
height:200px;
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
    <div class="search_area text-center">
        <input type="text" id="keyword" name="keyword" value="" style="width:25%">
        <button class="btn btn-primary" onclick="listPaging('search')">Search</button>
    </div>
</div>  


<section class="padding80 margin50">
		<div id="space-list" class="flex-container">
				<c:forEach var="Space" items="${spaceArr}">
				<div id="space-item" class="flex-item">
					<a href="spaceDetail?snum=${Space.snum}">
						<img class="img" alt="" src="resources/SpaceInfoImg/${Space.simage1}"/>
					</a>
					<p class="text">${Space.sname}</p>
					<p class="text">${Space.saddr1}</p>
					<p class="text">${Space.saddr2}</p>
				</div>
				</c:forEach>
		</div>
		<div class="text-center">
			<span><button class="btn btn-primary" onclick="listPaging('prev')">이전</button></span>
			<span><button class="btn btn-primary" onclick="listPaging('next')">다음</button></span>
		</div>
</section>
<a href="http://pf.kakao.com/_xnHWixj">카톡</a>
<form>
	<input type="hidden" id="currentPage"/>
</form>


<script>
	  //초기값 (전역변수) 세팅
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
    	  keyword=$('#keyword').val();
    	  $.ajax({
			type:'get',
			url:'home',
			contentType:'application/json',
			data:{ //get파라미터로 넘어가는 key:value 값 
					//home?currentPage=value&pagingType=value&keyword=value (url+data)
				currentPage : currentPage,
				pagingType : pagingType,
				keyword : keyword
			},
    	  cache:false,
    	  success :function (res){
    		  currentPage = res.currentPage;
    		  alert(currentPage);
    		  alert(res.spaceArr);
    		  if(res.spaceArr==""||res.spaceArr==null){ //res값이 없을시
    			  alert("검색결과가 없습니다.");
    		  }else{
    		  	showSpace(res.spaceArr);
    		  }
    	  },
    	  error: function (err){
    		  alert("error"+err.status) //
    	  }
    	  });
	  }
      
      const showSpace = function(res){
    	  if(res==null){
    		  $('#space-list').html("결과가 없습니다");
    	  }else{
    		  let str="";
	    	  $.each(res,function(i,spacevo){
	    		  	str+='<div id="space-item" class="flex-item">';
	    		  	str+='<a href="spaceDetail?snum='+spacevo.snum+'">';
	    		  	str+='<img class="img" alt="" src="resources/SpaceInfoImg/'+spacevo.simage1+'"/>';
	    		  	str+='<p class="text">'+spacevo.sname+'</p>';
	    		  	str+='<p class="text">'+spacevo.saddr1+'</p>';
	    		  	str+='<p class="text">'+spacevo.saddr2+'</p>';
	    		  	str+='</a>';
	    		  	str+='</div>';
      	  	});
    	  $('#space-list').html(str);
      	}
    }
</script>
<%@ include file="/WEB-INF/views/Spacefoot.jsp" %>