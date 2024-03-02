<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath  }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.frame{
		width: 1000px;
		margin: 20px auto;
	}
	
	.item{
		width: 200px;
	}
	
	.sb{
		display: flex;
		justify-content: space-between;
	}
	.se {
		width: 900px;
		margin: 20px auto;
		display: flex;
		justify-content: space-evenly;
	}
	.flex{
		display: flex;
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	a:hover{
		text-decoration: underline;
	}
</style>
</head>
<body>
