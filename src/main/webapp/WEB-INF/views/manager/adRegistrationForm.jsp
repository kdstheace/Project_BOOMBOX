<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>

<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">

</head>

<script type="text/javascript">

function fn_check(boommaster_id, boommaster_confirm){
	location.href = "/manager/changeBoomMaster?boommaster_id="+boommaster_id+"&boommaster_confirm="+boommaster_confirm;
}


</script>
<body>

<div style="margin: 30px;">

<h1>광고 등록 페이지</h1><br>
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
	<a href="/manager/crmManagerForm" class="btn btn-primary">고객센터 관리</a>
	&emsp;
<!-- 	<a href="/manager/membershipManagerForm" class="btn btn-secondary">멤버십관리</a>
	&emsp; -->


<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">



</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>


<form action="/manager/UpdateHomeADbaner" method="post" enctype="multipart/form-data">
	<div style="margin-left: 30px">
	<h5>메인화면 배너 광고 수정</h5>
	광고 제목 : &ensp;&ensp;&ensp;<input type="text" name="adt_title" ><br>
	광고사 이름 :  &ensp;<input type="text" name="ad_name"><br>
	광고 내용 :  &ensp; &ensp;&ensp;<input type="text" name="ad_context" ><br>
	광고 URL : &ensp;&ensp;&ensp;<input type="text" name="ad_redirect_URL"><br>
	광고 사진 선택 :  &ensp;&ensp;&ensp;<input type="file" name="uploadBanner"><br><br>


	 &ensp;<input type="submit" value="update">
	</div>


</form>





</body>



</html>