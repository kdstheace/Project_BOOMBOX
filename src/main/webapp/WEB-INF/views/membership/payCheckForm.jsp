<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Pay Check</title>


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


	function agreeCK() {
		var chkbox = document.getElementsByName('agree');
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			} else {
				chk = false;
			}
		}
		if (chk) {
			window.open("/membership/payForm", "payForm", "width=900, height=650");
			return;
		} else {
			alert("동의함에 체크해주세요.")
			return false;
			}


		}



	function agreeform() {
	    window.open("/membership/payagree", "payagree", "width=950, height=950");
	}

</script>





<style>
* {
	font-family: 'Do Hyeon';
}

/* WATCHFORM START */
#follow {
	margin-bottom: 20px;
}

/* WATCHFORM END */
</style>

</head>

<body>

<jsp:include page="/WEB-INF/views/menu/navi.jsp" />


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
	<!--Main Contents-->
	<div class="d-flex" id="wrapper">

			<!-- 멤버쉽  -->
			<div class="p-5 pt-3">
			<h1>맴버십 구독하기</h1>
			<br>
				<h3>&emsp;상품명 : BoomBox MemberShip  </h3>&emsp;
				<a>
					<h5> &emsp;&emsp;가격 : 5000WON </h5>
				</a>
					<h3></h3>&emsp;
				<a>
					<h5> &emsp;&emsp;이용 기간 : 30일 </h5>
				</a>
				<br>

				<div class="p-5 pt-3">
					 <h6> 본 제품은 BoomMaster MemberShip으로 30일 동안 School에 들어갈 수 있는 혜택이 생깁니다.<br>
					  Scghool에 들어 가시면 각종 댄스, 에어로빅, 힙합 등과 같이 다양한 서비스를 제공 받을 수 있습니다. <br><br>

					 여러분의 강사를 찾아보세요!
					<br><br><br><br>

					 </h6>

					 <div >
					 		<div >
					 			 <a class="#" href="#" role="button" onclick="return agreeform();">약관 동의</a>
					 		</div>


							<div>
								<input type="checkbox" id="agree" name="agree" > 동의
							</div>

					</div>
			</div>

			<div class="p-5 pt-3">


				<div class="col-7 text-right">
					<a class="btn btn-primary" href="#" role="button" onclick="return agreeCK();">결제하러가기</a>&emsp;
					<a class="btn btn-danger" href="/membership/membershipForm" role="button">취소</a>
				</div>

				<br>


			</div>



	</div>
</div>


				<script>
			$(document).ready(function(){
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
</body>
</html>