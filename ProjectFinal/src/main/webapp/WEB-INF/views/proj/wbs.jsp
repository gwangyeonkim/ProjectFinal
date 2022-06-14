<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./css/tui-grid.css"> -->
<!-- <script type="text/javascript" src="./js/tui-grid.js"></script> -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<title>FBS</title>
</head>
<body>
<div id="grid"></div> 
<button onclick="Wbs()">조회</button>
<button onclick="finWbs()">완료</button>
<h1>행추가는 대분류 혹은 중분류 다블클릭</h1>
<script type="text/javascript">
var Grid = tui.Grid;
var el;
var options;
	const grid = new Grid({
			  el: document.getElementById('grid'),
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
		    	$.ajax({
					url : "./newWbsRow.do",
					method : "POST",
					data:jsonArr,
					success : function(result){
						console.log('행추가 완료');
// 						console.log(result);
						$.ajax({
							url : "./selectWbs.do",
							method : "POST",
							success : function(result){
								console.log('셀렉WBS');
//		 						console.log(result);
		 						console.log(result[0]);
								grid.resetData(result);
							}
						});
					}
				});
		    }
// 		    if(ev.columnName=='topName'){
// 		    	$.ajax({
// 					url : "./newWbsRow.do",
// 					method : "POST",
// 					data:jsonArr,
// 					success : function(result){
// 						console.log('행추가 완료');
// 						console.log(result);
// 						$.ajax({
// 							url : "./selectWbs.do",
// 							method : "POST",
// 							success : function(result){
// 								console.log(result);
// 								console.log(result[0]);
								
// 								grid.resetData(result);
// 							}
// 						});
// 					}
// 				});
// 		    }
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
	    
	    
}

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
		
	
</script>
</body>
</html>