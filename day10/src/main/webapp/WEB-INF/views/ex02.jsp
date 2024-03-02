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

<h1>ex02 - 두 정수의 덧셈</h1>
<hr>

<p>
	${n1 } + ${n2 }
	<input type="number" name="user" min="0" max="100" placeholder="정답 입력">
	<button id="btn">확인</button>
</p>
<h3 id="result"></h3>

<script>
	const btn = document.getElementById('btn')

	const clickHandler = function(){
		const user = document.querySelector('input[name="user"]').value
		const url = '${cpath}/ex02Ajax?user=' + user
		
		fetch(url)
			.then(resp => resp.text())
			.then(text => {
				const result = document.getElementById('result')
				result.innerText = text
			})
	}
	
	btn.onclick = clickHandler
</script>

</body>
</html>