<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projMem</title>
</head>
<style>
.inArea{
	background-color: rgb(221, 221, 221);
    border-radius: 20px;
    font-size: 20px;
    padding: 8px;
}
</style>
<%@ include file="../header.jsp" %>
<body>
	<div class="wrapper">
		<div class="content">
			<div class="area1" style="width:280px; height: 680px; background-color: white;">
			<div class="inArea" style="height: 120px; width:280px; text-align: center;">
			<h3>프로젝트 초대 키</h3>			
			${projToken}
			</div><br>
			<div class="inArea" style="height: 500px; width:280px; text-align: center;">
			<h3>프로젝트 멤버</h3>
			<c:forEach var="i" begin="0" end="${fn:length(projMemList)-1}" step="1">
			${projMemList.get(i).memId}<br><br>
			</c:forEach>			
			</div>
			</div>
			<div class="area2" style="width:280px; height: 680px; background-color: white; margin-left: 120px;">
				<div class="inArea" style="height: 600px; text-align: center;">
					<h3>PM 변경란</h3>
					<form action="#" method="get">
						<input type="text" >
						${loginVo.memberId }
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>