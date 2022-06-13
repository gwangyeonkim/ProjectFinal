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
<button onclick="Fbs()">조회</button>
<button onclick="newRow()">행추가</button>
<button onclick="finFbs()">완료</button>
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
	var arrData = function (){
		
			$.ajax({
				url : "./selectFbs.do",
				method : "POST",
				success : function(result){
					console.log('안뇽하세용!!');
					console.log(result);
					console.log(result[0]);
					grid.resetData(result);
				}
			});
	}
function Fbs(){
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
	
	grid.on('editingFinish', (ev) => {
	       	console.log('after change:', ev);
			console.log('음 생각되로 되랑');
			console.log(grid.getRow(1));
			let jsonArr = grid.getRow(ev.rowKey);
		    console.log('@@@@@@@');
		    console.log(jsonArr.topName);
		    console.log(jsonArr.topCode);
		    
		    
		    
			if(jsonArr.topName!=null && jsonArr.topCode!=null
					&& jsonArr.fbsName==null && jsonArr.fbsCode==null && jsonArr.fbsContent==null
					&& jsonArr.fbsImp==null && jsonArr.fbsLevel==null && jsonArr.fbsManager==null){
				console.log('대분류 작성');
				  $.ajax({
	 				url : "./matchTopCategory.do",
	 				method : "POST",
	 				data:jsonArr,
	 				success : function(result){
	 					console.log('대분류 저장했습니다.');
	 					}
	 				});
			}else if(jsonArr.topName!=null && jsonArr.topCode!=null
					&& jsonArr.fbsName!=null && jsonArr.fbsCode!=null && jsonArr.fbsContent!=null
					&& jsonArr.fbsImp!=null && jsonArr.fbsLevel!=null && jsonArr.fbsManager!=null){
				console.log('대분류 작성');
				  $.ajax({
	 				url : "./matchTopCategory.do",
	 				method : "POST",
	 				data:jsonArr,
	 				success : function(result){
	 					console.log('대분류 저장했습니다.');
	 					}
	 				});
			}
			
	    })
	    
	    
}

	function newRow(){
		$.ajax({
			url : "./newFbsRow.do",
			method : "GET",
			success : function(result){
				console.log('행추가 완료');
				console.log(result);
				$.ajax({
					url : "./selectFbs.do",
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
	
	function finFbs(){
		$.ajax({
			url : "./finFbs.do",
			method : "GET",
			success : function(result){
				console.log('작성이 완료지롱');
				Fbs();
			}
		});
     	
    }
		
	
</script>
</body>
</html>