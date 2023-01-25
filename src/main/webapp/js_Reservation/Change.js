	function change(){
		var stringHtml =document.body.innerHTML; //document.getElementById('changeLang').innerHTML;
		//alert(stringHtml);
		
		$.ajax({
			type:'post',
			url:'/space/changeLang',
			data:{
				html: stringHtml,
			},
			dataType:"html",
			success : function(res){
				$('body').html("");
				$('body').html(res);
			},
			error: function(err){
				alert("실패!"+err.status);
			}
		});
	}
	
	function changeToggle(){
		//alert("click toggle");
		$.ajax({
			type:'get',
			url:'/space/changeToggle',
			success : function(res){
				if(res=="true"){
					//alert("영어번역하겠습니다");
					change();
				}else{
					//alert("번역취소");
					location.reload();
				}
			},
			error: function(err){
				alert(err.status);
			}
		});
	}
