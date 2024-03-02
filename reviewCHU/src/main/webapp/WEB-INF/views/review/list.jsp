<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.reviewFrame{
		width: 1000px;
		margin: 20px auto;
	}
	.center {
		display: flex;
		text-align: center;
		width: 450px;
		margin: 20px auto;
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
	thead > tr > td,
	tbody > tr > td{
		text-align: center;
	}
</style>

<div class="frame">
	<h3>매출 목록</h3>
	<hr>
	<div><a href="${cpath }">대문페이지</a></div>
	
	<table class="reviewFrame">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td><a href="${cpath }/review/view/${dto.idx}">${dto.idx }</a></td>
					<td><a href="${cpath }/review/view/${dto.idx}">${dto.title }</a></td>
					<td><a href="${cpath }/review/view/${dto.idx}">${dto.writer }</a></td>
					<td>${dto.uploadDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="center">
		<c:if test="${paging.prev }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/review/list/${paging.begin - 10}?search=${param.search}">이전</a>
			</span>
		</label>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<label>
		<span class="pageNum">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/review/list/${i}?search=${param.search}">${i }</a>
		</span>
		</label>
		</c:forEach>
		
		<c:if test="${paging.next }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/review/list/${paging.end + 1}?search=${param.search}">다음</a>
			</span>
		</label>
		</c:if>
	</div>
	
	<div class="se">
		<div>
			<form action="${cpath }/review/list/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/review/add">리뷰 추가</a>
		</div>
	</div>
</div>


</body>
</html>