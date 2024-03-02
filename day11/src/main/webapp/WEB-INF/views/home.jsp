<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="frame">
	<h1>day11</h1>
	<hr>
	<h3>오늘은 <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일"/>입니다</h3>

	<a href="${cpath }/goods/list/1">상품 목록</a>
	<a href="${cpath }/revenue/list/1">매출 목록</a>
</div>

</body>
</html>