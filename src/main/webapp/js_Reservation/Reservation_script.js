
$(document).ready(function(){
    select_time();
    
});

function select_time(){
	var $startTime=$('#startTime');
	var $endTime=$('#endTime');
	$startTime.timepicker({
    	timeFormat: 'HH:mm',
        interval: 60,
        startTime: '00:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true,
        onShow:function(ct){
        	this.setOptions({
        		maxTime:$endTime.val()?$endTime.val():false
        	})
        }
    });

    
    $endTime.timepicker({
    	timeFormat: 'HH:mm',
        interval: 60,
        startTime: '00:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true,
        onShow:function(ct){
        	this.setOptions({
        		minTime:$startTime.val()?$startTime.val():false
        	})
        }
    });

}


const bookingCal=function(yy,mm){
	$.ajax({
		type:'get',
		url:'ReservationAjax?year='+yy+'&month='+mm,
		dataType:'html',
		success:function(res){
			$('#bookingCalendar').html("");
			$('#bookingCalendar').html(res);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}


const aa=function(yy,mm,dd){
	$('#check_month').html("");
	$('#check_month').html(mm);
	$('#check_date').html("");
	$('#check_date').html(dd);
	
	$('#check_year2').html("");
	$('#check_year2').html(yy);
	$('#check_month2').html("");
	$('#check_month2').html(mm);
	$('#check_date2').html("");
	$('#check_date2').html(dd);
}


