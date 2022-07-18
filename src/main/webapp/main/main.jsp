<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	background-color: #EEEEEE;
	color: white;
	margin: 0;
	padding: 0;
	font-size: 1.2em;
	font-family: cursive;
}

header {
	color: white;
	background-color: black;
	padding: 20px;
}

section {
	background-color: rosybrown;
	padding: 20px;
	color: black;
	display: flex;
	flex-direction: row-reverse;
}

footer {
	background-color: black;
	padding: 20px;
}

section>div {
	background-color: blueviolet;
	margin: auto;
	width: 100%;
	height: 150px;
	padding: 10px;
	list-style-type: none;
	border: 4px solid #aaaaaa;
	overflow: hidden; /* 자식영역이 
				부모영역보다 크면 오버된 영역 감추기 */
	position: relative;
	/* 부모가 relative가 아닌 static이면 자식은 absolute로 잡을 수 없다 */
}

ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	float: left;
}

li {
	display: inline;
	margin: 0 20px 0 0;
}

#box2>ul>li>img {
	width: 200px;
	height: 150px;
}

#search {
	border-style: dotted;
	border-width: 2px;
	padding: 5px;
	margin: 0;
	display: flex;
	flex-direction: row-reverse;
}

#canvas_section {
	display: block;
}

#canvas {
	margin: 10px;
	padding: 10px;
	background: cornsilk;
	border: thin inset #aaaaaa;
}

#box2 {
	border: 2px solid red;
	width: 2000px;
	height: 200px;
	margin: 0px;
	padding: 0px;
	position: absolute; /* 부모(box1)를 기준으로 절대좌표  */
	left: 0px;
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

	<header>
		<nav>
		
			<ul>
			
				<li>상품</li>
				
				<li>location</li>
				
				<li>contect</li>
			
			</ul>
			
			<div>
			
				<h1 style="display: inline;">좋은 책 4989</h1>
				
				<div align="right">
					<!-- input은 form 띄울거임 -->
	     			<!-- 로그인이 안된경우 -->
	     				
	     				<c:if test="${ empty sessionScope.user }">
	     				
	     					<input type="button" value="로그인" onclick="location.href='../member/login_form.do';">

							<input id="singup" value="회원가입" type="button" onclick="location.href='../member/insert_form.do';">
	     				
	     				</c:if>
	     
	     			<!-- 로그인이 된경우 -->
	     				
	     				<c:if test="${ not empty sessionScope.user }">
	     				
	     					<b>${ user.m_name }님 환영합니다</b>
	     					
	     					<input type="button" value="로그아웃" onclick="location.href='../member/logout.do';">
	     					
	     					<input id="m_modify" value="정보수정" type="button" onclick="location.href='../member/modify_form.do?m_idx=${ user.m_idx }';">
	     					
	     				</c:if>
	  
  
  
  					<!-- 관리자인 경우 노출되는 메뉴 -->
  					
  						<c:if test="${ user.m_grade eq '관리자' }">
  						
  							<input type="button" value="회원관리" onclick="location.href='../member/list.do';">
  						
  						</c:if>
  				
				

				</div>				
				
			</div>
			
			<div id="search">search</div>
		
		</nav>
	
	</header>
	
	<section id="tripple">
	
		<div id="box1">
		<div id="box2">
			<ul>
			
				<li>
				
					<img alt="이미지1" src="../images/movie1.jpg">
				
				</li>
				
				<li>
				
					<img alt="이미지2" src="../images/movie2.jpg">
				
				</li>
				
				<li>
				
					<img alt="이미지3" src="../images/movie3.jpg">
				
				</li>
				
				<li>
				
					<img alt="이미지1" src="../images/movie1.jpg">
				
				</li>
				
				<li>
				
					<img alt="이미지2" src="../images/movie2.jpg">
				
				</li>
				
				<li>
				
					<img alt="이미지3" src="../images/movie3.jpg">
				
				</li>
			
			</ul>
		</div>
		</div>
		
	</section>
	
	<section id="canvas_section">
	
		<canvas id="canvas" width="400" height="300">
		aaa
		</canvas>
	
	</section>
	
	<footer>
	
		footer
	
	</footer>

</body>
</html>