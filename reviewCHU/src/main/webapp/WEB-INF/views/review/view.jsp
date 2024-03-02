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
	tr{
		border-bottom: 1px solid grey;
	}
	tr > td:nth-child(1){width:20%;}
	tr > td:nth-child(2){width:80%; border-left: 1px solid grey;}
	tr > td{
		text-align: center;
	}
	tr > td:nth-child(2){
		text-align:left;
	}
	table > tr:nth-child(5) {
		text-align: center;
	}
	pre{
		width: 600px;
		word-wrap: break-word;
		white-space: pre-wrap;
	}
</style>

<div class="frame">
	<h3>리뷰 상세보기</h3>
	<hr>
	<table>
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
		<tr>
			<td>작성날짜</td>
			<td>${dto.uploadDate }</td>
		</tr>
		<tr>
			<td><img src="${cpath }/upload/${dto.img }" height="150px"></td>
		</tr>
	</table>
	
	<div style="display:flex; width:800px; margin:20px auto;">
		<div>
			<a href="${cpath }/review/delete/${dto.idx}"><button>삭제</button></a>
		</div>
	</div>
</div>

</body>
</html>