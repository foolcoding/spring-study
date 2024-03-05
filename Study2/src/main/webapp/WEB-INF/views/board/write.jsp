<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section>
<h3>게시글 작성</h3>
<form method="POST">
<table>
	<tr>
		<td colspan="2"><h4>${dto.isNotice == 1 ? '공지사항' : dto.idx}</h4></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" placeholder="제목" required autofocus></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${login.userid }" readonly></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" placeholder="내용을 작성하세요"
					style="resize:none; width:600px; height:200px;"></textarea></td>
	</tr>
	<c:if test="${login.userid == 'admin' }">
	<tr>
		<td></td>
		<td>
			<label>
				<input type="checkbox" name="isNotice" value="1">
				공지로 등록하기
			</label>
		</td>
	</tr>
	</c:if>
</table>
<button>작성완료</button>
</form>
</section>


</body>
</html>