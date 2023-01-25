	function change(){
		var stringHtml =document.body.innerHTML; //document.getElementById('changeLang').innerHTML;
		
		
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
		$.ajax({
			type:'get',
			url:'/space/changeToggle',
			success : function(res){
				if(res=="true"){
					change();
				}else{
					location.reload();
				}
			},
			error: function(err){
				alert(err.status);
			}
		});
	}
