<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/scheduleBoard.css">
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
</head>
<style type="text/css">
	
	#cont2{
	grid-row: span 2;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	
const Chart = toastui.Chart;
const el = document.getElementById('chart');
const data = {
  categories: ['1', '2', '3', '4'],
  series: [
    {
      name: '진행도',
      data: [50, 30, 70, 60],
    }
  ],
};
const options = {
  chart: { width: 40%, height: 300 },
};

const chart = Chart.barChart({ el, data, options });
});
</script>
<body>
	<div class="wrapper">

		<div class="nav">
			<a href="#" class="logo">Home</a>
			<div class="dropdown">
				<button class="dropbtn">Document</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Calendar</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Member</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Template</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="nav-right">
				<a id="loginInfo"> loginInfo
				<img id="chatIcon" alt="chat" src="img/chat.png" />
				<img id="notiIcon" alt="notification" src="img/notification.png" />
				<span id="notiNonCheck">&#128308;</span>
					<!-- 이 notiCount가 미확인 알림 숫자임 --> <span id="notiCount">1</span>
				</a> <a class="active" href="#home">logout</a>
			</div>
		</div>
		<div class="content">
			<!--여기 넣으면 됨-->
			<div id="cont1">
			
			</div>
			<div id="cont2">

			</div>
			<div id="cont3">
				<div id="chart" style="width:40%;"></div>
			</div>
		</div>
	</div>


</body>
</html>