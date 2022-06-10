<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<fieldset>
	<legend>참여자 목록</legend>
	<div>
		<button onclick="goSocket('S', 'super')">체팅방 입력하기 그룹(S오일):사용자(super)</button>
		<button onclick="goSocket('S', 'higer')"> 체팅방 입력하기 그룹(S오일):사용자(high)</button>
		<button onclick="goSocket('S', 'sinsu')"> 체팅방 입력하기 그룹(S오일):사용자(high)</button><br>
		<button onclick="goSocket('H', 'super')">체팅방 입력하기 그룹(Hiway):사용자(super)</button>
		<button onclick="goSocket('H', 'top')">   체팅방 입력하기 그룹(Hiway):사용자(top)</button>
	</div>
</fieldset>
<script type="text/javascript">
	function goSocket(gr_id, mem_id){
		 window.open("./socketOpenGr.do?mem_id="+mem_id+"&gr_id="+gr_id,"그룹체팅", "width=500px, height=735px, toolbar=no, menubar=no, left=300px, top=50px")
	}
</script>

</body>
</html>