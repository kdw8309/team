<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* { 
/* 		브라우저마다 CSS 기본값 차이 */
		margin: 0px;
		padding: 0px; 
	}
	
	.eventBox{
		width: 700px;
		height: 250px;
		background-color: #cccccc;
		margin-left: 150px;
		margin-top:30px;
	}
	
	#posterBox {
		margin-left: 100px;
		margin-top:30px;
	}
	
	
	#box1 {
		width: 800px;
		height: 200px;
		background-color: white;
		border: 4px solid #aaaaaa;
		overflow:hidden;   /* 자식영역이 
		부모영역보다 크면 오버된 영역 감추기 */
		position: relative;
		/* 부모가 relative가 아닌 static이면 자식은 absolute로 잡을 수 없다 */
	}
	
	
	#box2{
	    border: 2px solid  red;
		width: 2000px;
		height: 200px;
		margin: 0px;
		padding: 0px;
		position: absolute;/* 부모(box1)를 기준으로 절대좌표  */
		left:0px;
	}
	
	
	#box2 ul li {
		/* . 안보이게  */
		list-style-type: none; 
		/* 이미지가 옆으로 나란해보이게 하기 */
		float: left;
		margin: 0px;
		padding: 0px;
		
	}
	
	#box2 ul li img {
		/* 사진 1장 의 크기  */
		width: 110px;
		height: 200px;
		margin-right: 5px; 
	}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 1초에 한번씩 함수 수행 
		setInterval( moveImage , 100);// cf) setTimeout(fn,시간);
	});
	
	function moveImage(){
		$("#box2").animate(
			{"left":"-=10"},80, function(){
				// 현재 left속성값 얻기
				var left = 
				parseInt($("#box2").css("left"));
					console.log(left);
					if(left<-910){
						// 오른쪽에서 다시 나오게 하기 
						$("#box2").css("left","0px");
					}
			});
	}

</script>

</head>
<body>
	<div id="posterBox">
		<h2>피카디리</h2>
		
		<div id="box1">
			<div id="box2">
				<ul>
					<li>
						<img src="images/movie1.jpg" />
					</li>
					<li>
						<img src="images/movie2.jpg" />
					</li>
					<li>
						<img src="images/movie3.jpg" />
					</li>
					
					
					
					<li>
						<img src="images/movie1.jpg" />
					</li>
					<li>
						<img src="images/movie2.jpg" />
					</li>
					<li>
						<img src="images/movie3.jpg" />
					</li>
				
				</ul>			
			</div>
		</div>
	</div>
</body>
</html>