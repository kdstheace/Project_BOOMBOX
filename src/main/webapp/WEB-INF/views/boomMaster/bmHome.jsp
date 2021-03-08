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

<style type="text/css">

*{

}

#all_size{
	font-size: 20px;
	margin: 40px 20px 20px 80px;
	width: 50%;
	
}

.title{
	color: rgb(255, 145, 0);
}

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/menu/navi.jsp" />


<div id="all_size">
	<h2 style="font-style: italic;">붐마스터 관리 페이지에 오신것을 환영합니다!</h2>
	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
	
	<div style="border: 1px;">
	
		<div>
			<div name="title" >
				<h3 style="color: rgb(255, 145, 0);"> 붐마스터 신청하기 </h3>
			</div>
			<div style="margin: 20px 20px 20px 20px;">
				붐마스터는 아래와 같은 혜택이 있습니다.<br><br>
				1. 자신의 춤 실력을 바탕으로 자신을 응원하는 팔로워를 모아보세요! <br>
				2. 붐마스터는 멤버십 자격이 기본으로 부여됩니다! <br>
				3. 붐마스터 활동으로 자신의 수익을 창출해보세요! <br><br>
				&emsp;<strong>신청</strong> 하러 갈까요~?<br>
			</div>
			<div style="float: right;">
				<a onclick="bmApplyForm();" class="btn btn-success">붐마스터 신청하기</a>
				<!-- <input type="button" value="붐마스터 신청하기" onclick="bmApplyForm();" style="float: right;"> -->
			</div><br>
		</div>
		
		<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
		
		<div>
			<div>
				<h3 style="color: rgb(255, 145, 0);"> 붐마스터 취소하기 </h3>
			</div>
			
			<div style="margin: 20px 20px 20px 20px;">
				취소하신다면 그동안 진행하셨던 <br><br>
				붐마스터 활동을 <strong>그만두시겠어요?</strong><br>
			</div>
			
			<div style="float: right;">
				<a onclick="bmCancelForm();" class="btn btn-success">붐마스터 취소하기</a>
				<!-- <input type="button" value="붐마스터 취소하기" onclick="bmCancelForm();" style="float: right;"> -->
			</div><br>
		</div>
		
		<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
		
		<div>
			<div>
				<h3 style="color: rgb(255, 145, 0);"> 모션인식 신청하기 </h3>
			</div>
			<div style="margin: 20px 20px 20px 20px;">
				내가 춘 춤을 사람들이 그대로 따라하며 춤을 배울수 있다?!?!<br>
				내가 춘 모습을 배우고 카운팅을 할 수 있는 모션 인식!<br>
				나의 춤 강좌의 퀄리티를 한층 높혀보세요!<br><br>
				그럼 바로 신청하러 갈까요~?<br>
			</div><br>
			
			<div style="float: right;">
				<a onclick="bmMotionApplyForm();" class="btn btn-success">모션인식 신청하기</a>
				<!-- <input type="button" value="모션인식 신청하기" onclick="bmMotionApplyForm();" style="float: right;"> -->
			</div><br>
		</div>
		
		<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px" >
		
	</div>
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