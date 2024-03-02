<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<h3>상품 추가</h3>
	<hr>
	<form method="POST" enctype="multipart/form-data">
		<p><input type="text" name="title" placeholder="상품 이름" required autofocus></p>
		<p><input type="number" name="price" placeholder="상품 가격" required></p>
		<p><input type="file" name="upload" required></p>
		<p><input type="submit" name="추가">
	</form>
</div>

</body>
</html>