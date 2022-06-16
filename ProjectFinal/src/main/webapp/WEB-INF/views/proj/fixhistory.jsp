<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<meta charset="UTF-8">
<title>FixHistory</title>
<%@ include file="../header.jsp" %>
<style type="text/css">
.navb{
    width: 1050px;
    height: 80px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div
			style="margin-bottom: 30px; margin-top: 0px; padding-top: 20px; margin-left: 30px;">
			<button onclick="location.href='./fbs.do'" class="btn btn-primary">FBS
				이동</button>
			<button onclick="location.href='./wbs.do'" class="btn btn-primary">WBS
				이동</button>
			<button onclick="location.href='./moveFixhistory.do'"
				class="btn btn-primary">작성이력 이동</button>
		</div>
		<div class="content" style="position:relative;">
			<div id="grid" style="width: 890px; margin-left: 10px;">
				<div style="position: absolute; right: 10px;">
					<button onclick="selectFixhistory()" class="btn btn-primary">조회</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var Grid = tui.Grid;
var el;
var options;
	const grid = new Grid({
			  el: document.getElementById('grid'),
			  columns: [
				 	 {
					    header: '작성 내용',
					    name: 'fixContent',
					  },
					  {
						    header: '작성자',
						    name: 'fixName',
						},
			]
		});
	var arrData = function (){
		
		$.ajax({
			url : "./selectFixhistory.do",
			method : "POST",
			success : function(result){
				console.log('안뇽하세용!!');
				grid.resetData(result);
			}
		});
}
	function selectFixhistory(){
		arrData();
	}
	
</script>

</html>