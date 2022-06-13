<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
	
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
	
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
	
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	
<link rel="stylesheet" href="./css/scheduler.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	
<script
	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	
<script
	src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	
</head>
<style type="text/css">
#arrowImg {
	width: 25px;
	height: 25px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	var prevBtn = document.getElementById('prev'); // 이전 달 버튼
	var nextBtn = document.getElementById('next'); // 다음 달 버튼
	var calInfo = document.getElementById('calInfo');// 화면에 현재 날짜 표시
	var todayBtn = document.getElementById('today'); // 클릭하면 현재 날짜로 이동하는 버튼
	var yearInfo = document.getElementById('yearInfo');//보고있는 캘린더의 년 값
	var newBtn = document.getElementById('newSche'); // 일정추가 버튼
	
	
	
	var templates = {
			alldayTitle:function(){
				return'하루일정으로 설정';
			},
		    titlePlaceholder: function() {
		      return '제목입력';
		    },
		    locationPlaceholder: function() {
		      return '내용입력';
		    },
		    startDatePlaceholder: function() {
		      return '시작일';
		    },
		    endDatePlaceholder: function() {
		      return '종료일';
		    },
		    popupSave: function() {
		      return '저장';
		    },
		    popupUpdate: function() {
		      return '수정';
		    },
		    popupEdit: function() {
		      return '수정';
		    },
		    popupDelete: function() {
		      return '삭제';
		    }
		  };
	
	var calendar = new tui.Calendar('#calendar', {
		  defaultView: 'month',
		  template: templates,
		  useCreationPopup: true,
		  useDetailPopup: false
		});
	
	calendar.setCalendarColor('1', {
	    color: '#ffffff',//글자 색
	    bgColor: '#585858',//배경 색
	});
	

		calendar.clear();
		calendar.render();
		  /* calendar.createSchedules([
		    {
		         id: 'GD1', 
		        title: '예시',
		        category: 'time',
		        start: '2022-05-02',
		        end: '2022-05-02',
		        isAllDay:true
		    }
		]);  */
		
		 calendar.on({
			'beforeCreateSchedule':function(scheduleData){//일정 생성 버튼 클릭시 발생하는 이벤트
				if(scheduleData.isPrivate){
					scheduleData.isPrivate = false; //팀 일정의 경우 isPrivate가 true이기 때문에 개인일정을 isPrivate로 만들어주더라도 false로 바꿔줌
				}
				console.log('생성');
				console.log(scheduleData);
				console.log(scheduleData.calendarId);//id는 null이라 만들때 seq로 만들어주어야함
				console.log(scheduleData.title);
				console.log(scheduleData.location);
				console.log(makeTime(scheduleData.start));
				console.log(makeTime(scheduleData.end));
			},
			'beforeUpdateSchedule':function(scheduleData){// 일정 수정 및 드래그를 하였을 때 발생하는 이벤트
				console.log(scheduleData.schedule); // 수정 전 기존 일정 정보
				console.log(scheduleData.changes);//변경사항
				console.log("업데이트 발생");
			},
			'beforeDeleteSchedule':function(scheduleData){//삭제할때 발생하는 이벤트
				console.log(scheduleData.schedule) // 삭제할 일정 정보
				console.log("삭제");
			 },
			 'clickSchedule':function(scheduleData){
				 if(scheduleData.schedule.isReadOnly){
					alert("공휴일은 수정할 수 없습니다!");
					return false;
				 }else{
					 //일정 목록 모달띄우고 자기일정은 누르면 상세로 자기꺼 아니거나 팀일정이면 readonly
				 }
				 
			 },
			 'clickMore':function(){
				 console.log("날짜클릭");
			 }
		}); 
		
		calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
		callHoliday(calendar.getDate().getFullYear());
		/* callSchedule(); */
		
		nextBtn.addEventListener('click', () => {
			calendar.next();
			calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
			var thisYear = calendar.getDate().getFullYear();
			if(yearInfo.value != calendar.getDate().getFullYear()){
				yearInfo.value = calendar.getDate().getFullYear();	
				calendar.clear();
				callHoliday(yearInfo.value);
				/* callSchedule(); */
			}
		});
		
		newBtn.addEventListener('click', () =>{
			calendar.openCreationPopup();
		});

		prevBtn.addEventListener('click', () => {
			calendar.prev();
			calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
			var thisYear = calendar.getDate().getFullYear();
			if(yearInfo.value != calendar.getDate().getFullYear()){
				yearInfo.value = calendar.getDate().getFullYear();
				calendar.clear();
				callHoliday(yearInfo.value);
				/* callSchedule();   */
			}
		});
		todayBtn.addEventListener('click', () => {
			calendar.today();
			calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
			calendar.clear();
			callHoliday(calendar.getDate().getFullYear());
			/* callSchedule();   */
		});
		

