<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<h3>회원가입</h3>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="Name" required></p>
		<p><input type="email" name="email" placeholder="email" required></p>
		<p><input type="text" name="birth" placeholder="birth" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</div>

</body>
</html>