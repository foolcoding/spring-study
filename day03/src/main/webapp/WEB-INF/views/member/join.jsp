<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<h3>회원가입</h3>
	<form method="POST">
<!-- 		<p> -->
<!-- 			<label><input type="radio" name="gender" value="남성" required>남성</label> -->
<!-- 			<label><input type="radio" name="gender" value="여성성" required>여성</label> -->
<!-- 		</p> -->
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="Name" required></p>
		<p><input type="email" name="email" placeholder="email" required></p>
		<p><input type="text" name="birth" placeholder="birth" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</section>

</body>
</html>