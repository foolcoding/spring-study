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
	thead > tr{
		background-color: silver;
	}
	tbody > tr{
		border-bottom: 1px solid grey;
	}
	tbody > tr:hover{
		background-color:#eee;
	}
	thead > tr > th:nth-child(1) {width:10%;}
	thead > tr > th:nth-child(2) {width:50%;}
	thead > tr > th:nth-child(3) {width:10%;}
	thead > tr > th:nth-child(4) {width:15%;}
	tbody > tr > td{
		text-align: center;
	}
	tbody > tr > td:nth-child(2){
	text-align:left;
	}
	.center {
		text-align: center;
	}
	.sb {
		width: 900px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
</style>

<section>
<h3>게시판</h3>

<table>
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일자</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.isNotice == 1 ? '공지' : dto.idx }</td>
			<td><a href="${cpath}/board/${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<div class="center">
		<c:if test="${paging.prev }">
			<a href="${cpath }/board/list/${paging.begin - 10}?search=${param.search}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/board/list/${i}?search=${param.search}">[${i }]</a>
		</c:forEach>
		
		<c:if test="${paging.next }">
			<a href="${cpath }/board/list/${paging.end + 1}?search=${param.search}">[다음]</a>
		</c:if>
	</div>
	
	<div class="sb">
		<div>
			<form action="${cpath }/board/list/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/board/write"><button>새 글 작성</button></a>
		</div>
	</div>

</section>
</body>
</html>