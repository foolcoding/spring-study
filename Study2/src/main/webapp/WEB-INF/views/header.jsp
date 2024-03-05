<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day04 - member</title>
<style>
	header, section{
		width:1200px;
		margin:auto;
	}
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color:#dadada;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">day04</a></h1>
	<div id="login" style="height: 40px;">
		<c:if test="${not empty login }">
		<p>
			${login.username }님 로그인중
			<a href="${cpath }/member/logout"><button>로그아웃</button></a>
		</p>
		</c:if>
	</div>
	<nav>
		<ul style="display: flex; padding:0; list-style:none; justify-content: space-around;">
			<li><a href="${cpath }/member/list">회원목록</a></li>
			<li><a href="${cpath }/member/login">로그인</a></li>
			<li><a href="${cpath }/board/list/1">게시판</a></li>
		</ul>
	</nav>
</header>