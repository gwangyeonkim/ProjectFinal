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
        grid-template-rows: 350px 350px ;
        padding: 10px;
        margin-right:10px;
    }
    
    #grid1, #grid2{
    	border : 1px solid black;
    	margin-top:10px;
    }
    .innerCont2, .innerCont4{
    	margin-left:50px;
    }
    
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 60px;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    background-color: rgba(0,0,0, 0.7); /* Black w/ opacity */
    
}
    
/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */
    text-align:center;
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold; 
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.clearBtn{
	background-color: white;
	color: black;
	font-size: 20px;
	font-weight: 1000;
	cursor:pointer;
	transition:0.3s;
}

.clearBtn:hover {
	background-color: black;
	color: white;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	showPieChart();
	showBarChart();
	showIncomplete();
	showComplete();
	
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

function showIncomplete(){
    var grid = new tui.Grid({
        el: document.getElementById('grid1'),
        bodyHeight: 200,
        scrollX: false,
        scrollY: true,
        columns: [
          {
            header: '기능명',
            name: 'wbsName',
          },
          {
            header: '담당자',
            name: 'wbsManager',
          },
          {
            header: '종료일',
            name: 'wbsEndDate'
          }
        ]
      });
	$.ajax({
        url : "./callIncomplete.do",
        method :"POST",
        data:{"memId":"GD001"}, //로그인 유저 정보 받아와야함
        dataType : "JSON",
        success : function(result){
            grid.resetData(result);
        } 
    });
}

function showComplete(){
    var grid = new tui.Grid({
        el: document.getElementById('grid2'),
        bodyHeight: 200,
        scrollX: false,
        scrollY: true,
        columns: [
          {
            header: '기능명',
            name: 'wbsName',
          },
          {
            header: '담당자',
            name: 'wbsManager',
          },
          {
            header: '완료일',
            name: 'wbsFinDate'
          },
          {
              header: '완료취소',
              name: 'wbsId'
          }
        ]
      });
	$.ajax({
        url : "./callComplete.do",
        method :"POST",
        data:{"memId":"GD001"}, //로그인 유저 정보 받아와야함
        dataType : "JSON",
        success : function(result){
            grid.resetData(result);
        } 
    });
	var auth = 0;
	$.ajax({
        url : "./checkAuth.do",
        method :"POST",
        data:{"memId":"GD001"}, //로그인 유저 정보 받아와야함
        async:false,
        success : function(result){
            if(result){
            	console.log("PM이다");
            	auth++;
            }else{
            	console.log("PM아니다");
            }
        } 
    });
	
	
    grid.on('click', () => {
    	  console.log(grid.getFocusedCell().rowKey);
    	  var modal = document.getElementById('myModal');
    	  var span = document.getElementsByClassName("close")[0];
    	  var clearBtn = document.getElementsByClassName("clearBtn")[0];
    	  if(auth==1&&grid.getFocusedCell().columnName=='wbsId'){
    		console.log("글 복구 시킬지 모달");
    		
			modal.style.display = "block";

			span.onclick = function() {
			modal.style.display = "none";
				}
				
			clearBtn.onclick = function(){
			console.log("일정완료취소");
			$.ajax({
				url:"./incompleteSchedule.do",
				type:"POST",
				data:{"wbsId":grid.getFocusedCell().value},
				success:function(){
					console.log("일정완료");
					grid.removeRow(grid.getFocusedCell().rowKey);
					location.reload();
				},
				error:function(){
					alert("잘못된 요청입니다");
				} 
			});
			modal.style.display = "none";
			}
    	  }
    	});
	
	
}

function deleteaa(){
	console.log("삭제발생!");
}

//그냥 따로 테이블 만들고 위치 같게 만든 다음 서로 display : block, none 하자


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
				<b>완료 일정</b>
				<div id="grid1"></div>
			</div>
			<div class="innerCont3">
				<b>개인별 진척도</b>
				<div id="barChart"></div>
			</div>
			<div class="innerCont4">
				<b>미완료 일정</b>
				<div id="grid2"></div>
			</div>
		</div>
	</div>
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">x</span>
    <h2>해당 일정을 다시 복구시키겠습니까?</h2>
    <button class="clearBtn" onclick="incompleteWbs()">일정완료 취소</button>
  </div>
</div>
</body>
</html>