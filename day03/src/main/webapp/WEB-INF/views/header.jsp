<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header, section{
		width: 900px;
		margin: auto;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">day03</a></h1>
	<div id="login">
		<c:if test="${not empty login }">
		<p>
			${login.username } 님 로그인 중
			<a href="${cpath }/member/logout"><button>로그아웃</button></a>
		</p>
		</c:if>
	</div>
	<nav>
		<ul style="display: flex; padding: 0; list-style: none; justify-content: space-around;">
			<li><a href="${cpath }/member/list">회원목록</a></li>
			<li><a href="${cpath }/member/login">로그인</a></li>
		</ul>
	</nav>
</header>