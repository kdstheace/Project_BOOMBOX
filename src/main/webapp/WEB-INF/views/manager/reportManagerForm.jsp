<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>

<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	
	function searchFnc(page){
		var searchform = document.getElementById("searchForm");
		console.log("펑션으로 들어옴.");
		document.getElementById("page").value = page;
		searchForm.submit();
		}
	
	</script>

</head>
<body>

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



<c:forEach var="userName" items="${userNameList}" varStatus="status">
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
	</c:if>



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