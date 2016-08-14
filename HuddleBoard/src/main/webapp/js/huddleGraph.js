
$(document).ready(function(){

	var barChartData = {
		labels : ["January","February","March","April","May","June","July"],
		datasets : [
			{
				fillColor : "rgba(220,150,20,0.5)",
				strokeColor : "rgba(220,150,20,0.8)",
				highlightFill: "rgba(220,150,20,0.75)",
				highlightStroke: "rgba(220,150,220,1)",
				data : [10,20,30,15,25,35,10]
			}/*,
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [15,25,35,20,30,40,15]
			}*/
		]

	};
	
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx).Bar(barChartData, {
		responsive : true
	});
});