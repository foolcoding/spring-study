<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<section class="frame detail">
	<div class="detail">
	<h3>항목 수정</h3>
	<form method="POST">
		<input type="hidden" name="idx" value="${dto.idx }">
		<div class="item">
			<select name="category">
				<option value="버거">버거</option>
				<option value="음료">음료</option>
			</select>
		</div>
		<div class="item"><input name="name" value="${dto.name }" required></div>
		<div class="item"><input name="price" value="${dto.price }" required></div>
		<div class="item"><input name="imgName" value="${dto.imgName }" required></div>
		<div class="item"><textarea cols="25" rows="8" name="memo" required>${dto.memo}</textarea></div>
		<div class="item"><input type="submit"></div>
	</form>
	</div>
</section>

</body>
</html>