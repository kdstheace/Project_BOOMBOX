<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>



<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a6b1415e6e.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="module" src="https://unpkg.com/player-chrome"></script>

<script type="text/javascript">

function memberShipCrmForm() {
    window.open("/membership/memberShipCrmForm", "memberShipCrmForm", "width=800, height=950");
}


function wirteForm() {
	var date1 = new Date(Time2);
	console.log(date1);

}

function extendCk(){
	var diff = document.getElementById("diff").value;
	if(diff > 30){
		alert("30일 이하에는 하지마");
		return false;
		}

	return true;
}

</script>

<style type="text/css">


#boarderStyle{
	color: #211f53;
	border-color: #211f53;
	margin-left: 80px;
    margin-top: 50px;
    margin-bottom: 30px;
    height: 500px;

	border: 5px solid transparent;
	border-radius: 20px;
	box-sizing: border-box;
 	display: 5px solid transparent;
	background-image: linear-gradient(#444444, #444444), linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);  border-image-slice: 1;
 	background: #fcc10c;

}


</style>


</head>

<body>
<jsp:include page="/WEB-INF/views/menu/navi.jsp" />

		<!-- 멤버쉽  -->

		<div > d</div><br>


		<div id="boarderStyle" style="border-color: #211f53;" class="col-md-6 video_box">
			<div class="p-4 pt-3">
				<h1>멤버십</h1>
			</div>
			<br>
		 <c:if test="${diff!=0 && diff!=null }">
			<form action="/membership/payCheckForm" method = "get" onsubmit="return extendCk();">
				<input type="hidden" id="diff" name="diff" value="${diff }">
				<div class="pl-5 pt-3 ">
								<h3>현재 멤버쉽  </h3>&emsp;<a><h5>만기일 : ${year }년 ${mm }월 ${dd }일<br><br>
								남은 멤버쉽 날짜 : <span style="color: red;">${diff }</span>일</h5></a>

					<div class="col-10 text-right"><a class="btn btn btn-dark" href="/membership/payCheckForm" role="button" onclick="return extendCk();">연장하기</a></div>

				</div>
			</form>
			<div class="pl-5 pt-3 ">

				<h3>환불</h3>&emsp;<a><h5>- 고객센터 email</h5></a>
				<div class="col-10 text-right" ><a class="btn btn btn-dark" href="#" role="button" onclick="memberShipCrmForm();">환불 문의하기</a></div>
			</div>


			</c:if>

			<c:if test="${diff==0}">
				<div class="p-5 pt-3">
					<h3>현재 상태  </h3>&emsp;<a><h5>현재 멤버쉽 미가입자이십니다. <br> 지금 결제 하시면 현재일로 부터 30일간 다양한 혜택을 받을 수 있습니다. <br>
					<div class="col-10 text-right" style="margin-top: 100px;"><a class="btn btn-dark" href="/membership/payCheckForm" role="button">결제하러가기</a></div>
			</div>
	 	</c:if>
		</div>




	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});

		function myFunction() {
			var dots = document.getElementById("dots");
			var moreText = document.getElementById("more");
			var btnText = document.getElementById("myBtn");

			if (dots.style.display === "none") {
				dots.style.display = "inline";
				btnText.innerHTML = "SHOW MORE";
				moreText.style.display = "none";
			} else {
				dots.style.display = "none";
				btnText.innerHTML = "SHOW LESS";
				moreText.style.display = "inline";
			}
		}
	</script>
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
