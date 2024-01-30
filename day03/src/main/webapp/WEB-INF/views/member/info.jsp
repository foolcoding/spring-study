<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h3>회원 상세 정보</h3>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>ID</td>
			<td>${dto.userid }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${dto.userpw }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.username }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<td>생일</td>
			<td>${dto.birth }</td>
		</tr>
	</table>
	<p>
		<a href="${cpath }/member/modify/${dto.userid}"><button>정보수정</button></a>
	</p>

</section>

</body>
</html>