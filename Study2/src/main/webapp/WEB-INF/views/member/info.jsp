<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h3>회원 상세 정보 [ ${dto.idx } ]</h3>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>ID</td>
			<td>${dto.userid }</td>
		</tr>
		<tr>
			<td>PW</td>
			<td>********</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>${dto.username }</td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>${dto.gender }</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>${dto.email }</td>
		</tr>
	</table>
	<p>
		<a href="${cpath }/member/modify/${dto.idx }"><button>정보수정</button></a>
	</p>
</section>

</body>
</html>