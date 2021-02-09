<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 중복 체크 창</title>
<script type="text/javascript">
	function useEmail(user_email) {
		opener.document.getElementById("user_email").value = user_email;
		this.close();
	}

	function emailCheck(){
		var user_email = document.getElementById("user_email").value;
		 var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			
		  	if(user_email == null || user_email.length == 0){
				alert("이메일을 입력해 주세요");
				return false;
			}  else if (!reg_email.test(user_email)) {
				alert("이메일을 제대로 입력해 주세요");
				return false;
			}
			return true;
		}
	//질문해야해

</script>
</head>
<body>
	<h1>Email 중복 체크 창</h1>

	<form action="/user/emailCheck" method="post" onsubmit="return emailCheck();">
		체크할 name : <input type="text" id="user_email" name="user_email"><br> 
		<input type="submit" value="확인">
	</form>

	<c:if test="${userOne.user_email != null}">
			Email이 중복입니다. 다시 입력해 주세요.
	</c:if>

	<c:if test="${userOne.user_email == null}">
		<c:if test="${checkEmail.user_email != null}">
				${checkEmail.user_email }는 사용 가능합니다.<br>
			<input type="button" value="적용하기" onclick="useEmail('${checkEmail.user_email }');">
		</c:if>
	</c:if>


</body>
</html>