<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<style type="text/css">

#box{

	margin: auto;
	width: 1500px; 
	margin-top: 30px;

}

#title{
	text-align: center;
	font-size: 30px;
}

th{
	text-align: center;
}

td{
	text-indent: 5px;
}


</style>

<script type="text/javascript">
	function del(m_idx){
		
		//---------------------------------------------------------
		Swal.fire({
			  title: '정말 삭제하시겠습니까?',
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
					
					location.href = 'admin_delete.do?m_idx=' + m_idx; // MemberDeleteAction
					
				}
			});
		//--------------------------------------------------------
		
	}
</script>

</head>
<body>
	<div id="box">
	
		<h1 id="title">;;;;회원목록;;;;</h1>
		
		<!-- 데이터 출력 -->
		
		<div>
		
			<table class="table table_striped">
			
				<!-- table_title -->
				
				<tr class="info">
				
					<th>번호</th>
					<th>id</th>
					<th>pwd</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화</th>
					<th>가입날짜</th>
					<th>ip</th>
					<th>주민번호</th>
					<th>선호도서</th>
					<th>나이</th>
					<th>이름</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>회원등급</th>
					<th></th>
				
				</tr>
				
				<!-- 데이터가 없을 때 -->
				
				<c:if test="${ empty list }">
				
				<tr>
				
					<td colspan="17" align="center"><font color="red">회원이 없습니다</font></td>
				
				</tr>
				
				</c:if>
				
				<!-- 데이터 넣기 -->
				
				<c:forEach var="vo" items="${ list }">
				
				<tr>
				
					<td>${ vo.m_idx }</td>
					<td>${ vo.m_id }</td>
					<td>${ vo.m_pwd }</td>
					<td>${ vo.m_nick }</td>
					<td>${ vo.m_email }</td>
					<td>${ vo.m_ph }</td>
					<td>${ fn:substring(vo.m_date,0,10) }</td>
					<td>${ vo.m_ip }</td>
					<td>${ vo.m_jumin }</td>
					<td>${ vo.m_pref_book }</td>
					<td>${ vo.m_age }</td>
					<td>${ vo.m_name }</td>
					<td>${ vo.m_zipcode }</td>
					<td>${ vo.m_addr }</td>
					<td>${ vo.m_grade }</td>
					<td>
                    	<input class="btn btn-info"   type="button"  value="수정"
                           onclick="location.href='admin_modify_form.do?m_idx=${ vo.m_idx }';">
                    	<input class="btn btn-danger" type="button"  value="삭제"  onclick="del('${ vo.m_idx }');">
                	</td> 

				</tr>
				
				</c:forEach>
			
			</table>
		
		</div>
	
	</div>
</body>
</html>