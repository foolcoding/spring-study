<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h3>항목 수정</h3>
	<form method="POST">
		<p><input type="text" name="userid" value="${dto.userid }" readonly></p>
		<p><input type="password" name="userpw" required></p>
		<p><input type="text" name="username" value="${dto.username }" required></p>
		<p><input type="email" name="email" value="${dto.email }" required></p>
		<p><input type="text" name="birth" value="${dto.birth }" required></p>
		<p><input type="submit" value="회원정보 수정"></p>
	</form>
</section>

</body>
</html>