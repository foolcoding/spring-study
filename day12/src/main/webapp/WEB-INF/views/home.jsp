<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css">
<script src="${cpath }/resources/js/script.js"></script>
</head>
<body>

<h1>day12</h1>
<hr>

<div id="modal" class="hidden">
	<div class="content">
		<form id="addForm">
			<h3>일정 추가하기</h3>
			<p><input type="text" name="memo" placeholder="메모" required></p>
			<p><input type="date" name="sDate" required></p>
			<p>
				<input type="submit" value="등록">
				<input id="close" type="button" value="돌아가기">
			</p>
		</form>
	</div>
	<div class="overlay"></div>
</div>

<div class="buttons">
	<button id="open">일정 추가</button>
</div>

<div id="root">
	<div class="menu">
		<div class="item selected">최현웅</div>
		<div class="item">오예랑</div>
		<div class="item">배진호</div>
		<div class="item">황민정</div>
		<div class="item">김유빈</div>
		<div class="item">쌤</div>
	</div>
	<div class="content">
		<div class="item selected">1</div>
		<div class="item">2</div>
		<div class="item">3</div>
		<div class="item">4</div>
		<div class="item">5</div>
		<div class="item">6</div>
	</div>
</div>

<script>
	// 데이터 불러오기
// 	const longToDateString = function(num){
// 		const d = new Date(num)
// 		let yyyy = d.getFullYear()
// 		let mm = d.getMonth() + 1
// 		let dd = d.getDate()
// 		if(mm < 10)		mm = '0' + mm
// 		if(dd < 10)		dd = '0' + dd
// 		return yyyy + '년 ' + mm + '월 ' + dd + '일'
// 	}
	
	const menuItems = document.querySelectorAll('.menu > .item')
	const contentItems = document.querySelectorAll('.content > .item')

	menuItems.forEach(menuItemsHandler)
// 	menuItems.forEach((e, index) => {
// 		e.addEventListener('click', function(event){
// 			menuItems.forEach(menuItem => menuItem.classList.remove('selected'))
// 			contentItems.forEach(contentItem => contentItem.classList.remove('selected'))
// 			menuItems[index].classList.add('selected')
// 			contentItems[index].classList.add('selected')
			
// 			const url = 'http://' + ipaddr[index] + ':8080/day12/schedules'
// 			fetch(url).then(resp => resp.json())
// 						.then(json => {
// 							console.log(json)
// 							contentItems[index].innerHTML = ''
// 							let tag = ''
// 							tag += '<table>'
// 							tag += '	<thead>'
// 							tag += '		<tr>'
// 							tag += '			<th>날짜</th>'
// 							tag += '			<th>메모</th>'
// 							tag += '		</tr>'
// 							tag += '	</thead>'
// 							tag += '	<tbody>'
// 							json.forEach(dto =>{
// 								tag += '	<tr>'
// 								tag += '		<td>' + longToDateString(dto.sDate) + '</td>'
// 								tag += '		<td>' + dto.memo + '</td>'
// 								if(index == 0){
// 									tag += '<td><button class="delete" idx="' + dto.idx + '">삭제</button></td>'
// 								}
// 								tag += '	</tr>'
// 							})
// 							tag += '	</tbody>'
// 							tag += '</table>'
// 							contentItems[index].innerHTML = tag
							
// 							if(index == 0){
// 								contentItems[index].querySelectorAll('.delete').forEach(e => e.onclick = event =>{
// 									const idx = event.target.getAttribute('idx')
									
// 									fetch(url + '/' + idx,{
// 										method: 'delete'
// 									}).then(resp => resp.text())
// 										.then(text => {
// 											const de = new Event('click')
// 											document.querySelector('.menu > .item').dispatchEvent(de)
// 										})
// 								})
// 							}
// 						})

// 		})
// 	}
</script>

<script>
	// 데이터 추가하기
	const modal = document.getElementById('modal')
	const open = document.getElementById('open')
	const close = document.getElementById('close')
	const overlay = document.querySelector('#modal > div.overlay')
	const addForm = document.getElementById('addForm')
	
	open.onclick = event => modal.classList.remove('hidden')
	close.onclick = event => modal.classList.add('hidden')
	overlay.onclick = event => modal.classList.add('hidden')
// 	addForm.onsubmit = event => {
// 		event.preventDefault()
// 		const ob = {
// 			sDate: event.target.querySelector('input[name="sDate"]').value,
// 			memo: event.target.querySelector('input[name="memo"]').value
// 		}
// 		const url = 'http://' + ipaddr[0] + ':8080/day12/schedules'
// 		const opt = {
// 			method: 'POST',
// 			body: JSON.stringify(ob),
// 			headers: {
// 				'Content-Type': 'application/json; charset=utf-8'
// 			}
// 		}
// 		fetch(url, opt)
// 			.then(resp => resp.text())
// 			.then(text => {
// 				if(text == 1){
// 					// 이벤트 강제 발생시키기
// 					const event = new Event('click')
// 					document.querySelector('.menu > .item').dispatchEvent(event)
// 					close.dispatchEvent(event)
// 				}
// 				else{
// 					alert('정상적으로 등록되지 않았습니다')
// 					document.querySelector('input').focus()
// 				}
// 			})
// 	}
	
	window.onload = e => {
		const event = new Event('click')
		document.querySelector('.menu > .item').dispatchEvent(event)
	}
	
</script>

</body>
</html>