'use strict';
// 자바 스크립트의 엄격 모드를 적용한다

async function clickHandler2(){		// 요청해서, 응답받은 내용을 문자열 형태로 반환
	const url = cpath + '/ex02/js'
	const result = await fetch(url).then(resp => resp.json())
	const arr = result.getFestivalKr.item
	let tag = ''
		
	for(let i = 0; i < arr.length; i++){
		const dto = arr[i]
		tag += `<div class="item">`
		tag += `	<div><h3>${dto.UC_SEQ }, ${dto.TITLE }</h3></div>`
		tag += `	<div>${dto.HOMEPAGE_URL }</div>`
		tag += `	<div><img src="${dto.MAIN_IMG_NORMAL }" height="300"></div>`
		tag += `	<div>`
		tag += `		<details>`
		tag += `			<summary>상세보기</summary>`
		tag += `			<span>${dto.ITEMCNTNTS }</span>`
		tag += `		</details>`
		tag += `	</div>`
		tag += `</div>`

	}
	return tag;
}
