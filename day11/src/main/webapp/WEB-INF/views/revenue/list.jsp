<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.revenueFrame{
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
		border-spacing: 0px;
	}
	tr{
		border: 1px solid grey;
	}
	td{
		border: 1px solid grey;
		padding: 10px;
	}
</style>

<div class="frame">
	<h3>매출 목록</h3>
	<hr>
	<div><a href="${cpath }">대문페이지</a></div>
	
	<table class="revenueFrame">
		<thead>
			<tr>
				<td>번호</td>
				<td>상품 번호</td>
				<td>가격</td>
				<td>주문량</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td><a href="${cpath }/revenue/view/${dto.idx}">${dto.idx }</a></td>
					<td>${dto.goods_idx }</td>
					<td>${dto.sellDate }</td>
					<td>${dto.quantity }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="center">
		<c:if test="${paging.prev }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/revenue/list/${paging.begin - 10}?search=${param.search}">이전</a>
			</span>
		</label>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<label>
		<span class="pageNum">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/revenue/list/${i}?search=${param.search}">${i }</a>
		</span>
		</label>
		</c:forEach>
		
		<c:if test="${paging.next }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/revenue/list/${paging.end + 1}?search=${param.search}">다음</a>
			</span>
		</label>
		</c:if>
	</div>
	
	<div class="se">
		<div>
			<form action="${cpath }/revenue/list/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/revenue/add">매출 추가</a>
		</div>
	</div>
</div>

</body>
</html>