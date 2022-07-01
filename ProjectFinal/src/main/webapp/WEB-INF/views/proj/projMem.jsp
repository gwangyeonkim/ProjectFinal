<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>
<head>
<meta charset="UTF-8">
<title>projMem</title>
</head>
<%@ include file="../header.jsp" %>
<style>
.navb{
    width: 1050px;
    height: 80px;
}
</style>
<body>
<input id="iscPm" value="${iscPm }" style="display: none;">
	<div class="wrapper" >
		<div class="content" style="position: absolute;">
			<div class="area1" style="width:280px; height: 680px; background-color: white;">
			<div class="inArea" style="height: 120px; width:280px;text-align: center;position: relative;top: 10px;left: 10px;">
			<h3>프로젝트 초대 키</h3>			
			${projToken}
			</div><br>
				<div class="inArea"
					style="height: 500px; width: 280px; text-align: center; position: relative; top: 10px; left: 10px;">
					<h3>프로젝트 멤버</h3>
					<c:forEach var="i" begin="0" end="${fn:length(projMemList)-1}"
						step="1">
			${projMemList.get(i).memId}<br>
						<br>
					</c:forEach>
					<div class="inArea" style="position: relative;left: 800px;width: 186px;top: 250px;bottom: 50px;">
						<button onclick="exitProj()" class="btn btn-primary">탈퇴</button>
					</div>
					<div class="inArea" style="position: relative;left: 800px;width: 186px;top: 270px;">
						<button onclick="deleteProj()" class="btn btn-primary">삭제</button>
					</div>
				</div>
				<div class="inArea"style="height: 166px;text-align: center;position: relative;left: 320px;bottom: 650\;bottom: 650px;bottom: 150px;width: 466px;">
					<h3>PM 변경란</h3>
					<form action="./changPm.do" method="get">
						<input type="text" >
						<input type="text"  value="${userId }"><br>
						<c:if test="${iscPm=='Y'}">
							<button type="submit" class="btn btn-primary">변경</button>
						</c:if>
						<c:if test="${iscPm=='N'}">
							<h3>PM만이 가능합니다.</h3>
						</c:if>
					</form>
				</div>
				
			</div>
			</div>
			<table id="myTable" class="cell-border" style="width: 600px;margin-left: 370px;"> 
		<thead>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mVo" items="${lists}"  varStatus="vs">
			<tr>
				<td><a href="#" onclick="memberSelect('${mVo.memberId}')">${mVo.memberId}</a></td>
				<td>${mVo.memName}</td>
				<td>${mVo.memEmail}</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>
       <!-- ----------------- 모달 띄우기 ------------------ -->
      <div class="modal fade" id="loginModal" role="dialog">

            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                <div class="modal-header" style="padding:35px 50px;">
<!--                         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                        <h4>
                            <span class="glyphicon glyphicon-envelope">메일보내기</span>
                        </h4>
                    </div>
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                    <div class="modal-body" style="padding:40px 50px;">
                      <form action="./inviteMember.do" method="post" role="form">  
                            <div class="form-group">
                           <input type="text" id="email" class="form-control" name="memEmail" readonly="readonly">
                           <input type="text" id="id" class="form-control" name="memId" readonly="readonly">
                                <input type="hidden" class="form-control" name="memberId" value="${loginVo.memberId}">
                            </div>
                            <input type="submit" class="btn btn-success btn-block"  value="전송"> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
   
</body>
<script type="text/javascript">
function memberSelect(id){
   console.log(id);
   $.ajax({
      url : "./memberSelect.do",
      data : {id:id},
      type : "get",
      success:function(data){
         console.log(data);   
         $("#email").val(data.memEmail)
         $("#id").val(data.memName)
      }
     
   })
     $("#loginModal").modal();
     
   
}


$(document).ready( function () {
    $('#myTable').DataTable({
       //https://datatables.net/reference/option/language
      // DataTable은 기본적으로 영어로 표시되기 때문에 별도로 language를 통해서 변경해줘야 함
          "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "검색: ",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
        lengthChange: false, // 표시 건수기능 숨기기
        searching: true, // 검색 기능 숨기기
        ordering: true, // 정렬 기능 숨기기
        info: false, // 정보 표시 숨기기
        paging:true, // 페이징 기능 숨기기
//      order: [ [ 3, "asc" ], [ 1, "desc"] ], //초기표기시 정렬, 만약 정렬을 안하겠다 => order: []
  	 	columnDefs: [{ targets: 1, width: 100 }], //열의 넓이 조절 
      	lengthMenu: [ 10 ] //표시건수 
//      displayLength: 50, //기본표시건수 설정
//      pagingType: "simple_numbers" // 페이징 타입 설정 : simple, simple_numbers, full_numbers 등
    });
} );







function  exitProj(){
	let iscPm = document.getElementById('iscPm').value;
	console.log(iscPm);
	if(iscPm=='Y'){
		alert('PM은 탈퇴가 불가능합니다');
		return false;
	}
	alert('탈퇴가 완료되었습니다');
	console.log('false 이후');
	location.href='./moveFixhistory.do';
}
function  deleteProj(){
	let iscPm = document.getElementById('iscPm').value;
	console.log(iscPm);
	if(iscPm=='N'){
		alert('PM만 삭제가 가능합니다');
		return false;
	}
	alert('삭제가 완료되었습니다');
	console.log('false 이후');
	location.href='./deleteProj.do';
}
</script>
<style>
.inArea{
   background-color: rgb(221, 221, 221);
    border-radius: 20px;
    font-size: 20px;
    padding: 8px;
}
#myTable_filter{
   position: relative;
   width: 50px;
/*     bottom: 330px; */
   
}
.dataTables_wrapper .dataTables_paginate{
   position: relative;
    width: 300px; 
}
.dataTables_wrapper{
    position: relative;
}
#myTable_filter{
    position: relative;
	right: 230px;
}
#myTable_paginate{
	top: 150px;
	right: 300px;
}
</style>
</html>