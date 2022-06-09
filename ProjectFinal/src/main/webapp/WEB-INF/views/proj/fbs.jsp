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
<button onclick="newFbs()">작성</button>
<script type="text/javascript">
var Grid = tui.Grid;
var el;
var options;
var data;
const grid = new Grid({
		  el: document.getElementById('grid'),
		  columns: [
			 	 {
				    header: '대분류',
				    name: 'topName',
				    editor: 'text'
				  },
				  {
					header:'대분류 코드',
				    name: 'topCode',
				    editor: 'text'
				  },
				  {
				    header: '중분류',
				    name: 'fbsName',
				    editor: 'text'
				  },
				  {
				    header: '중분류 코드',
				    name: 'fbsCode',
				    editor: 'text'
				  },
				
				{
					header : '기능설명',
					name : 'fbsContent',
				    editor: 'text'
				}, 
				{
					header : '중요도',
					name : 'fbsImp',
				    editor: 'text',
				},
				{
					header : '난이도',
					name : 'fbsLevel',
				    editor: 'text'
				},
				{
					header : '담당자',
					name : 'fbsManager',
				    editor: 'text'
				}
		]
	});
	//GRID 에 데이터를 입력한다.
	var arrData = 
		$.ajax({
			url : "./selectFbs.do",
			method : "POST",
			success : function(result){
				console.log('안뇽하세용');
// 				 for (var i = 0; i < result.size(); i++) {
// 					grid.resetData(result(i));
// 			    }
				console.log(result);
				console.log(result[0]);
				
				grid.resetData(result);
			}
		});
	
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
	      console.log('after change:', ev.rowKey);
	      console.log('after change:', ev.columnName);
	      
	    })
	    
// 	    grid.on('click', (ev) => {
// 			console.log(ev.rowKey);
// 		});
// 	    grid.resetData(gridData);
</script>
</body>
</html>