<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame{
		width: 900px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	header{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	nav > ul{
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li{
		flex: 1;
	}
	div.box{
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	div.item{
		box-sizing: border-box;
		width: 200px;
		margin: 10px;
		padding: 10px;
		text-align: center;
	}
	div.detail{
		display:flex;
		flex-flow:column;
		justify-content: space-between;
		align-items: center;
		text-align: center;
	}
	div.sb{
		display:flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
</head>
<body>

<form method="POST">
	<p>`
		<select name="searchType" required>
			<option value="">== 검색 유형을 선택하세요 ==</option>
			<option ${param.searchType == 'name' ? 'selected' : ''} value="name">이름</option>
			<option ${param.searchType == 'category' ? 'selected' : ''} value="category">카테고리</option>
		</select>
		<input type="search" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${param.searchKeyword }">
		<input type="submit" value="검색">
	</p>
</form>

<section class="frame">
	<a href="${cpath }/"><button>전체</button></a>
	<a href="${cpath }/버거 "><button>버거</button></a>
	<a href="${cpath }/음료 "><button>음료</button></a>
	<div>
		<a href="${cpath }/add"><button>추가</button></a>
	</div>	
	
	<div class="box">
		<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="img">
				<a href="${cpath }/one/${dto.idx}">
					<img src="${cpath }/resources/image/${dto.imgName }" height= "120"></a>
			</div>
			<div class="name">${dto.name }</div>
			<div class="price">${dto.price }</div>
		</div>
		</c:forEach>
	</div>
</section>

</body>
</html>