function drawLineChart(res,target) {
	//console.log(res);
	var data = new google.visualization.DataTable();
	data.addColumn('date');
	if(target=='joincount'){
	data.addColumn('number', '가입자 수');
	}else{
	data.addColumn('number', '예약 횟수');
	}
	//let rows = res;
	//console.log(res);
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

function drawColumnsChart(res){
	console.log(res);
	var data = new google.visualization.DataTable();
	data.addColumn('string');
	data.addColumn('number','예약 횟수');
	data.addRows(res);
	var options = {
		height: 400,
	};
	var chart = new google.charts.Bar(document.getElementById('DataHashTagChart'));
	chart.draw(data,options);

}
		    