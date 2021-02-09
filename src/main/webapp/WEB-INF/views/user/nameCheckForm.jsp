<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>name 중복 체크 창</title>
<script type="text/javascript">
	function useName(user_name) {
		opener.document.getElementById("user_name").value = user_name;
		this.close();
	}

	function nameCheck(){
		var user_name = document.getElementById("user_name").value;
		
 	  	if(user_name == null || user_name.length == 0){
 			alert("닉네임을 입력해 주세요");
 			return false;
 		} else if(user_name.length < 3 || user_name.length > 8) {
 			alert("닉네임은 3~8글자 사이로 입력해 주세요");
 			return false;
 		}
 		return true;
	}
	
</script>
</head>
<body>
	<h1>ID 중복 체크 창</h1>

	<form action="/user/nameCheck" method="post" onsubmit="return nameCheck();">
		체크할 name : <input type="text" id="user_name" name="user_name"><br> 
		<input type="submit" value="확인">
	</form>

	<c:if test="${userOne.user_name != null}">
			Name이 중복입니다. 다시 입력해 주세요.
	</c:if>

	<c:if test="${userOne.user_name == null}">
		<c:if test="${checkName.user_name != null}">
				${checkName.user_name }는 사용 가능합니다.<br>
			<input type="button" value="적용하기" onclick="useName('${checkName.user_name }');">
		</c:if>
	</c:if>


</body>
</html>