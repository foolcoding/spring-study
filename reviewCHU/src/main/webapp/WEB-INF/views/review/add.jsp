<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<h3>리뷰 작성</h3>
	<hr>
	<form method="POST" enctype="multipart/form-data">
		<input type="hidden" name="writer" value="${login.userid }">
		<p><input type="text" name="title" placeholder="제목" required autofocus></p>
		<p>
			<textarea rows="10" cols="80" name="content"></textarea>
		</p>
		<p><input type="file" name="upload"></p>
		<p><input type="submit" value="작성"></p>
	</form>
</div>

</body>
</html>