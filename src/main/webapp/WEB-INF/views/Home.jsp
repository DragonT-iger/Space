<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/Spacetop.jsp"%>





<style>
.text {
	text-align: center;
	font-family: 'Heebo';
}

.flex-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.flex-item {
	background-color: lightgray;
	width: 21%;
	margin: 2%;
}

.img {
	width: 100%;
	height: 200px;
	margin: auto;
	text-align: center;
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
	text-align: center;
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


.community-page-area{
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
	
	.community-page {
		display: flex;
		aling-items: center;
		justify-content: center;
		font-size: 16px;
		width: 25px;
		border: 3px solid gainsboro;
		cursor: pointer;
		
	&.active{
		font-weight: bold;
		background-color: gainsboro;
		color: white;
	}
	}
}
</style>



<div class="tag"
	class="section-title ff-secondary text-start text-primary fw-normal mb-4">
	<c:forEach var="hashtag" items="${hashtag}">
		<input type="hidden" id="hashTag" name="hashTag" value="on_off"
			style="width: 25%">
		<button class="btn btn-primary"
			onclick="gethashTag(${hashtag.h_code})">${hashtag.h_name}</button>
	</c:forEach>





</div>






<div class="search_wrap">
	<div class="search_area text-center">
		<input type="text" id="keyword" name="keyword" value=""
			style="width: 25%">
		<button onclick="listPaging('search')">Search</button>
		<button type="button"
			onclick="location.href='http://localhost:8080/space/'">초기화</button>
	</div>
</div>


<section class="padding80 margin50">
	<div id="space-list" class="flex-container">
		<c:forEach var="Space" items="${spaceArr}">
			<div id="space-item" class="flex-item">
				<a href="spaceDetail?snum=${Space.snum}"> <img class="img"
					alt="" src="resources/SpaceInfoImg/${Space.simage1}" />
				</a>
				<p class="text">${Space.sname}</p>
				<p class="text">${Space.saddr1}</p>
				<p class="text">${Space.saddr2}</p>
			</div>
		</c:forEach>
	</div>
	<div class="text-center">
		<span><button class="btn btn-primary"
				onclick="listPaging('prev')">이전</button></span>
				render(){
					return(
						<div class='community-page-area'>
							{this.renderPage()}
						</div>
					)
				}
				<span><button
				class="btn btn-primary" onclick="listPaging('next')">다음</button></span>
	</div>
</section>
<a href="http://pf.kakao.com/_xnHWixj">카톡</a>
<form>
	<input type="hidden" id="currentPage" />
	<div>
		<ul class="" id="pages"></ul>
	</div>
</form>


<script>
	  //초기값 (전역변수) 세팅
	  var currentPage = 1;
	  var keyword = "";
	  var HashTag = "";
	 
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
    	  alert("해시태그 확인==>"+HashTag);
    	  keyword=$('#keyword').val();
    	  alert(keyword);
    	  $.ajax({
			type:'get',
			url:'home',
			contentType:'application/json',
			data:{ //get파라미터로 넘어가는 key:value 값 
					//home?currentPage=value&pagingType=value&keyword=value (url+data)
				currentPage : currentPage,
				pagingType : pagingType,
				keyword : keyword,
				HashTag : HashTag
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
	      
	      const flag = "";//flag 현재 해시태그가 놀려있는 여부
	      const target="";//target 직전에 눌린 해시태그의 primary key
	    
	      
/* 	      const pageGroup = 1
	      const pageCount = 8
	      const totalPage = 13

	      let lastNumber = pageGroup * pageCount // 8
	      if (lastNumber > totalPage) {
	        lastNumber = totalPage
	      }
	      let firstNumber = lastNumber - (pageCount - 1) // 1

	      const next = lastNumber + 1 // 9
	      const prev = firstNumber - 1 // 0

	      // 1~5만큼 페이지네이션 그려줌
	      for (let i = firstNumber; i <= lastNumber; i++) {
	        html += `<button class="pageNumber" id="page_${i}">${i}</button>
	      }
	    	 */
	    
	      
/* 	    	 function paging(totalData, currentPage){
	    	 const dataPerPage=13;
	    	 const pageCount=8;
	    	 
	    	 //console.log("curentPage : " + currentPage);
	    	 //console.log("totalData : " + totalData);
	    	 
	    	 const totalPage = Math.ceil(totalData / dataPerPage); //총페이지 수
	    	 const pageGroup = Math.ceil(currentPage / pageCount);// 페이지 그룹
	    	 
	    	 //console.log("pageGroup : "+pageGroup);
	    	 //console.log("total : "+totalPage);
	    	 
	    	 let last =pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	    	 if(last>totalPage)
	    		 last = totalPage;
	    	 let first = last - (pageCount -1); //화면에 보여질 첫번째 페이지 번호
	 		 const next = last +1;
	    	 const prev = first -1;
	    	 
	    	 //console.log("last : "+ last);
	    	 //console .log("first : "+ first);
	    	 
	    	 if(total Page < 1){
	    		first = last;
	    		
	    	 }
	    	 const pages = ${"#showSpace"};
	    	 pages.empty();
	    	 if (first > ) 
	    	 
	   }*/
	   
	   
	   
	   const pageLength = Math.ceil(totalItem / itemPerPage)
	   
	   get Data =() =>{
		   const {currentPage, itemPerPage, totalItem, DataList} =this.sta
		   console.log(currentPage)
		   axios.get('http://url?offset=${currentPage}&limit=${itemPerPage}')
		   .then(response => {
			   this.setState({
				   DataList: response.data.list,
				   totalItem: response.data.count
			   })
		   })
		   .catch(error => {
			   console.log(error)
		   })
	   }
	 				
	    	 
	    	//총 페이지 수 랜더
	    	
	    	renderPage =() ->{
	    		const {totlaItem, itemPerPage, currentPage}=this.state
	    		const pageLength=Math.ceil(totalItem/ itemPerPage)
	    		const pageNumbers = []
	    		for (let i =0; i< pageLength; i++){
	    			pageNumbers.push(i)
	    		}
	    		return pageNumbers.map(item => {
	    			return(
	    				<span>
	    					className={`community-page ${(item === currentPage ? 'active' : '')}`}
	    					onClick={()=>this.handlePageNumberClicked(item)}>
	    					{item+1}
	    				</span>
	    			)
	    		})
	    		
	    	}
	 	     
	      
	    
	      
	      const gethashTag= function(hashTag2){
	    	  HashTag = hashTag2;
	    	  $.ajax({
				type:'get',
				url:'hashTag', //control 주소
				contentType:'application/json',
				data:{ //get파라미터로 넘어가는 key:value 값 
						//home?currentPage=value&pagingType=value&keyword=value (url+data)
					hashTag : hashTag2
				},
	    	  cache:false,
	    	  success :function (res){
	    		  
	    		  alert(JSON.stringify(res));
					showSpace(res);
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
<%@ include file="/WEB-INF/views/Spacefoot.jsp"%>