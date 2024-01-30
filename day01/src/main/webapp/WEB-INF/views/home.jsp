<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<h3>접속된 DB 버전 : ${version }</h3>
<h3>현재 시간 : ${sysdate }</h3>

<a href="member"><button>member</button></a>
</body>
</html>
