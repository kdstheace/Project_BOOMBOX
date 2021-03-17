<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style type="text/css">

@charset "UTF-8";

    *{
        font-family : 'Do Hyeon';
        font-size : 20px;
    }

    body {
        background: #ffd343;
        }

    div#allSize{
        max-width: 1000px;
        text-align: center;
    }

    #button{
        font-size: 15px;
    }

    img{
        margin: 20px 20px 0px 20px;
    }

    form {
        width: 60%;
        margin: auto;
        background: #ffffff;
        padding: 30px 120px 40px 120px;
        text-align: center;
        -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
        box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
        min-width: 600px;
        }
    label {
        display: block;
        position: relative;
        margin: 40px 0px; }
    .label-txt {
        position: absolute;
        top: -1.6em;
        padding: 10px;
        font-size: .8em;
        letter-spacing: 1px;
        color: rgb(120,120,120);
        transition: ease .3s;
        }
    .input {
        /* width: 100%;  */
        padding: 10px;
        background: transparent;
        border: none;
        outline: none; }
    .line-box {
        position: relative;
        width: 100%;
        height: 2px;
        background: #BCBCBC;
    }
    .line {
        position: absolute;
        width: 0%;
        height: 2px;
        top: 0px;
        left: 50%;
        transform: translateX(-50%);
        background: #8BC34A;
        transition: ease .6s;
    }
    .input:focus + .line-box .line { width: 100%; }
    .label-active { top: -3em; } button { display: inline-block; padding: 12px 24px; background: rgb(220,220,220); font-weight: bold; color: rgb(120,120,120); border: none; outline: none; border-radius: 3px; cursor: pointer; transition: ease .3s; }
    button:hover { background: #8BC34A; color: #ffffff; }


</style>
<title>고객센터</title>

<script type="text/javascript">


function nowDate(){

document.getElementById("crm_writeDate").value = new Date().toISOString().slice(0,-1);

}

function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp() { // 24시간제
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	function cancle(){
	location.href='/report/closeForm';

	}



</script>


</head>
<body>
	<div id="allSize" class="container">
		<p>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</p>
		<h1><spring:message code="memberShipCrmForm.refund.title" /></h1>
		<form action="/membership/membershipCrmSend" method="post"  >

			<label>
			<p class="label-txt"><spring:message code="memberShipCrmForm.refund.title1" /></p>
			<input type="text" class="input" id="pending_title" name="pending_title" value="환불을 요청합니다." readonly="readonly">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>

			<label>
				<p class="label-txt"><spring:message code="memberShipCrmForm.refund.content" /></p><br>
				<textarea class="form-control" cols="200" rows="3" id="refund_content" name="refund_content"></textarea> <br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>



			<label>
				<p class="label-txt"><spring:message code="memberShipCrmForm.refund.refundUser" /></p> <input type="text" class="input" id="refund_name" name="refund_name" value="${loginName } ">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>

				<input class="butten" type="submit" value="<spring:message code="memberShipCrmForm.refund.send" />">
				<input type="reset" value="<spring:message code="memberShipCrmForm.refund.cansel" />" onclick="return cancle();">
			</button>
		</form>

	</div>


	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
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