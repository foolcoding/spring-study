<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<form method="POST" enctype="multipart/form-data">
	<input type="hidden" name="writer" value="${login.userid }">
		<p><input type="text" name="title" placeholder="설문 제목" required></p>
		<p>
			<textarea rows="10" cols="60" name="question" required></textarea>
		</p>
		<p><input type="file" name="upload" multiple required></p>
		<p><input type="text" name="memoA" placeholder="선택지1" required></p>
		<p><input type="text" name="memoB" placeholder="선택지2" required></p>
		<p><input type="submit" value="작성"></p>
	</form>
</div>





</body>
</html>