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
	
<!-- <link rel="stylesheet" href="./css/scheduler.css"> -->

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
<%@include file="./header.jsp" %>
<style type="text/css">
#arrowImg {
	width: 25px;
	height: 25px;
}

.content{
    display: grid;
    width: 1000px;
    height:300px;
    grid-template-columns: 15% 85%;
    gap:20px;
    padding: 10px;
}

/* 안에 div 설정임 */
.content > div {
    background-color: rgb(221, 221, 221);
    font-size: 20px;
    padding: 8px;
}

.item1,.item2{
    margin: 10px;
}

.item1{
    text-align: center;
}

.newSche {
    background-color: white;
    font-size: 30px;
    font-weight: bold;
    transition: 0.5s;
}

.newSche:hover{
    color: rgb(255, 255, 255);
    background-color: rgb(0, 0, 0);
    cursor: pointer;
}

#checkList{
	line-height:30px;
}

#moveBox{
	position:relative;
}

#prev{
	position:absolute;
	right:495px;
	top:4px;
}

#next{
	position:absolute;
	right:278px;
	top:4px;
}

#today{
	position:absolute;
	right:190px;
	top:4px;
	font-size: 24px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
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

$(document).ready(function() {
	showCalendar();
});

function showCalendar(){
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
		    },
		    popupStateFree: function() {
	            return 'A';
	        },
	        popupStateBusy: function() {
	            return 'B';
	        },
		  };
	
	var calendar = new tui.Calendar('#calendar', {
		  defaultView: 'month',
		  template: templates,
		  useCreationPopup: true,
		  useDetailPopup: true,
		});
	calendar.setCalendarColor('군계일학', { //군계일학 말고 calendarId가 들어가야함
	    color: '#ffffff',//글자 색
	    bgColor: '#585858',//배경 색
	});
	

		calendar.clear();
		calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
		holiday(calendar.getDate().getFullYear());
		calendar.createSchedules(getPersonalSchedule());
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
				var scheduleInfo = {
					"title" : scheduleData.title,
					"content" : scheduleData.location,
					"start" : makeTime(scheduleData.start),
					"end" : makeTime(scheduleData.end)
				}
				$.ajax({
					url: "./insertSchedule.do",
					type:"POST",
					data:scheduleInfo,
					success: function(data){
						if(data==1){ // insert에 성공했다면 
							console.log(getPersonalSchedule());1
							calendar.createSchedules(getPersonalSchedule());
						}
					 },
					error:function(){
						alert("잘못된 요청입니다");
					} 
				});
				//추가가 되었다면 다시 렌더링 해주는 작업 필요
			},
			'beforeUpdateSchedule':function(scheduleData){// 일정 수정 및 드래그를 하였을 때 발생하는 이벤트
				console.log(scheduleData.schedule); // 수정 전 기존 일정 정보
				console.log(scheduleData.changes);//변경사항
				if(scheduleData.changes != null){
					let info = {
							"sId" : scheduleData.schedule.id,
							"mId" : scheduleData.schedule.calendarId,
							"sName" : scheduleData.schedule.title,
							"sCont" : scheduleData.schedule.location,
							"start" : makeTime(scheduleData.schedule.start),
							"end" : makeTime(scheduleData.schedule.end)
						}
					$.ajax({
						url:"./updateSchedule.do",
						type:"POST",
						data:info,
						success:function(data){
							console.log("업데이트성공");
							console.log(data);
						},
						error:function(){
							alert("잘못된 요청입니다");
						} 
					});
				calendar.updateSchedule(scheduleData.schedule.id, scheduleData.schedule.calendarId, {
				    title: scheduleData.changes.title,
				    location : scheduleData.changes.location,
				    start: scheduleData.changes.start,
				    end: scheduleData.changes.end
				},false);
				}
				console.log(makeTime(scheduleData.schedule.start));
				console.log(makeTime(scheduleData.schedule.end));
			},
			'beforeDeleteSchedule':function(scheduleData){//삭제할때 발생하는 이벤트
				console.log(scheduleData.schedule) // 삭제할 일정 정보
				console.log("삭제");
				$.ajax({
					url: "./deleteSchedule.do?sId="+scheduleData.schedule.id+"&&mId=${loginVo.memberId}",//mid 현재 접속자 아이디 넣어야함
					type: "GET",
					success: function(data) {
						console.log("삭제성공");
						console.log(data);
					},
					error:function(){
						alert("잘못된 요청입니다");
					}
				});
				calendar.deleteSchedule(scheduleData.schedule.id, scheduleData.schedule.calendarId, false);
			},
			'clickSchedule':function(scheduleData){
				console.log(scheduleData.schedule);
				if(scheduleData.schedule.isPrivate == "true"){
					var modal = document.getElementById('myModal');
					var span = document.getElementsByClassName("close")[0];
					var clearBtn = document.getElementsByClassName("clearBtn")[0];
					modal.style.display = "block";

					span.onclick = function() {
					    modal.style.display = "none";
					}
					
					clearBtn.onclick = function(){
						console.log("일정완료");
						console.log(scheduleData.schedule.body);
						console.log("${loginVo.memName}");
						if(scheduleData.schedule.body == "${loginVo.memName}"){
							$.ajax({
								url:"./completeSchedule.do",
								type:"POST",
								data:{"wbsId":scheduleData.schedule.id},
								success:function(){
									console.log("일정완료");
									calendar.deleteSchedule(scheduleData.schedule.id, scheduleData.schedule.calendarId, false);
								},
								error:function(){
									alert("잘못된 요청입니다");
								} 
							});
							modal.style.display = "none";
						}else{
							alert("자신의 기능한 완료가 가능합니다.");
							return false;
						}
						
					}
					
					
				}
			}
		});
		
		
		/* callSchedule(); */
		
		nextBtn.addEventListener('click', () => {
			calendar.next();
			calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
			var thisYear = calendar.getDate().getFullYear();
			if(yearInfo.value != calendar.getDate().getFullYear()){
				yearInfo.value = calendar.getDate().getFullYear();
				checkFalse();
				calendar.clear();
				holiday(yearInfo.value);
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
				checkFalse();
				calendar.clear();
				holiday(yearInfo.value);
				/* callSchedule();   */
			}
		});
		todayBtn.addEventListener('click', () => {
			calendar.today();
			calInfo.innerText =calendar.getDate().getFullYear()+"년 "+(calendar.getDate().getMonth()+1)+"월";
			calendar.clear();
			console.log(calendar.getDate().getFullYear());
			holiday(calendar.getDate().getFullYear());
		});
		$("#checkList input").click(function(){
			if(checkSelect() != null){
				console.log(checkSelect());
				$.ajax({
					url: "./callSchedule.do",
					type:"POST",
					data:{
						list:checkSelect()
					},
					success: function(data) {
						console.log(data);
						calendar.clear();
						calendar.createSchedules(data);
						holiday(calendar.getDate().getFullYear());
						calendar.createSchedules(getPersonalSchedule());
					 },
					error:function(){
						alert("잘못된 요청입니다");
					} 
				});
			}else if(checkSelect() == null){ //체크된게없다는뜻
				calendar.clear();
				holiday(calendar.getDate().getFullYear());
				calendar.createSchedules(getPersonalSchedule());
			}
			
		});
		
		function holiday(year){
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
}
	
		

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
function callSchedule(nameList){
	$.ajax({
		url: "./callSchedule.do",
		type:"POST",
		data:{
			list:nameList
		},
		success: function(data) {
			console.log(data);
			return data;
		 },
		error:function(){
			alert("잘못된 요청입니다");
		} 
	}); 
}
function getPersonalSchedule(/* loginId 여기 로그인 정보가 담기고 밑에 data에 들어가야함 */){
	let obj;
	$.ajax({
		url:"./showPersonalSchedule.do",
		type:"POST",
		async: false, //결과를 전역변수에 담기 위해 async를 false로 해주어야함
		data:{memberId : "${loginVo.memberId}"}, //여기에 loginInfo의 mem_id가 들어가야함
		success:function(data){
			obj = JSON.parse(data);
		},
		error:function(){
			alert("잘못된 요청입니다");
		}
	});
	return obj;
}


