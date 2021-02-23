<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>

<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	
	
	</script>

</head>
<body>
<div style="margin: 30px;">

	<h1>신고 관리 페이지</h1>
	<br>

	<a href="/" class="btn btn-dark">메인홈으로 가기</a>
	<br>
	<br>
	<a href="/manager/reportManagerForm" class="btn btn-danger">신고관리</a>
	&emsp;
	<a href="/manager/motionRegistrationForm" class="btn btn-success">모션등록</a>
	&emsp;
	<a href="/manager/boomMasterRegistrationForm" class="btn btn-warning">붐마등록</a>
	&emsp;
	<a href="/manager/adRegistrationForm" class="btn btn-light">광고등록</a>
	&emsp;
	<a href="/manager/videoDeleteForm" class="btn btn-primary">영상삭제</a>
	&emsp;
	<a href="/manager/membershipManagerForm" class="btn btn-secondary">멤버십관리</a>
	&emsp;


	<hr class="one"
		style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	<br>

<form action="/manager/reportManagerForm" name="searchUser" id="searchUser" method="get" >
	<input type="hidden" name="page" id="page">
    <input class="form-control mr-sm-2 search-bar" type="search" name = "searchText" value="${searchText }" placeholder="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="searchFnc(1);">Search</button>
</form>


<hr class="one"
		style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	<br>

	<table border="1">
		<tr>
			<th>유저 아이디</th>
			<th>유저 닉네임</th>
			<th>유저 핸드폰</th>
			<th>유저 팬딩</th>
			<th>유저 벤 시키기</th>

		</tr>
		<c:forEach items="${list }" var="user">
			<tr>
				<td>${user.USER_ID }</td>
				<td>${user.USER_NAME }</td>
				<td>${user.USER_PHONE }</td>
				<td>${user.USER_PENDING }</td>
				<td>
					<input type="button" value="님 1주일 벤">
				</td>
			</tr>
		</c:forEach>

	</table>

<%-- <c:forEach var="userName" items="${userNameList}" varStatus="status">
	<p>${userOne.user_name}</p><br>
</c:forEach>

<c:if test="${userOne.user_name != null}">
			Name이 중복입니다. 다시 입력해 주세요.
	</c:if>

	<c:if test="${userOne.user_name == null}">
		<c:if test="${checkName.user_name != null}">
				${checkName.user_name }는 사용 가능합니다.<br>
			<input type="button" value="적용하기" onclick="useName('${checkName.user_name }');">
		</c:if>
	</c:if> --%>


</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>

</body>
</html>