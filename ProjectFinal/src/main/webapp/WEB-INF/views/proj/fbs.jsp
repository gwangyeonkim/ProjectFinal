<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./css/tui-grid.css"> -->
<!-- <script type="text/javascript" src="./js/tui-grid.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<title>FBS</title>
<%@ include file="../header.jsp" %>
<style type="text/css">
	.nav {
	width:1400px;
	height: 80px;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="content" style="width: 1400px;">
			<div id="grid" style="width: 890px;">
				<button onclick="Fbs()">조회</button>
				<button onclick="newRow()">행추가</button>
				<button onclick="finFbs()">완료</button>
			</div>
		</div>
	</div>
	<button onclick="location.href='./fbs.do'">FBS 이동</button>
	<button onclick="location.href='./wbs.do'">WBS 이동</button>
	<button onclick="location.href='./moveFixhistory.do'">작성이력 이동</button>
<!-- <button id="fixBtn">모달열기</button> -->
<div class="modal fade" id="fixModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>
                            작성이력
                        </h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form action="./newFix.do" method="post">
                            <div class="form-group">
                                <label for="usrname">
                                    <span>작성자 이름</span>
                                </label>
                                <input type="text" class="form-control" name="fixName">
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    작성 이력
                                </label>
                                <input type="text" class="form-control" name="fixContent">
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
$(document).ready(function () {
    $("#fixBtn").click(function () {
        $("#fixModal").modal();
    });
});

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
		$("#fixModal").modal();
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

</html>