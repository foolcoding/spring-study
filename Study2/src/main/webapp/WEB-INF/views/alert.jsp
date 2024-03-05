<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const url = '${url}'
	const msg = '${msg}'
	const cpath = '${cpath}'
	
	if(url==''){
		alert('비민번호 재설정 실패\n계정과 이메일을 다시 확인하세요')
		history.go(-1)
	}
	else{
		alert(msg)
		location.href = cpath + url
	}
</script>

</body>
</html>