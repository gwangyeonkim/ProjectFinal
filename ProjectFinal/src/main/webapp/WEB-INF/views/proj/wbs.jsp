<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./css/tui-grid.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<title>WBS</title>
<%@ include file="../header.jsp" %>
<style type="text/css">
.navb{
    width: 1050px;
    height: 80px;
}
</style>
</head>
<body>
	<div class="wrapper">
	<div style="margin-bottom: 30px; margin-top: 0px;padding-top: 20px;margin-left: 30px;">
	<button onclick="location.href='./fbs.do'" class="btn btn-primary">FBS 이동</button>
	<button onclick="location.href='./wbs.do'" class="btn btn-primary">WBS 이동</button>
	<button onclick="location.href='./moveFixhistory.do'" class="btn btn-primary">작성이력 이동</button>
	</div>
		<div class="content" style="position:relative;" >
			<div id="grid" style="width: 890px;margin-left: 10px;">
		<div style="position: absolute; right:10px;">
				<button onclick="Wbs()" class="btn btn-primary">조회</button>
				<button onclick="finWbs()" class="btn btn-primary">정리</button><br><br><br><br>
				<input type="text" id="deleteNum" class="form-control" style="width: 100px; margin-right: 30px;" placeholder="Need No."><br>
				<button onclick="deleteWbs()" class="btn btn-primary">삭제</button>
			</div>
			</div>
		</div>
	</div>
	<h1>행추가는 대분류 혹은 중분류 다블클릭</h1>
<script type="text/javascript">
var Grid = tui.Grid;
var el;
var options;
var cnt = 0;
	const grid = new Grid({
			  el: document.getElementById('grid'),
			  rowHeaders: ['rowNum'],
			  columns: [
				 	 {
					    header: '대분류',
					    name: 'topName',
					    
					  },
					  {
						header:'중분류',
					    name: 'fbsName',
					  },
					  {
					    header: 'WBS 코드',
					    name: 'wbsCode',
					    editor: 'text'
					  },
					  {
					    header: 'WBS 이름',
					    name: 'wbsName',
					    editor: 'text'
					  },
					
					{
						header : '기능설명',
						name : 'wbsContent',
					    editor: 'text'
					}, 
					{
						header : '담당자',
						name : 'wbsManager',
					    editor: 'text',
					},
					{
						header : '시작일',
						name : 'wbsStartDate',
					    editor: 'text'
					},
					{
						header : '종료일',
						name : 'wbsEndDate',
					    editor: 'text'
					}
			]
		});
	var arrData = function (){
		
			$.ajax({
				url : "./selectWbs.do",
				method : "POST",
				success : function(result){
					console.log('안뇽하세용!!');
					console.log(result);
					console.log(result[0]);
					grid.resetData(result);
				}
			});
	}
function Wbs(){
		//GRID 에 데이터를 입력한다.
		arrData();
}
	class CustomTextEditor {
	      constructor(props) {
	        const el = document.createElement('input');

	        el.type = 'text';
	        el.value = String(props.value);

	        this.el = el;
	      }

	      getElement() {
	        return this.el;
	      }

	      getValue() {
	        return this.el.value;
	      }

	      mounted() {
	        this.el.select();
	      }
	    }
	grid.on('dblclick', (ev) => {
			console.log('after change:', ev);
			console.log('음 생각되로 되랑');
// 			console.log(grid.getRow(1));
			let jsonArr = grid.getRow(ev.rowKey);
// 		    console.log('@@@@@@@');
// 		    console.log(jsonArr.topName);
// 		    console.log(ev.columnName);

		    if(ev.columnName=='fbsName'){
		    	console.log(cnt);
		    	$.ajax({
					url : "./newWbsRow.do",
					method : "POST",
					async:false,
					data:jsonArr,
					success : function(result){
						cnt++;
						console.log('행추가 완료');
						$.ajax({
							url : "./selectWbs.do",
							method : "POST",
							success : function(result){
								console.log('셀렉WBS');
//		 						console.log(result);
// 		 						console.log(result[0]);
								grid.resetData(result);
							}
						});
					}
				});
	    	}	
	    })
	    
	    grid.on('editingFinish', (ev) => {
			console.log('after change:', ev);
			console.log('음 생각되로 되랑');
			console.log(grid.getRow(ev.rowKey));
			let jsonArr = grid.getRow(ev.rowKey);
		    console.log('!!!!!!!!!!!!!!!!!!!');
		    console.log(jsonArr.topName);
		    console.log(ev.columnName);
		    
		    if(jsonArr.wbsCode!=null && jsonArr.wbsName!=null
					&& jsonArr.wbsContent!=null && jsonArr.wbsManager!=null
					&& jsonArr.wbsStartDate!=null && jsonArr.wbsEndDate!=null){
		    	$.ajax({
					url : "./fixWbs.do",
					method : "POST",
					data:jsonArr,
					success : function(result){
						console.log('행추가 완료');
						console.log(result);
						$.ajax({
							url : "./selectWbs.do",
							method : "POST",
							success : function(result){
								console.log(result);
								console.log(result[0]);
								
								grid.resetData(result);
							}
						});
					}
				});
		    }
	    })

	function finWbs(){
		$.ajax({
			url : "./finWbs.do",
			method : "GET",
			success : function(result){
				console.log('작성이 완료지롱');
				Wbs();
			}
		});
    }
	
	function deleteWbs(){
		console.log('딜리트 WBS 동작띠');
		let deleteNum =	document.getElementById('deleteNum').value;
		
		$.ajax({
			url : "./deleteWbs.do",
			method : "POST",
			data:{"deleteNum":deleteNum},
			success : function(result){
				$.ajax({
					url : "./selectWbs.do",
					method : "POST",
					success : function(result){
						grid.resetData(result);
					}
				});
			}
		});
	}
		
	
</script>
</body>
</html>