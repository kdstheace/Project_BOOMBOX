<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
	<!-- google -->
	<meta name="google-signin-scope" content="profile email">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id"
		content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">


<script type="text/javascript">

function bmApplyForm(){
	window.open("/boomMaster/bmApplyForm", "bmApplyForm","width=650, height=950");
	}

function bmCancelForm(){
	window.open("/boomMaster/bmCancelForm", "bmCancelForm","width=650, height=950");
	}

function bmMotionApplyForm(){
	window.open("/boomMaster/bmMotionApplyForm", "bmMotionApplyForm","width=650, height=950");
	}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
<div style="margin: 20px;">

	<h1>Boom Master Home</h1>
	<div>
		<div>
			<h3> 붐마스터 신청하기 </h3>
		</div>
		<div>
			붐마스터는 
		</div>
		<div>
			<input type="button" value="붐마스터 신청하기" onclick="bmApplyForm();">
		</div>
	</div>
	
	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	
	<div>
		<div>
			<h3> 붐마스터 취소하기 </h3>
		</div>
		<div>
			붐마스터 취소하시겠습니까?
			취소하신다면 그동안 진행
		</div>
		<div>
			<input type="button" value="붐마스터 취소하기" onclick="bmCancelForm();">
		</div>
	</div>
	
	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	
	<div>
		<div>
			<h3> 모션인식 신청하기 </h3>
		</div>
		<div>
			불라불라불라
		</div>
		<div>
			<input type="button" value="모션인식 신청하기" onclick="bmMotionApplyForm();">
		</div>
	</div>
	
	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	
	
	
</div>

				<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
      integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
      crossorigin="anonymous"></script>

</body>
</html>