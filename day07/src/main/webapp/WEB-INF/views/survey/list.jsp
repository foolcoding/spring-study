<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	table{
		border-collapse: collapse;
		width: 900px;
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
		display: flex;
		text-align: center;
		width: 450px;
		margin: 20px auto;
	}
	.sb {
		width: 1000px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
	.se {
		width: 1000px;
		margin: 20px auto;
		display: flex;
		justify-content: space-evenly;
	}
	span.pageNum{
		width: 40px;
		height: 40px;
		display: inline-block;
		margin: auto;
	}
	span.pageNum > a{
		color: #4B7FD8;
		line-height: 40px;
		font-weight: bold;
	}
	span.pageNum > a:hover{
		color: black;
	}
	
</style>

<div class="frame">
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
			<td>${dto.idx }</td>
			<td><a href="${cpath}/survey/view/${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<div class="center">
		<c:if test="${paging.prev }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/survey/list/${paging.begin - 10}?search=${param.search}">이전</a>
			</span>
		</label>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<label>
		<span class="pageNum">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/survey/list/${i}?search=${param.search}">${i }</a>
		</span>
		</label>
		</c:forEach>
		
		<c:if test="${paging.next }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/survey/list/${paging.end + 1}?search=${param.search}">다음</a>
			</span>
		</label>
		</c:if>
</div>
	
	<div class="se">
		<div>
			<form action="${cpath }/survey/list/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/survey/write"><button>설문 작성</button></a>
		</div>
	</div>

</div>

</body>
</html>