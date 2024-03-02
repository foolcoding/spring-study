<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02</title>
<script>
	const cpath = '${cpath}'	// JSP의 변수를 자바스크립트에 선언한다
</script>

<!-- 작성된 자바스크립트를 불러온다 (함수 정의를 불러온다) -->
<script type="text/javascript" src="${cpath }/resources/js/festival.js"></script>
</head>
<body>

<h1>ex02 - AJAX로 API데이터 요청하여 출력하기</h1>
<hr>
<h3>AJAX : Asynchronous Javascript And XML</h3>

<p>
	<button id = "run">실행</button>
	<input>
</p>

<div id="root"></div>

<script>
	// 문서에서 이벤트 대상 요소(HTML element)를 불러온다
	const run = document.getElementById('run')
	
	// 이벤트가 발생하면 실행할 함수를 정의한다 (.js파일에서 정의하는 것이 더 좋다)
	const clickHandler1 = async function(event){
		alert('테스트')
		const text = await clickHandler2()
		console.log(text)
		root.innerHTML = text
	}
	
	// 문서 요소의 특정 조건에 함수를 연결한다 (클릭하면 실행되도록 연결함)
	run.onclick = clickHandler1
</script>

</body>
</html>