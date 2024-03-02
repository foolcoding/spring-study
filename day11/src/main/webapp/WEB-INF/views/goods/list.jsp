<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.goodsFrame{
		width: 1000px;
		margin: 20px auto;
		display: flex;
		flex-flow: wrap;
	}
	
	.item > div > a > button > img{
		width: 200px;
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
</style>

<div class="frame">
	<h3>상품 목록</h3>
	<hr>
	<div><a href="${cpath }">대문페이지</a></div>
	
	<div class="goodsFrame">
		<c:forEach var="dto" items="${list }">
			<div class="item">
				<div>
					<a href="${cpath }/goods/view/${dto.idx}"><button><img src="${cpath}/upload/${dto.img}"></button></a>
					<p>번호 : ${dto.idx }</p>
					<p>이름 : ${dto.title }</p>
					<div class="sb">
						<div>가격 : ${dto.price }</div>
						<div>재고 : ${dto.inventory }</div>
					</div>
				</div>
			</div>	
		</c:forEach>
	</div>
	
	<div class="center">
		<c:if test="${paging.prev }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/goods/list/${paging.begin - 10}?search=${param.search}">이전</a>
			</span>
		</label>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<label>
		<span class="pageNum">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/goods/list/${i}?search=${param.search}">${i }</a>
		</span>
		</label>
		</c:forEach>
		
		<c:if test="${paging.next }">
		<label>
			<span class="pageNum">
				<a href="${cpath }/goods/list/${paging.end + 1}?search=${param.search}">다음</a>
			</span>
		</label>
		</c:if>
	</div>
	
	<div class="se">
		<div>
			<form action="${cpath }/goods/list/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/goods/add">상품 추가</a>
		</div>
	</div>
</div>

</body>
</html>