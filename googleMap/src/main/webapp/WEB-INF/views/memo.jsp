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
		<h3>��ġ�� �޸� �ۼ�</h3>
		<hr>
		<form method="POST" enctype="multipart/form-data">
<%-- 		<input type="hidden" name="member_idx" value="${login.idx }"> --%>
			<p><textarea rows="10" cols="40" name="memo"></textarea></p>
			<p><input type="file" name="upload" multiple></p>
			<p><input type="submit" value="�ۼ�"></p>
		</form>
	</div>
</body>
</html>