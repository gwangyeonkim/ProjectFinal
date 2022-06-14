 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<!-- 채팅용 import -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body{
	background-color: white; 
}
.container{
    max-width:900px;
}

.chat_container{
	overflow: hidden;
}

.inbox_people {
	background: #fff;
	float: left;
	overflow: hidden;
	width: 30%;
	border-right: 1px solid #ddd;
}

.inbox_msg {
	border: 1px solid #ddd;
	clear: both;
	overflow: hidden;
}

.top_spac {
	margin: 20px 0 0;
}

/* .recent_heading { */
/* 	float: left; */
/* 	width: 40%; */
/* } */

/* .srch_bar { */
/* 	display: inline-block; */
/* 	text-align: right; */
/* 	width: 60%; */
/* 	padding: */
/* } */

.recent_heading h4 {
	color: #0465ac;
    font-size: 16px;
    margin: auto;
    line-height: 29px;
}

.srch_bar input {
	outline: none;
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 2px 0 4px 6px;
	background: none;
}

.srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
    font-size: 12px;
    color: #989898;
    margin: auto;
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.chat_img {
	float: left;
	width: 11%;
}

.chat_img img {
	width: 100%
}

.chat_ib {
	float: left;
	padding: 0 0 0 15px;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
}

.chat_list {
	border-bottom: 1px solid #ddd;
	margin: 0;
	padding: 18px 16px 10px;
}

.inbox_chat {
	height: 550px;
	overflow-y: scroll;
}

.active_chat {
	background: #e8f6ff;
}

.incoming_msg_img {
	display: inline-block;
	width: 6%;
}

.incoming_msg_img img {
	width: 100%;
}

.received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
}

.received_withd_msg p {
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 0 15px 15px 15px;
	color: #646464;
	font-size: 14px;
/* 	margin: 0; */
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.received_withd_msg {
	width: 57%;
}

.mesgs{
	float: left;
	padding: 0px;
	width:100%; 
	background-color: black;
}

.sent_msg p {
	background:black;
	border-radius: 12px 15px 15px 0;
	font-size: 14px;
/* 	margin: 0; */
	color: #fff;
	padding: 5px 20px 5px 20px;
	width: 100%;
}

.outgoing_msg {
	overflow: hidden;
	margin: 26px 0 26px;
}

.sent_msg {
	float: right;
	width: 52%;
}


.type_msg{
}


.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
	outline:none;
}

.type_msg {
	border-top: 1px solid #c4c4c4;
	position: fixed;
    bottom: 0;
    width: 100%;
}

.msg_send_btn {
	background: black none repeat scroll 0 0;
	border:none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 15px;
	height: 33px;
	position: absolute;
 	right: 5px;
	top: 11px;
	width: 33px;
}

.messaging {
	padding: 0 0 50px 0;
 	background-color: black;
}

.msg_history {
 	height : 600px; 
	overflow-y: auto;
	background-color: white;
	padding : 10px 0 0 0;
}

h3{
	margin:0 0 0 0;
	padding: 20px 0 20px 20px;
	color: white;
	font-weight: bolder;
}

.name{
	font-weight: bold;
	padding : 0 0 0 10px;
}

.memList_p{
	font-size: 15px;
	color : black;
	padding : 20px 0 0 0;
}

.enter{
	text-align: center;
}

.glyphicon-user{
	color: white;
	float: right;
	right: 10px;
}
</style>
</head>

<body>
	<div class="messaging">
	 <h3>채팅방<span class="glyphicon glyphicon-user" data-toggle="modal" data-target="#myModal"  ></span> </h3>
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
		       <h4 style="float: left; font-weight: bolder; font-size: 20px;">접속자 목록</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	        <!-- 내용 -->
				<div class="memList"></div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
		<div class="mesgs">
			<div class="msg_history">
					<div class="chat_container">
			  			<input  type="text" id="nickName" value="${mem_id}" style="display: none;">
					 </div> 
		  	</div>
			<div class="type_msg">
				<div class="input_msg_write">
				  <input type="text" class="write_msg" placeholder="채팅을 입력해주세요" />
				  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</div>
			  </div>
		</div>
	</div>	
