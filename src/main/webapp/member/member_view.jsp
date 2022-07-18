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



</head>
<body>
	
	<div id="box">

		<div class="panel panel-info">

			<div class="panel-heading">

				<h4>수정 결과</h4>

			</div>

			<div class="panel-body">

				<table class="table table-striped">
					
					<tr>

						<th colspan="2">id : ${ vo.m_id }</th>

					</tr>

					<tr>

						<th>닉네임 : ${ vo.m_nick }</th>

						<th>e-mail : ${ vo.m_email }</th>

					</tr>

					<tr>

						<th>전화번호 : ${ vo.m_ph }</th>

						<th>이름 : ${ vo.m_name }</th>

					</tr>

					<tr>

						<th>주민번호 : ${ vo.m_jumin }</th>

						<th>나이 : ${ vo.m_age }</th>

					</tr>

					<tr>

						<th colspan="2">우편번호 : ${ vo.m_zipcode }</th>

					</tr>

					<tr>

						<th colspan="2">주소 : ${ vo.m_addr }</th>

					</tr>
						
					<tr>	
						
						<th>선호장르 : ${ vo.m_pref_book }</th>
						
					</tr>
					
					<tr>

						<td colspan="2" align="center">
							
							<input class="btn btn-info" id="btn_regster" type="button" value="확인" onclick="location.href='../main/main.do';"> 
							
						</td>

					</tr>
				
				</table>

			</div>

		</div>

	</div>

</body>
</html>