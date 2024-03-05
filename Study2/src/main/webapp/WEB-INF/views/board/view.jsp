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
<h3>게시글 조회</h3>
<table>
	<tr>
		<td colspan="2"><h4>${dto.isNotice == 1 ? '공지사항' : dto.idx}</h4></td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.writer}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><pre>${dto.content }</pre></td>
	</tr>
</table>

<div style="display:flex; width:800px; margin:20px auto; justify-content: space-between;">
	<div></div>
	<div>
		<a href="${cpath }/board/modify/${dto.idx}"><button>수정</button></a>
		<a href="${cpath }/board/delete/${dto.idx}"><button>삭제</button></a>
	</div>
</div>
</section>

</body>
</html>