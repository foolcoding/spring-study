<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
table{
		border-collapse: collapse;
		width: 800px;
		margin: 20px auto;
	}
	td, th{
		padding: 10px;
	}
	tbody > tr{
		border-bottom: 1px solid grey;
	}
	tbody > tr > td:nth-child(1){width:20%;}
	tbody > tr > td:nth-child(2){width:80%; border-left: 1px solid grey;}
	tbody > tr > td{
		text-align: center;
	}
	tbody > tr > td:nth-child(2){
		text-align:left;
	}
</style>

<section>
<h3>게시글 수정</h3>
<form method="POST">
<table>
	<tr>
		<td colspan="2"><h4>${dto.isNotice == 1 ? '공지사항' : dto.idx}</h4></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${dto.title }" required autofocus></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${dto.writer }" readonly></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="resize:none; width:600px; height:200px;">${dto.content }</textarea>
		</td>
	</tr>
	<c:if test="${login.userid == 'admin' && dto.isNotice != 1}">
	<tr>
		<td></td>
		<td>
			<label>
				<input type="checkbox" name="isNotice" value="1">
				공지로 수정하기
			</label>
		</td>
	</tr>
	</c:if>
</table>
<button>수정완료</button>
</form>


</section>

</body>
</html>