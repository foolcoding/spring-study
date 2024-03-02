<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="frame">
	<h3>피뷰</h3>
	<hr>
	<a href="${cpath }/review/list/1">리뷰목록</a>
	<a href="${cpath }/account/join">회원가입</a>
	<c:if test="${empty login }">
		<a href="${cpath }/account/login">로그인</a>
	</c:if>
	<c:if test="${not empty login }">
		<a href="${cpath }/account/logout">로그아웃</a>
	</c:if>
</div>
</body>
</html>