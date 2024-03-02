<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	table{
		border-collapse: collapse;
		width: 600px;
		margin: 20px auto;
		border: 1px solid grey;
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

<section class="frame">
<details>
		<summary>결과</summary>
		<ul>
			<li>
				${dto.memoA } : 
				<c:forEach var="c1" items="${list }" >${c1.answer == dto.memoA ? c1.count : ""} </c:forEach>
			</li>
			<li>
				${dto.memoB } : 
				<c:forEach var="c1" items="${list }" >${c1.answer == dto.memoB ? c1.count : "" }</c:forEach>
			</li>
		</ul>
</details>
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
		<td><pre>${dto.question }</pre></td>
	</tr>
	<tr>
		<td>기능</td>
		<td>
			<a href="${cpath }/survey/delete/${idx}"><button>삭제</button></a>
			<a href="${cpath }/survey/modify/${idx}"><button>수정</button></a>
		</td>
	</tr>
</table>

<div style="display:flex; justify-content: center;">
	<div>
		<form method="POST">
			<p><input type="hidden" name="sv_idx" value="${dto.idx }"></p>
			<p><input type="hidden" name="m_userid" value="${login.userid }"></p>
			<div style="display:flex; justify-content: space-between;">
				<c:forTokens var="fileName" items="${dto.storeFileName }" delims=":">
					<div style="margin: 20px;"><img src="${cpath }/upload/${fileName}" width="150"></div>
				</c:forTokens>
			</div>
			<div style="display:flex; justify-content: space-between;">
				<div style="margin: 20px;">
					${dto.memoA }
					<input type="radio" name="answer" value="${dto.memoA }">
				</div>
				<div style="margin: 20px; margin-left: 150px;">
					${dto.memoB }
					<input type="radio" name="answer" value="${dto.memoB }">
				</div>
			</div>
			<input type="submit" value="선택">
		</form>
	</div>
</div>
</section>

</body>
</html>