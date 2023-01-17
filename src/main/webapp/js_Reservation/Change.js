	function change(){
		var stringHtml =document.body.innerHTML; //document.getElementById('changeLang').innerHTML;
		alert(stringHtml);
		
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
