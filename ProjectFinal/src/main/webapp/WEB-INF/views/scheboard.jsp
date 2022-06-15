<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/projectMain.css">
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<style type="text/css">
#cont2 {
	grid-row: span 2;
}

#cont3 {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	showPieChart();
	showBarChart();
	showTable();
});

function showPieChart(){
	const Chart = toastui.Chart;
	const el = document.getElementById('pieChart');
	const data = {
			  categories: ['progress'],
			  series: [
			    {
			      name: '완료',
			      data: 40,
			    },{
				  name: '미완료',
				  data: 100-40,
				}
			    
			  ]
			}
	const options = {
			chart: { width: 500, height: 300 },
			  theme: {
			    series: {
			      colors: ['#00a9ff', '#f8f8f8'],
			      lineWidth: 2,
			      strokeStyle: '#000000',
			    }
			  }
			}
	const chart = Chart.pieChart({el, data, options});
}

function showBarChart(){
	const Chart = toastui.Chart;
	const el = document.getElementById('barChart');
	const data = {
	  categories: ['1', '2', '3', '4'],
	  series: [
	    {
	      name: '진행도',
	      data: [50, 30, 70, 60],
	    }
	  ]
	};
	const options = {
	  chart: { width: 500, height: 300 },
	};

	const chart = Chart.barChart({ el, data, options });
}

function showTable(){
	var Grid = new tui.Grid({
	el : document.getElementById('grid'),
	      scrollX: false,
	      scrollY: true,
	      columns: [
	        {
	          header: 'ID',
	          name: 'id'
	        },
	        {
	          header: '제목',
	          name: 'manager'
	        },
	        {
	          header: '내용',
	          name: 'functionname'
	        },
	        {
	          header: '시작일',
	          name: 'startdate',
	          sortable: true,
	          filter: 'text',
	          rowSpan: true
	        },
	        {
	          header: '종료일',
	          name: 'enddate',
	          sortable: true,
	          filter: 'text',
	          rowSpan: true
	          
	        }
	      ]
	    });
	
	$.ajax({
		url : "showTable.do",
		method : "POST",
		success : function(result){
			console.log(result);
			grid.resetData(result);
		}
	});
}
</script>
		<%@ include file="./header.jsp" %>
<body>
	<div class="wrapper">
		<div class="content">
			<!--여기 넣으면 됨-->
			<div id="cont1">
				<div id="pieChart"></div>
			</div>
			<div id="cont2">
				<div id="grid"></div>
			</div>
			<div id="cont3">
				<div id="barChart"></div>
			</div>
		</div>
	</div>

</body>
</html>