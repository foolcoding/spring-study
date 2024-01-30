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
	<h3>항목 추가</h3>
	<form method="POST">
		<div class="item">
			<select name="category">
				<option value="버거">버거</option>
				<option value="음료">음료</option>
			</select>
		</div>
		<div class="item"><input name="name" placeholder="메뉴이름" required></div>
		<div class="item"><input name="price" placeholder="메뉴가격" required></div>
		<div class="item"><input name="imgName" placeholder="이미지이름" required></div>
		<div class="item"><textarea cols="25" rows="8" name="memo" placeholder="상세설명" required></textarea></div>
		<div class="item"><input type="submit"></div>
	</form>
	</div>
</section>

</body>
</html>