<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const url = '${url}'
	const msg = '${msg}'
	const cpath = '${cpath}'
	int idx = '${idx}'
	
	if(msg.equals("설문에 이미 참여하셨습니다")){
		location.href = cpath + url + '/' + idx
	}
		
	if(url == ''){
		alert(mag + '에 실패하였습니다')
		history.go(-1)
	}
	else{
		alert(msg + '에 성공하였습니다')
		location.href = cpath + url
	}

</script>



</body>
</html>