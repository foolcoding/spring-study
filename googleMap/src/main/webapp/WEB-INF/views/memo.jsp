<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="frame">
		<h3>위치에 메모 작성</h3>
		<hr>
		<form method="POST" enctype="multipart/form-data">
<%-- 		<input type="hidden" name="member_idx" value="${login.idx }"> --%>
			<p><textarea rows="10" cols="40" name="memo"></textarea></p>
			<p><input type="file" name="upload" multiple></p>
			<p><input type="submit" value="작성"></p>
		</form>
	</div>
</body>
</html>