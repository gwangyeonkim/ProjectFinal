<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<style type="text/css">

	.content {
		display: grid;
        width: 1000px;
        height: 300px;
        grid-template-columns: 40% 60%;
        grid-template-rows: 1fr 1fr ;
        gap: 20px;
        padding: 10px;
    }

    .innerCont2 {
    	text-align:center;
        grid-row: span 2 / span 2;
        
    }
    
    .innerCont2 > button {
    	width:250px;
    	height:30px;
    	font-size: 18px;
    	font-weight:1000;
    	background-color: black;
    	cursor: pointer;
    	transition: 0.2s;
    	color:white;
    }
    
    .innerCont2 > button:hover {
    	background-color: white;
    	color:black;
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
			chart: { width: 400, height: 300 },
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
	  chart: { width: 400, height: 300 },
	};

	const chart = Chart.barChart({ el, data, options });
}

function showTable(url){
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

function callScheTable(info){
	console.log("일정부르기");
	console.log(info.className);
	if(info.className == complete){
		showTable("./callComplete.do");
	}else if(info.className == inComplete){
		showTable("./callIncomplete.do");
	}
}

</script>
		<%@ include file="./header.jsp" %>
<body>
	<div class="wrapper">
		<div class="content">
			<!--여기 넣으면 됨-->
			<div class="innerCont1">
				<b>팀 진척도</b>
				<div id="pieChart"></div>
			</div>
			<div class="innerCont2">
				<button class="complete" style="margin-right:10px;" onclick="callScheTable(this)">완료 일정 조회</button>
				<button class="inComplete" style="margin-left:10px;" onclick="callScheTable(this)">미완료 일정 조회</button>
				<div id="grid" style="margin-top:10px;"></div>
			</div>
			<div class="innerCont3">
				<b>개인별 진척도</b>
				<div id="barChart"></div>
			</div>
		</div>
	</div>

</body>
</html>