/* function callHoliday(year){
	var result = "";
	$.ajax({
		url: "./restDay.do",
		type: "POST",
		data:{"year":year},
		dataType:"json",
		success: function(data) {
            console.log(typeof(data));
            result = data;
		},
		error:function(){
			alert("잘못된 요청입니다");
		}
	});
	console.log("확인");
	console.log(result);
	return result;
} */

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
    	/* console.log(nameList); */
    	return nameList;
    	
    }
    
}
function checkFalse(){
	var allCheckbox = document.getElementsByName('chkAll');
	var checkboxes = document.getElementsByName('check');
	checkboxes.forEach((checkbox) => {
        checkbox.checked = false;
    });
	allCheckbox[0].checked = false;
}
//---------------------------------
function checkAll(checkAll) {
    var checkboxes = document.getElementsByName('check');
    var nameList = new Array();
    
    checkboxes.forEach((checkbox) => {
        checkbox.checked = checkAll.checked
    })
    
    /* if(checkAll.checked){
        checkboxes.forEach(
            function(val){
                nameList.push(val.value);
            }
        ); */
        /* $.ajax({
    		url: "./callSchedule.do",
    		type:"POST",
    		data:{
    			list:nameList
    		},
    		success: function(data) {
    		 },
    		error:function(){
    			alert("잘못된 요청입니다");
    		} 
    	}); 
    }*/
}


