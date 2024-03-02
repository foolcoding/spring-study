	// HTML 문서를 불러오지 않아도 설정할 수 있는 전역 변수 및 함수 정리
	// 함수는 헤드에 올려도댐
	function itemListClickHandler(event) {		// 이벤트 핸들러
		document.querySelectorAll('.menu > .item').forEach(item => {
			item.classList.remove('selected')
		})
		event.target.classList.add('selected')
	}
	
	function getDateStringFromLong(num){
		const days = ['일', '월', '화', '수', '목', '금', '토']
		const n = new Date(num)
		let yyyy = n.getFullYear()
		let mm = n.getMonth() + 1
		let dd = n.getDate()
		let day = n.getDay()
		if(mm < 10) 	mm = '0' + mm
		if(dd < 10) 	dd = '0' + dd
		return `${yyyy}년 ${mm}월 ${dd}일 ${days[day]}요일`
	}
	
	function getHTMLfromJson(json){
		let tag = ''
		tag += '<table>'
		tag += '	<thead>'
		tag += '			<tr>'
		tag += '				<th>번호</th>'
		tag += '				<th>날짜</th>'
		tag += '				<th>내용</th>'
		tag += '				<th>삭제</th>'
		tag += '			</tr>'
		tag += '	</thead>'
		tag += '	<tbody>'
		json.forEach(dto => {
			tag += `<tr>`
			tag += `	<td>${dto.idx}</td>`
			tag += `	<td>${getDateStringFromLong(dto.sDate)}</td>`
			tag += `	<td>${dto.memo}</td>`
			tag += `	<td><button class="delete" idx=${dto.idx}>삭제</button></td>`
			tag += `</tr>`
		})
		tag += '	</tbody>'
		tag += '</table>'
		return tag
	}
	
	async function menuClickHandler(event){
			// 반복문의 인덱스 대신, 이벤트 대상이 menu item의 몇번째인지 확인하기
			const arr = Array.from(document.querySelectorAll('.menu > .item'))
			const index = arr.indexOf(event.target)
			
			// 어떤 주소로 요청을 보낼 것인가 결정
			const url = urls[index]
			
			// 주소로 요청하여 json데이터를 받아온다
			const json = await fetch(url).then(resp => resp.json())
			
			// 받아온 json을 HTML 태그 문자열로 변환한다
			const tag = getHTMLfromJson(json)
// 			console.log(json)
// 			console.log(tag)

			// 태그를 삽입할 HTMLElement를 찾아서 태그를 찾는다
			const content = document.querySelector('#root > .content')
			content.innerHTML = tag
	}
	
	async function submitHandler(event){
		event.preventDefault()

		const ob = {
			sDate: event.target.querySelector('input[name="sDate"]').value,
			memo: event.target.querySelector('input[name="memo"]').value
		}

		const url = cpath + '/schedules'

		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
			
		const result = await fetch(url, opt).then(resp => resp.text())
		if(result == 1){
			// 이벤트 강제 발생시키기
			const event = new Event('click')
			document.querySelector('.menu > .item').dispatchEvent(event)
			document.getElementById('close').dispatchEvent(event)
		}
		else{
			alert('정상적으로 등록되지 않았습니다')
			document.querySelector('input').focus()
		}
	}