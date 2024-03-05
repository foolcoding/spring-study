<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h3>회원 정보 수정 [ ${dto.idx } ]</h3>
	<form method="POST">
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>ID</td>
			<td><input type="text" name="userid" value="${dto.userid }" readonly></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="userpw" required></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="username" value="${dto.username }"required></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<label><input type="radio" name="gender" value="남성" ${dto.gender == '남성' ? 'checked':"" } required>남성</label>
				<label><input type="radio" name="gender" value="여성" ${dto.gender == '여성' ? 'checked':"" } required>여성</label>
			</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="text" name="email" value="${dto.email }" required></td>
		</tr>
	</table>
	<p>
		<button>수정완료</button>
	</p>
	</form>
</section>

</body>
</html>