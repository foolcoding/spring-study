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

<section class="frame">
	<div class="detail">
		<div><img src="${cpath }/resources/image/${dto.imgName }" height="300"></div>
		<div><h3>${dto.name }</h3></div>
		<div><h3>${dto.memo }</h3></div>
		<div><h3>${dto.price }</h3></div>
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/"><button>목록</button></a>
		</div>
		<div>
			<a href="${cpath }/modify/${dto.idx}"><button>수정</button></a>
			<a href="${cpath }/delete/${dto.idx}"><button>삭제</button></a>
		</div>
	</div>
</section>

</body>
</html>