</div>
</body>
<script type="text/javascript">
var ws = null;
var url = null;
var nick =null;

	
	
$(document).ready(function(){
		
		console.log("--------:"+"${gr_id}");
		
		nick = $("#nickName").val();
// 		nick = $("#nickName").	ext();
		id = "${gr_id}"; 
		console.log($("#nickName").text()+ "@@@@@@");
		$(".receive_msg").html("");
		$(".input_msg_write").show();
		$(".write_msg").focus();
		
		ws = new WebSocket("ws://c496-211-197-28-137.ngrok.io:8095/ProjectFinal/wsChatGr.do");
		ws.onopen = function(){
			console.log("nickName : " + nick);
			ws.send("#$nick_"+nick);
		};
		
		
		ws.onmessage = function(event){
			var msg = event.data;
			var id = "${gr_id}"; // 프로젝트 이름 나옴!
			if(msg.startsWith("<")){ // 입장,  퇴장
				$(".msg_history").append($("<div>").append($("<p class='enter'>").text(msg))).append("<br><br>");	
				viewList(id);
				viewList_enter(id);
			}else if(msg.startsWith("[나]")){ // 대화내용
				msg = msg.substring(3);
// 				$(".msg_history").text("으엥");
				$(".msg_history").append($("<div class='outgoing_msgs'>").append($("<div class='sent_msg'>").append($("<p>").text(msg)))).append("<br><br>");
				console.log("되냐고묘");
			}else{
// 				$(".receive_msg").append($("<div class='receiveTxt'>").append($("<span class='recevier_img'>").text(msg))).append("<br><br>");
				var content = msg.split(']', 2);
				$(".msg_history").append($("<p class='name'>").text(content[0]));
				$(".msg_history").append($("<div class='received_msg'>").append($("<div class='received_withd_msg'>").append($("<p>").text(content[1])))).append("<br><br>");
			}
			console.log(msg);
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			
		};
		
		ws.onclose = function(event){
			alert("채팅방이 삭제됩니다");
		}
		
		
		const input = document.querySelector('.msg_send_btn');	
		$(input).bind("click",function(){
			if($(".write_msg").val() == ""){
				
			}else{
				ws.send(nick +" : "+$(".write_msg").val());
				console.log($(".write_msg").val());
				$(".write_msg").val("");
				$(".write_msg").focus();
			}
		});
		//enter 추가
		$( ".write_msg" ).keypress(function( event ) {
			  if ( event.which == 13 ) {
					if($(".write_msg").val() == ""){
						
					}else{
						ws.send(nick +" : "+$(".write_msg").val());
						console.log($(".write_msg").val());
						$(".write_msg").val("");
						$(".write_msg").focus();
					}	
			     event.preventDefault();
			  }
		});
	});
	
	var pageClosed = false;
	
		var roomClose= 	function(event){
				alert("채팅종료");
				$.ajax({
					type:"POST",
					url:"./socketOut.do",
					async:true,
					success: function (){
						alert("작동");
						pageClosed = true;
						self.close();
					}
				});
				return  '고고';
				
			}
		
		function disconnection(){
				ws.close();			
				ws =null;
		}
	
		function viewList(grId){
			$(".memList").children().remove();
			$.ajax({
				type:"post",
				url:"./viewChatList.do",
				data: "mem_id="+$("#nickName"),
				async:false,
				success:function(result){
					for(var k in result.list){
						console.log( k + "♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣");
						if(result.list[k] == grId){
							$(".memList").prepend("<p class='memList_p'>"+k+"</p>");
						}
					}
				}
			});
		}
		
		function viewList_enter(grId){
			$(".memList").children().remove();
			$.ajax({
				type:"post",
				url:"./viewChatList.do",
				data: "mem_id="+$("#nickName"),
				async:false,
				success:function(result){
					for(var k in result.chatList){
						console.log( k + "♠♠♠♠♠♠");
						if(result.chatList[k] == grId){
							$(".memList").prepend("<p class='memList_p'>"+k+"</p>");
						}
					}
				}
			});
		}
		
		window.addEventListener("beforeunload",	function(){
			roomClose();
		});
	
	
</script>

</html>