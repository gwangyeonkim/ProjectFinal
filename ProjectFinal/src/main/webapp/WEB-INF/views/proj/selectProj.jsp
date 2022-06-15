<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.area {
	width: 400px;
	height: 300px;
	margin-top: 160px;
	margin-left:  100px;
	
}
</style>
<%@include file ="../header.jsp"%>
<body>
	<div class="wrapper">
		<div class="content" style="width: 1400px;">
		<div class="area1">
			<br><br><br><br><br><br><br><br><br><br><br><br>
				<button onclick="newProj()">프로젝트 생성</button>
				<button onclick="joinProj()">프로젝트 참여</button>
		</div>
		<div class="area1" style="width: 1100px;text-align: center;">
		<br><br><br><br><br><br><br><br><br><br><br><br>
			<h1>현재 참여중인 프로젝트가 없습니다.</h1>
			</div>
		</div>
	</div>
	
<div class="modal fade" id="newModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>
                            프로젝트 생성
                        </h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form action="./newProj.do" method="post">
                            <div class="form-group">
                                <label for="PROJECT NAME">
                                    <span>프로젝트 이름</span>
                                </label>
                                <input type="text" class="form-control" name="projName">
                            </div>
                            <button type="submit" class="btn btn-success btn-block">
                                작성 완료
                            </button>
                        </form>
                    </div>
                </div>
		</div>
</div>

<div class="modal fade" id="joinModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>
                            프로젝트 참여
                        </h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form action="./joinProj.do" method="post">
                            <div class="form-group">
                                <label for="PROJECT NAME">
                                    <span>프로젝트 초대코드</span>
                                </label>
                                <input type="text" class="form-control" name="randomKey">
                            </div>
                            <button type="submit" class="btn btn-success btn-block">
                                작성 완료
                            </button>
                        </form>
                    </div>
                </div>
		</div>
</div>
</body>
<script type="text/javascript">
// $(document).ready(function () {
//     $("#fixBtn").click(function () {
//         $("#fixModal").modal();
//     });
// });
	 function newProj  (){
		console.log('안뇽');
		$("#newModal").modal();
	}
	
	 function joinProj (){
		 console.log('안뇽');
			$("#joinModal").modal();
	}
</script>

</html>