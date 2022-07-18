<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
#box {
	width: 750px;
	margin: auto;
	margin-top: 60px;
}

#id_msg {
	margin-left: 10px;
	width: 350px;
}
</style>

<!-- 우편번호 검사 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	var regular_id	=/^[a-zA-Z0-9]{3,16}$/;
	
	//문서네에 Element 배치가 완료 되면 펑션 시작해!
	$(document).ready(function(){
		
		//아이디 입력창에서 키가 입력되면
		$("#m_id").keyup(function(event){
			
			var m_id = $(this).val();
			
			if(regular_id.test(m_id)==false){
				
				$("#id_msg").html("영문 숫자 조합의 3자리 이상을 입력하세요").css("color","red");
				
				//가입하기 버튼 비 활성화
				$("#btn_register").attr("disabled", true);
				return;
				
				
			}
			
			
			//서버에 사용가는 여부 확인(jQuery Ajax)
			  $.ajax({
				  url		: 'check_id.do',			//MemberCheckIdAction
				  data		: {'m_id': m_id},			//parameter : check_id.do?m_id=one
				  dataType	: 'json',
				  success	: function(res_data){
					  //res_data = {"result": true }  //사용가능
					  //res_data = {"result": false}  //사용중(사용못함)
					  
					  if(res_data.result){//사용가능한 아이디
						  
						  $("#id_msg").html("사용가능한 아이디 입니다")
			                          .css("color","blue");
					  
					       //가입하기 버튼 활성화
					       $("#btn_register").attr("disabled", false);
						  
					  }else{//이미 사용중인 아이디
						  
						  $("#id_msg").html("이미 사용중인 아이디 입니다")
	                                  .css("color","red");
						  
					      //가입하기 버튼 비활성화
					      $("#btn_register").attr("disabled", true);
					  
					  }
					  
				  },
				  error		: function(err){
					  alert(err.responseText);
				  }
			  });
			  
		  });
		  
	  });
	
	
	function find(){
		  
		  var width  = 500; //팝업의 너비
		  var height = 600; //팝업의 높이
		  
		  new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            // data = {'zonecode':12345 ,'address':'서울시 마포구 노고산동','roadAddress':'', 'jibunAddress':'서울' }
		            
		            //선택된 주소의 우편번호 넣기
		            
		            $("#m_zipcode").val(data.zonecode);
		            
		          //선택된 주소의 주소 넣기
		            $("#m_addr").val(data.address);
		        },
		        theme: {
		            searchBgColor: "#0B65C8", //검색창 배경색
		            queryTextColor: "#FFFFFF" //검색창 글자색
		        },
		        width: width,
		        height: height
		  }).open(
				  //중앙에 띄우겠다 
				  {
					    left: (window.screen.width / 2) - (width / 2),
					    top: (window.screen.height / 2) - (height / 2)
			      }
				 ); 
	  }
	
	
	function send(f){
		
		//체크할 목록 :  id, pwd, 닉네임, e-mail, 전화번호, 이름, 주민번호, 나이, 우편번호, 주소
		var m_id		=	f.m_id.value.trim();
		var	m_pwd		=	f.m_pwd.value.trim();
		var	m_nick		=	f.m_nick.value.trim();
		var	m_email		=	f.m_email.value.trim();	
		var	m_ph		=	f.m_ph.value.trim();
		var	m_jumin		=	f.m_jumin.value.trim();
		var	m_age		=	f.m_age.value.trim();
		var	m_name		=	f.m_name.value.trim();
		var	m_zipcode	=	f.m_zipcode.value.trim();
		var	m_addr		=	f.m_addr.value.trim();
		
		
		if(m_id==''){
			
			alert("아이디를 입력하세요");
			f.m_id.value	=	'';
			f.m_id.focus();
			return;
			
		}
		
		if(m_pwd==''){
			
			alert("비번을 입력하세요");
			f.m_pwd.value	=	'';
			f.m_pwd.focus();
			return;
			
		}
		
		if(m_nick==''){
			
			alert("닉네임을 입력하세요");
			f.m_nick.value	=	'';
			f.m_nick.focus();
			return;
			
		}
		
		if(m_email==''){
			
			alert("이메일을 입력하세요");
			f.m_email.value	=	'';
			f.m_email.focus();
			return;
			
		}
		
		if(m_ph==''){
			
			alert("전화번호를 입력하세요");
			f.m_ph.value	=	'';
			f.m_ph.focus();
			return;
			
		}

		if(m_name==''){
			
			alert("이름을 입력하세요");
			f.m_name.value	=	'';
			f.m_name.focus();
			return;
			
		}
		
		if(m_jumin==''){
			
			alert("주민번호를 입력하세요");
			f.m_jumin.value	=	'';
			f.m_jumin.focus();
			return;
			
		}
		
		if(m_age==''){
			
			alert("나이를 입력하세요");
			f.m_age.value	=	'';
			f.m_age.focus();
			return;
			
		}
		
		if(m_zipcode==''){
			
			alert("우편번호를 입력하세요");
			f.m_zipcode.value	=	'';
			f.m_zipcode.focus();
			return;
			
		}
		
		if(m_addr==''){
			
			alert("주소를 입력하세요");
			f.m_addr.value	=	'';
			f.m_addr.focus();
			return;
			
		}
		
		
		f.action	=	"insert.do";//Member Insert Action
		f.submit();
		
		
		
	}
	
	



</script>


</head>
<body>
<form>
	<div id="box">

		<div class="panel panel-info">

			<div class="panel-heading">

				<h4>회원 가입</h4>

			</div>

			<div class="panel-body">

				<table class="table table-striped">

					<tr>

						<th>id</th>

						<td><input name="m_id" id="m_id" ><span id="id_msg"></span></td>

						<th>pwd</th>

						<td><input name="m_pwd" id="m_pwd" ></td>

					</tr>

					<tr>

						<th>닉네임</th>

						<td><input name="m_nick" id="m_nick" ></td>

						<th>e-mail</th>

						<td><input name="m_email" id="m_email" ></td>

					</tr>

					<tr>

						<th>전화번호</th>

						<td><input name="m_ph" id="m_ph" ></td>

						<th>이름</th>

						<td><input name="m_name" id="m_name" ></td>

					</tr>

					<tr>

						<th>주민번호</th>

						<td><input name="m_jumin" id="m_jumin" ></td>

						<th>나이</th>

						<td><input name="m_age" id="m_age" ></td>

					</tr>

					<tr>

						<th>우편번호</th>

						<td colspan="4">
							<input name="m_zipcode" id="m_zipcode">

							<input type="button" value="주소찾기" onclick="find();">
						</td>

					</tr>

					<tr>

						<th>주소</th>

						<td colspan="4"><input name="m_addr" id="m_addr" size="70"></td>

					</tr>
						
					<tr>	
						
						<th>선호장르</th>
						
						<td colspan="2">
							
							<select name="m_pref_book">
					
								<option value="n">선택</option>
								<option value="a">공포</option>
								<option value="b">유머</option>
					
							</select>
					
						</td>
						
					</tr>	

					<tr>

						<td colspan="4" align="center">
							<input class="btn btn-info" id="btn_register" type="button" value="가입하기" onclick="send(this.form)" disabled="disabled"> 
							<input class="btn btn-default" type="button" value="취소" onclick="location.href='../main/main.do'">
						</td>

					</tr>

				</table>

			</div>

		</div>

	</div>

	</form>

</body>
</html>