/* function callSchedule(userList){
	$.ajax({
		url: "./callSchedule.do",
		type:"POST",
		data:{
			userList:userList
		},
		success: function(data) {
			console.log(data);
			calendar.createSchedules(data);
		 },
		error:function(){
			alert("잘못된 요청입니다");
		} 
	});
} */

function callHoliday(year){
	$.ajax({
		url: "./restDay.do",
		type: "POST",
		data:{"year":year},
		dataType:"json",
		success: function(data) {
                calendar.createSchedules(data);
		},
		error:function(){
			alert("잘못된 요청입니다");
		}
	});
}
});
//---------------------------------
function checkSelect() {
    // 전체 체크박스
    var checkboxes = document.querySelectorAll('input[name="check"]');
    // 선택된 체크박스
    var checked = document.querySelectorAll('input[name="check"]:checked');
    // 전체선택 체크박스
    var chkAll = document.querySelector('input[name="chkAll"]');

    if (checkboxes.length === checked.length) {
        chkAll.checked = true;
    } else {
        chkAll.checked = false;
    }

    var nameList = new Array();
    checked.forEach(
        function(val){
            nameList.push(val.value);
        }
    );
    if(nameList.length !== 0){
    	console.log(nameList);
    	$.ajax({
    		url: "./callSchedule.do",
    		type:"POST",
    		data:{
    			list:nameList
    		},
    		success: function(data) {
    			console.log(data);
    			/* calendar.createSchedules(data); */
    		 },
    		error:function(){
    			alert("잘못된 요청입니다");
    		} 
    	});
    }
    
}
//---------------------------------
function checkAll(checkAll) {
    var checkboxes = document.getElementsByName('check');
    var nameList = new Array();
    
    checkboxes.forEach((checkbox) => {
        checkbox.checked = checkAll.checked
    })
    
    if(checkAll.checked){
        checkboxes.forEach(
            function(val){
                nameList.push(val.value);
            }
        );
        console.log(nameList);
        $.ajax({
    		url: "./callSchedule.do",
    		type:"POST",
    		data:{
    			list:nameList
    		},
    		success: function(data) {
    			console.log(data);
    			/* calendar.createSchedules(data); */
    		 },
    		error:function(){
    			alert("잘못된 요청입니다");
    		} 
    	});
    }
}


//---------------------------------

function makeTime(info){
	var year = String(info.getFullYear());
	var month = String(info.getMonth()+1);
	if(month.length==1){
		month = '0'+month;
	}
	var day = String(info.getDate());
	var result = year+'-'+month+'-'+day;
	return result;
}
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
			<div class="item1">
				<button id="newSche" class="newSche">NEW</button>
				<hr style="height: 2px; background-color: black;">
				<div id="checkList" style="text-align: left; padding-top: 10px;">
					<input type="checkbox" name="chkAll" onclick="checkAll(this)"><b>ALL</b><br>
					<input type="checkbox" name="check" value="김광연" onclick="checkSelect()"><b>김광연</b><br>
					<input type="checkbox" name="check" value="김규철" onclick="checkSelect()"><b>김규철</b><br>
					<input type="checkbox" name="check" value="박정연" onclick="checkSelect()"><b>박정연</b><br>
					<input type="checkbox" name="check" value="이창훈" onclick="checkSelect()"><b>이창훈</b>
				</div>
			</div>
			<div class="item2" style="text-align:center;">
				<input id="yearInfo" type="hidden" value="${serverTime}" />
				<div id="moveBox">
					<button id="prev">
						<img id="arrowImg" src="./img/ic-arrow-line-left.png">
					</button>
					<h2 style="display: inline" id="calInfo"></h2>
					<button id="next">
						<img id="arrowImg" src="./img/ic-arrow-line-right.png">
					</button>
					<button id="today">Today</button>
				</div>
				<div id="calendar" style="width: 1000px; height: 600px; display:inline-block;">
				</div>
			</div>
		</div>
	</div>


</body>
</html>