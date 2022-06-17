<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>프로젝트 선택</title>
</head>
<%@include file ="../header.jsp"%>
<style>
.navb{
    width: 1050px;
    height: 80px;
}
</style>
<body>
	<div class="wrapper">
		<div class="content" style="position: absolute;">
			<div style="position: absolute;top: 500px;left: 400px;width: 250px;">
				<button onclick="newProj()" class="btn btn-primary">프로젝트 생성</button>
				<button onclick="joinProj()" class="btn btn-primary">프로젝트 참여</button>
			</div>
		<div style="position: absolute;top: 250px;left: 250px;">
			<h1 style="width: 650px;">현재 참여중인 프로젝트가 없습니다.</h1>
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