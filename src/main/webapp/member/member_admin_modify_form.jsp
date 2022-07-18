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

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
		var m_jumin		=	f.m_jumin.value.trim();
		var	m_name		=	f.m_name.value.trim();
		var	m_zipcode	=	f.m_zipcode.value.trim();
		var	m_addr		=	f.m_addr.value.trim();
		
		
		
		if(m_id==''){
			
			alert("아이디를 입력하세요");
			f.m_pwd.value	=	'';
			f.m_pwd.focus();
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
		
		Swal.fire({
			  title: '수정하시겠습니까??',
			  text: "수정되었습니다",
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네 수정하겠습니다',
			  cancelButtonText: '아니요 수정하지 않겠습니다'
			}).then((result) => {
			  	//삭제 버튼 누룬 후 실행(비동기 이기 때문)
				if (result.isConfirmed) {
			    	
				  	
					alert('수정되었습니다');
					
					f.action = "admin_modify.do";//MemberModifytAction
					f.submit();
				  	
			  }
			});
		
		
		
	}
	
	



</script>

<script type="text/javascript">
	function del(m_idx){
		
		//---------------------------------------------------------
		Swal.fire({
			  title: '정말 탈퇴하시겠습니까?',
			  html: "<h5>회원정보가 삭제됩니다</h5>",
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText:  '취소'
			}).then((result) => {
				  
				//삭제버튼을 누르면..
				if (result.isConfirmed) {
					
					location.href = 'delete.do?m_idx=' + m_idx; // MemberDeleteAction
					
				}
			});
		//--------------------------------------------------------
		
	}
</script>


</head>
<body>
<form>
	
	<input type="hidden" name="m_idx" value="${ vo.m_idx }">
	
	<div id="box">

		<div class="panel panel-info">

			<div class="panel-heading">

				<h4>회원 정보 수정</h4>

			</div>

			<div class="panel-body">

				<table class="table table-striped">

					<tr>

						<th>id</th>

						<td>
							
							<input name="m_id" value="${ vo.m_id }">
								
						</td>

						<th>pwd</th>

						<td><input name="m_pwd" id="m_pwd" value="${ vo.m_pwd }"></td>

					</tr>

					<tr>

						<th>닉네임</th>

						<td><input name="m_nick" id="m_nick" value="${ vo.m_nick }"></td>

						<th>e-mail</th>

						<td><input name="m_email" id="m_email" value="${ vo.m_email }"></td>

					</tr>

					<tr>

						<th>전화번호</th>

						<td><input name="m_ph" id="m_ph" value="${ vo.m_ph }"></td>

						<th>이름</th>

						<td><input name="m_name" id="m_name" value="${ vo.m_name }"></td>

					</tr>

					<tr>

						<th>주민번호</th>

						<td><input name="m_jumin" id="m_jumin" value="${ vo.m_jumin }"></td>

						<th>나이</th>

						<td><input name="m_age" id="m_age" value="${ vo.m_age }"></td>

					</tr>

					<tr>

						<th>우편번호</th>

						<td colspan="4">
							<input name="m_zipcode" id="m_zipcode" value="${ vo.m_zipcode }">

							<input type="button" value="주소찾기" onclick="find();">
						</td>

					</tr>

					<tr>

						<th>주소</th>

						<td colspan="4"><input name="m_addr" id="m_addr" size="70" value="${ vo.m_addr }"></td>

					</tr>
						
					<tr>	
						
						<th>선호장르</th>
						
						<td colspan="4">
						
							<input readonly="readonly" value="${ vo.m_pref_book }">
							
							<select name="m_pref_book">
					
								<option value="n">선택</option>
								<option value="a">공포</option>
								<option value="b">유머</option>
					
							</select>
					
						</td>
						
					</tr>
					
					<tr>	
						
						<th>등급</th>
						
						<td colspan="4">
						
							<input readonly="readonly" value="${ vo.m_grade }">
							
							<select name="m_grade">
					
								<option value="일반">일반</option>
								<option value="관리자">관리자</option>
					
							</select>
					
						</td>
						
					</tr>

					<tr>

						<td colspan="4" align="center">
							<input class="btn btn-info" id="btn_regster" type="button" value="수정하기" onclick="send(this.form)"> 
							<input class="btn btn-default" type="button" value="취소" onclick="location.href='list.do';">
						</td>

					</tr>

				</table>

			</div>

		</div>

	</div>

	</form>

</body>
</html>