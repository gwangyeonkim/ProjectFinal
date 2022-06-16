<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style type="text/css">
.inArea{
	background-color: rgb(221, 221, 221);
    border-radius: 20px;
    font-size: 20px;
    padding: 8px;
}
</style>
</head>
<%@ include file="../header.jsp" %>
<body>
	<div class="wrapper">
		<div class="content">
			<div class="area1" style="width:280px; height: 680px; background-color: white;">
				<div class="inArea" style="width: 600px; height: 680px; text-align: center;">
				<h1>도움말</h1><br>
					<h3>
						템플릿으로 제공되는 FBS, WBS 문서를 제외한<br>
						?? 가지의 문서가 제공됩니다. <br>
						제공되는 문서는 사용자의 편의를 돕기위해 제공되며<br>
						작성이력에 대한 추가적인 요소는 제공하지 않습니다.<br>
						<br><br><br><br><br>
						파일 다운로드 주소 : C:\PROJECTFILE<br>
						파일 업로드 : C:\PROJECTFILE\upload<br>
						파일 업로드시에 폴더안에 있어야 업로드가 완료 됩니다.<br>
					</h3>
				</div>
				<div id="grid" style="width: 450px;position: relative;left: 800px;bottom: 500px;""></div>
				<button onclick="location.href='./dropBaseDown.do'">다운로드</button>
			</div>
		</div>
	</div>
<h1><a href="./dropMatch.do">드롭박스 서버에 폴더 생성</a></h1>
<h1><a href="./dropBaseDown.do">드롭박스 로컬에 폴더 생성 및 문서 다운로드</a></h1>
<h1><a href="./dropUpload.do">드롭박스 업로드</a></h1>
</body>
<script type="text/javascript">
var Grid = tui.Grid;
var el;
var options;
const data = [
	  {
		  fileName:'개발예정보고서'
	  },
	  {
		  fileName:'개발표준정의서'
	  },
	  {
		  fileName:'일일보고서'
	  },
	  {
		  fileName:'유스케이스'
	  },
	  {
		  fileName:'안뇽'
	  },
	];
	const grid = new Grid({
			  el: document.getElementById('grid'),
			  columns: [
				 	 {
					    header: '파일명',
					    name: 'fileName',
					  }
			],
			data
		});
	
	
</script>
</html>
