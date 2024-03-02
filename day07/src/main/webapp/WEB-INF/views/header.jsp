<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day07</title>
<style>
	.frame{
		width: 1000px;
		margin: 0 auto;
	}
	.sb{
		display: flex;
		justify-content: space-between;
	}
	.flex{
		display: flex;
	}
	nav > p:nth-child(n+2){
		margin-left: 30px;
	}
	a{
		text-decoration: none;
	}
	a:hover{
		font-weight: bold;
	}
</style>
</head>
<body>

<header class="frame">
	<h1><a href="${cpath }">day07</a></h1>
	<nav class="flex">
		<p><a href="${cpath }/survey/list/1">설문 목록</a></p>
		<c:if test="${not empty login }">
			<p><a href="${cpath }/member/logout">로그아웃</a></p>
			<p><a href="${cpath }/member/delete/${login.userid}">회원탈퇴</a></p>
		</c:if>
		<c:if test="${empty login }">
			<p><a href="${cpath }/member/login">로그인</a></p>
			<p><a href="${cpath }/member/join">회원가입</a></p>
		</c:if>
	</nav>
	<div>현재 접속중인 유저명 : ${login.username }</div>
</header>