//---------------------------------

function makeTime(info){
	var year = String(info.getFullYear());
	var month = String(info.getMonth()+1);
	if(month.length==1){
		month = '0'+month;
	}
	var day = String(info.getDate());
	if(day.length==1){
		day = '0'+day;
	}
	var result = year+'-'+month+'-'+day;
	return result;
}


</script>

<body>


		<div class="wrapper">
		<div class="content">
			<!--여기 넣으면 됨-->
			<div class="item1">
				<button id="newSche" class="newSche">NEW</button>
				<hr style="height: 2px; background-color: black;">
				<div id="checkList" style="text-align: left; padding-top: 10px;">
					<input class="checkName" type="checkbox" name="chkAll" onclick="checkAll(this)"><b>ALL</b><br>
				<!-- 로그인된 memId로 projectMemList 찾아서 Vo로 리스트 세션 받아와서 인원 찍어주어야함 -->
				<c:forEach var="name" items="${mLists}" varStatus="status">
					<input class="checkName" type="checkbox" name="check" value="<c:out value="${name}"/>" onclick="checkSelect()"><b><c:out value="${name}"/></b><br>
				</c:forEach> <!--   
					<input class="checkName" type="checkbox" name="check" value="김광연" onclick="checkSelect()"><b>김광연</b><br>
					<input class="checkName" type="checkbox" name="check" value="김규철" onclick="checkSelect()"><b>김규철</b><br>
					<input class="checkName" type="checkbox" name="check" value="박정연" onclick="checkSelect()"><b>박정연</b><br>
					<input class="checkName" type="checkbox" name="check" value="이창훈" onclick="checkSelect()"><b>이창훈</b> -->
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
				<div id="calendar" style="width: 100%; height: 600px; display:inline-block;">
				</div>
			</div>
		</div>
	</div>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">x</span>
    <h2>해당 일정을 완료하시겠습니까?</h2>
    <button class="clearBtn">일정완료</button>
  </div>

</div>
</body>
</html>