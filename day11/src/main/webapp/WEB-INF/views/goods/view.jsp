<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	.item > div > a > button > img{
		width: 333px;
	}
</style>

<div class="frame">
	<h3>상품 상세</h3>
	<hr>
	<div><a href="${cpath }/goods/list/1">상품 목록</a></div>
	<div class="item">
		<div>
			<a href="${cpath }/goods/view/${dto.idx}"><button><img src="${cpath}/upload/${dto.img}"></button></a>
			<p>${dto.title }</p>
			<div class="sb">
				가격 : <div>${dto.price }</div>
				재고 : <a href="${cpath }/goods/update-/${dto.idx}"><button>-</button></a>
				<div>${dto.inventory }</div>
				<a href="${cpath }/goods/update+/${dto.idx}"><button>+</button></a>
			</div>
		</div>
	</div>
	<hr>
	<div><a href="${cpath }/goods/delete/${dto.idx}">상품 삭제</a></div>
	<div><a href="${cpath }/revenue/add">상품 주문</a></div>
</div>

</body>
</html>