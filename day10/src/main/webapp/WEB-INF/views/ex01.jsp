<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex01 - 두 정수의 덧셈</h1>
<hr>

<p>
	<input type="number" name="n1" min="0" max="20" placeholder="n1">
	+
	<input type="number" name="n2" min="0" max="20" placeholder="n2">
	<button id="btn">=</button>
	<span id="result"></span>
</p>

<script>
	const btn = document.getElementById('btn')
	const clickHandler = function(){
		const n1 = document.querySelector('input[name="n1"]').value
		const n2 = document.querySelector('input[name="n2"]').value
		const url = '${cpath}/ex01Ajax?n1=' + n1 + '&n2=' + n2
				
		fetch(url)
			.then(resp => resp.text())
			.then(text =>{
				// 실행할 내용
				const result = document.getElementById('result')
				result.innerText = text
			})
	}
	btn.onclick = clickHandler
</script>

</body>
</html>