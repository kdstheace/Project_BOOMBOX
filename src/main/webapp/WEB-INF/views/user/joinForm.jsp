<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!-- 구글로그인 -->
<meta name="google-signin-scope" content="profile email">

<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">



<style type="text/css">
@charset "UTF-8";

* {
	font-family: 'Do Hyeon';
	font-size: 20px;
}

body {
	background: #ffd343;
}

div#allSize {
	max-width: 1000px;
	text-align: center;
}

#button {
	font-size: 15px;
}

img {
	margin: 20px 20px 0px 20px;
}

form {
	width: 60%;
	margin: auto;
	background: #ffffff;
	padding: 30px 120px 40px 120px;
	text-align: center;
	-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	min-width: 600px;
}

label {
	display: block;
	position: relative;
	margin: 40px 0px;
}

.label-txt {
	position: absolute;
	top: -1.6em;
	padding: 10px;
	font-size: .8em;
	letter-spacing: 1px;
	color: rgb(120, 120, 120);
	transition: ease .3s;
}

.input {
	/* width: 100%;  */
	padding: 10px;
	background: transparent;
	border: none;
	outline: none;
}

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

.input:focus+.line-box .line {
	width: 100%;
}

.label-active {
	top: -3em;
}

button {
	display: inline-block;
	padding: 12px 24px;
	background: rgb(220, 220, 220);
	font-weight: bold;
	color: rgb(120, 120, 120);
	border: none;
	outline: none;
	border-radius: 3px;
	cursor: pointer;
	transition: ease .3s;
}

button:hover {
	background: #8BC34A;
	color: #ffffff;
}
</style>
<title>회원가입</title>
<script type="text/javascript">

function fn_joinFormCheck(){

	var user_name = document.getElementById("user_name").value;
	var user_bday = document.getElementById("user_bday").value;
	var user_gender = document.getElementById("user_gender").value;
	var user_phone = document.getElementById("user_phone").value;
	var user_zip = document.getElementById("user_zip").value;
	var user_address = document.getElementById("user_address").value;
	var user_email = document.getElementById("user_email").value;
	/* var userInterest_interest = document.getElementById("userInterest_interest").value; */
	var user_googleId = document.getElementById("user_googleId").value;
	var user_googleImg = document.getElementById("user_googleImg").value;
	var agreement = document.getElementById("agreement").value;	
    var check_count = document.getElementsByName("user_gender").length;
 	var user_gender = "male";
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("user_gender")[i].checked == true) {
            	user_gender = document.getElementsByName("user_gender")[i].value;
            }
        }
	
     	/* 닉네임 유효성 검사 */
 	  	if(user_name == null || user_name.length == 0){
		alert("닉네임을 입력해 주세요");
		return false;
	} else if(user_name.length < 3 || user_name.length > 8) {
		alert("닉네임은 3~8글자 사이로 입력해 주세요");
		return false;
	}

	/* 핸드폰 */
		var EXP_MOBILENUMBER = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
	  	if(user_phone == null || user_phone.length == 0){
			alert("핸드폰번호를 입력해 주세요");
			return false;
		}  else if (!EXP_MOBILENUMBER.test(user_phone)) {
			alert("핸드폰번호를 제대로 입력해 주세요");
			return false;
		}

 	/* 생년월일 */
 	 if(user_bday == null || user_bday.length == 0){
		alert("생년월일을 입력해 주세요");
		return false;
	}

	/* 성별 - 유효성검사 필요없음 */
/*  	if(user_gender == null || user_gender.length == 0){
		alert("성별을 입력해 주세요");
		return false;
	} */

	/* 우편번호 */
 	  if(user_zip == null || user_zip.length == 0){
		alert("우편번호을 입력해 주세요");
		return false;
	}   

	/* 주소 */
  	if(user_address == null || user_address.length == 0){
		alert("주소을 입력해 주세요");
		return false;
	}  

	/* 이메일 */
	
  	if(user_email == null || user_email.length == 0){
		alert("이메일을 입력해 주세요");
		return false;
	}
	
	/* 관심장르 */
	var count = 0;
	var interestCheck = document.getElementsByName('userInterest_interest');
	for(var i = 0; i < interestCheck.length; i++) {
		if(interestCheck[i].checked) {
			count = 1;
			break;
			}
		}
	if (count == 0) {  //관심분야 확인 
		  alert("관심분야를 체크해 주세요"); 
		  return false; 
	}

	/* 규약 */
 	var count1 = 0;
	var agreeCheck = document.getElementById('agreement');
		if(agreeCheck.checked) {
			count1 = 1;
			}
	if (count1 == 0) {  //관심분야 확인 
		  alert("구약를 체크해 주세요"); 
		  return false; 
	} 
	return true;
}

function nameCheckForm(){
	window.open("/user/nameCheckForm", "nameCheckForm","width=500, height=700");
	}

function emailCheckForm(){
	window.open("/user/emailCheckForm", "emailCheckForm","width=500, height=700");
	}
	

function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log(profile);
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);

	if(id_token != null) location.href = "/user/googleLogin?id="+profile.getId();
   
}



function fn_check(){
	//var user_gender = document.getElementById("user_gender").checked; 
//start
     var check_count = document.getElementsByName("user_gender").length;
 	var user_gender = "male";
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("user_gender")[i].checked == true) {
            	user_gender = document.getElementsByName("user_gender")[i].value;
            }
        }
////end
	

	console.info("Test값 가져오기");
	console.info("닉네임 : ", user_name.value);
	console.info("폰넘버 : ", user_phone.value);
	console.info("주소 : ", user_address.value);
	console.info("우편번호 : ", user_zip.value);
	console.info("이메일 : ", user_email.value);
	console.info("생일 : ", user_bday.value);
	
	console.info("성별 : ", user_gender);
	console.info("구글아이디 : ", user_googleId.value);
	console.info("구글 이미지 : ", user_googleImg.value);

}

function cancel(){
	location.href = "/user/loginForm";
	
}

</script>
</head>
<body>

	<div id="allSize" class="container">
		<h1>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</h1>
		<form action="/user/join" method="post" onsubmit="return fn_joinFormCheck();">
			<input type="hidden" id="user_googleId" name="user_googleId" value="${userVO.user_googleId}"> 
			<input type="hidden" id="user_googleImg" name="user_googleImg" value="${userVO.user_googleImg}"> 
			<label>
			<p class="label-txt">닉네임</p> 
			<input type="text" class="input" id="user_name" name="user_name" readonly="readonly"> 
			<input type="button" value="닉네임 중복체크" onclick="nameCheckForm();">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt">핸드폰</p> 
				<input type="text" class="input" id="user_phone" name="user_phone">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt" id="user_gender">성별</p><br>
				<a style="font-size: 15px;">남자</a> 
				<input type="radio" name="user_gender" class="input" value="male" checked="checked">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				<a style="font-size: 15px;">여자</a> 
				<input type="radio" name="user_gender" class="input" value="female"> <br>
			<br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt">생년월일</p> 
				<input type="date" class="input" id="user_bday" name="user_bday">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			<label>
				<p class="label-txt">우편번호</p> <input type="text" class="input"
				id="user_zip" name="user_zip" value="${userZip }"> 
				<input type="button" value="우편번호찾기" onclick="sample6_execDaumPostcode()" style="width: 130px;">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			<label>
				<p class="label-txt">주소 + 상세주소 입력</p> 
				<input type="text" class="input" id="user_address" name="user_address">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>   
			
			<label>
				<p class="label-txt">이메일</p> 
				<input type="text" class="input" id="user_email" name="user_email"> 
				<input type="button" value="이메일 중복체크" onclick="emailCheckForm();">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt">관심장르</p> <br>

					<div>
					<a href=#none id="show100" onclick="if(hide100.style.display=='none') {hide100.style.display='';show100.innerText='▶홈트레이닝 접기'} else {hide100.style.display='none';show100.innerText='▶홈트레이닝 펼치기'}">▶홈트레이닝 펼치기</a>
					<div id="hide100" style="display: none">
						홈 트레이닝<input type="checkbox" name="userInterest_interest" value = "HOME TRAINING">
					</div>
					</div>

					<div>
					<a href=#none id="show200" onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='▶Kids 접기'} else {hide200.style.display='none';show200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide200" style="display: none">
						동요율동<input type="checkbox" name="userInterest_interest" value = "KIDS">
						치어리딩<input type="checkbox" name="userInterest_interest" value = "CHEERLEADING">
						Other<input type="checkbox" name="userInterest_interest" value = "OTHER(TEENS)">
					</div>
					</div>
					
					
					<div >
					<a href=#none id="show300" onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='▶방송댄스 접기'} else {hide300.style.display='none';show300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide300" style="display: none">
						K-POP<input type="checkbox" name="userInterest_interest" value = "K-POP">
						J-POP<input type="checkbox" name="userInterest_interest" value = "J-POP">
						Others<input type="checkbox" name="userInterest_interest" value = "OTHERS(CHOREO)">
					</div>
					</div>
					
					<div>
					<a href=#none id="show400" onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='▶클럽댄스 접기'} else {hide400.style.display='none';show400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide400" style="display: none">
						MALE<input type="checkbox" name="userInterest_interest" value = "MALE CLUBDANCE">
						FEMALE<input type="checkbox" name="userInterest_interest" value = "FEMALE CLUBDANCE">
						Others<input type="checkbox" name="userInterest_interest" value = "OTHERS(CLUB)">
					</div>
					</div>
					
					<div>
					<a href=#none id="show500" onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='▶힙합 접기'} else {hide500.style.display='none';show500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide500" style="display: none">
						팝핀<input type="checkbox" name="userInterest_interest" value = "POPPIN DANCE">
						B-BOY<input type="checkbox" name="userInterest_interest" value = "BREAK DANCE">
						락킹<input type="checkbox" name="userInterest_interest" value = "LOCKING">
						Others<input type="checkbox" name="userInterest_interest" value = "OTHERS(HIPHOP)">
					</div>
					</div>
					
					
					<div>
					<a href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='▶Others 접기'} else {hide600.style.display='none';show600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide600" style="display: none">
						탱고<input type="checkbox" name="userInterest_interest" value = "TANGO">
						탭댄스<input type="checkbox" name="userInterest_interest" value = "TAP DANCE">
						발리댄스<input type="checkbox" name="userInterest_interest" value = "BELLY DANCE">
						자이브<input type="checkbox" name="userInterest_interest" value = "JIVE">
						재즈<input type="checkbox" name="userInterest_interest" value = "JAZZ">
						Others<input type="checkbox" name="userInterest_interest" value = "OTHERS">
					</div>
					</div><br>
					
					
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt">
					아래 약관에 동의합니다.	
					<input type="checkbox" id = "agreement" name="agreement">
				</p>
				<div class="container">
    <br>
    <p class="container">
    <a data-toggle="modal" data-target="#termsModal" href="#">서비스 규약</a><br>
    <a data-toggle="modal" data-target="#termsModal" href="#">개인정보정책 보호법</a>
    </p>
    <br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
				<input class="button" type="submit" value="회원가입"> 
				<input type="button" value="CANCEL" onclick="cancel()">
			</button>
		</form>

	</div>

	<script>$(document).ready(
				function() {
					$('.input').focus(
						function() {
							$(this).parent().find(".label-txt").addClass('label-active');
						});
					$(".input").focusout(
						function() {
							if ($(this).val() == '') {
								$(this).parent().find(".label-txt").removeClass('label-active');
							};
						});
					});
	</script>

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
		
   <!-- Modal -->
    <div class="modal fade bd-example-modal-xl" id="termsModal" tabindex="-1" role="dialog"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel"><i class="fas fa-sign-in-alt"></i>&nbsp Terms of
                        Service</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <pre class="terms">
Introduction
Thanks for choosing BOOMBOX(“we”, “us”, “our”). The following Terms of Service apply when you use the BOOMBOX service, websites, or software applications (together, the “curator.io Service” or “Service”). Please review the following terms carefully. By accessing or using the Service, you signify your agreement to these Terms of Service. If you do not agree to these Terms of Service, you may not access or use the Service.The following terms and conditions govern all use of the curator.io website and all content, services and products available at or through the website, including, but not limited to,curator.io Free and all curator.io Paid Subscription accounts. The Website is offered subject to your acceptance without modification of all of the terms and conditions contained herein and all other operating rules, policies (including, without limitation, curator.io´s Privacy Policy) and procedures that may be published from time to time on this Site by curator.io (collectively, the “Agreement”).Please read this Agreement carefully before accessing or using the Website. By accessing or using any part of the web site, you agree to become bound by the terms and conditions of this agreement. If you do not agree to all the terms and conditions of this agreement, then you may not access the Website or use any services. If these terms and conditions are considered an offer by curator.io, acceptance is expressly limited to these terms. In order to use the curator.io Service, you need to (a) be 18 or older, or be 13 or older and have your parent or guardian’s consent to these Terms, (b) have the power to enter a binding contract with us and are not barred from doing so under any applicable laws.
Changes to the Agreements
Occasionally we may, in our discretion, make changes to the curator.io Service and Agreements. When we make changes to the Agreements that we consider material, we’ll notify you through the Service. Your continued use of or access to the Website following the posting of any changes to this Agreement constitutes acceptance of those changes. curator.io may also, in the future, offer new services and/or features through the Website (including, the release of new tools and resources). Such new features and/or services shall be subject to the terms and conditions of this Agreement.
User Content
BOOMBOX delivers user generated content in the form of social media posts downloaded from the user´s social media networks (“User Content”). You represent that you have the right to use any User Content which you make available for use with the Service, and that such User Content, or its use by us as contemplated by this Agreement, does not violate these Agreements, applicable law, or the intellectual property rights of others.By making User Content available, you represent and warrant that:
the downloading, copying and use of the Content will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark or trade secret rights, of any third party;
if your employer has rights to intellectual property you create, you have either (i) received permission from your employer to post or make available the Content, including but not limited to any software, or (ii) secured from your employer a waiver as to all rights in or to the Content;
you have fully complied with any third-party licenses and/or Terms of Use relating to the Content, and have done all things necessary to successfully pass through to end users any required terms;
the Content does not contain or install any viruses, worms, malware, Trojan horses or other harmful or destructive content;
the Content is not spam, is not machine- or randomly-generated, and does not contain unethical or unwanted commercial content designed to drive traffic to third party sites or boost the search engine rankings of third party sites, or to further unlawful acts (such as phishing) or mislead recipients as to the source of the material (such as spoofing);
the Content is not pornographic, does not contain threats or incite violence, and does not violate the privacy or publicity rights of any third party;
your website are not getting advertised via unwanted electronic messages such as spam links on newsgroups, email lists, other blogs and web sites, and similar unsolicited promotional methods;
your websites are not named in a manner that misleads your readers into thinking that you are another person or company. For example, your website´s URLs or name is not the name of a person other than yourself or company other than your own.
By submitting User-Content to curator.io for inclusion on your Website, you grant curator.io a world-wide, royalty-free, and non-exclusive license to reproduce, modify, adapt and publish the Content solely for the purpose of displaying and distributing the content. If you delete Content, curator.io will use reasonable efforts to remove it from the Service, but you acknowledge that caching or references to the Content may not be made immediately unavailable.Curator.io does not monitor, review, or edit User Content, but has the right (though not the obligation) to remove or disable access to any User Content for any or no reason, including but not limited to, User Content that, in Curator.io’s sole discretion, violates these Agreements. Curator.io may take these actions without prior notification to you. Removal or disabling of access to User Content shall be at our sole discretion, and we do not promise to remove or disable access to any specific User Content. curator.io will have no obligation to provide a refund of any amounts previously paid.Curator.io is not responsible for User Content nor does it endorse any opinion contained in User Content. If you believe that any User Content infringes your intellectual property rights, or that your rights under applicable law have been otherwise infringed by any User Content, please contact us at support@curator.io.
Technology limitations and modifications
curator.io will make reasonable efforts to keep the curator.io Service operational. However, certain technical difficulties or maintenance may, from time to time, result in temporary interruptions. curator.io reserves the right, periodically and at any time, to modify or discontinue, temporarily or permanently, functions and features of the curator.io Service, with or without notice, all without liability to you for any interruption, modification, or discontinuation of the curator.io Service or any function or feature thereof. You understand and agree that curator.io has no obligation to maintain, support, upgrade, or update the Service, or to provide all or any specific content through the Service.
Prices of all Services, including but not limited to monthly subscription plan fees to the Service, are subject to change upon 30 days notice from us. Such notice may be provided at any time by posting the changes to the curator.io Site.Curator.io shall not be liable to you or to any third party for any modification, price change, suspension or discontinuance of the Service.
Payments, Renewals, Upgrading and Downgrading
By selecting a Paid Subscription you agree to pay curator.io the monthly subscription fees indicated for that service. Subscription are billed in advance for the period selected. Upon completion of the period (and you have not cancelled the Service) you will automatically be billed for the following period.Payment for subscription can be made via Credit Card via the Website or via Bank Transfer if organised with Curator.io prior to subscribing to a plan.For any upgrade or downgrade in plan level, your Credit Card that you provided will automatically be charged the new rate on your next billing cycle. When upgrading or downgrading you are moved to the new plan instantly.For upgrades in plan level, the difference in price between the old plan and the new plan will be billed immediately for the number of days remaining on the current billing period.
Cancellations and Refunds
Unless you notify curator.io before the end of the applicable subscription period that you want to cancel a paid subscription, your subscription will automatically renew and you authorize us to collect the then-applicable monthly subscription fee (as well as any taxes) using any credit card or other payment mechanism we have on record for you. Paid Subscriptions can be canceled by simply login into the curator.io Admin Dashboard, clicking Account > Subscription and clicking the “Cancel” link. The cancellation will take effect immediately. There will be no refunds or credits for partial months of service, upgrade/downgrade refunds, or refunds for months with a Paid Subscription that is unused. In order to treat everyone equally, no exceptions will be made.
Copyright Infringement and DMCA Policy
As curator.io asks others to respect its intellectual property rights, it respects the intellectual property rights of others. If you believe that material located on or linked to by curator.io violates your copyright, you are encouraged to notify curator.io via the contact link available on the Website. curator.io will respond to all such notices, including as required or appropriate by removing the infringing material or disabling all links to the infringing material. curator.io will terminate a visitor’s access to and use of the Website if, under appropriate circumstances, the visitor is determined to be a repeat infringer of the copyrights or other intellectual property rights of curator.io or others. In the case of such termination, curator.io will have no obligation to provide a refund of any amounts previously paid to curator.io.
Intellectual Property.
This Agreement does not transfer from curator.io to you any curator.io or third party intellectual property, and all right, title and interest in and to such property will remain (as between the parties) solely with curator.io. Trademarks, service marks, graphics and logos used in connection with the Website may be the trademarks of other third parties. Your use of the Website grants you no right or license to reproduce or otherwise use any curator.io or third-party trademarks.
Termination
curator.io may terminate your access to all or any part of the Website at any time, with or without cause, with or without notice, effective immediately. If you wish to terminate this Agreement or your curator.io account (if you have one), you may simply discontinue using the Website. All provisions of this Agreement which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.
Limitation of Liability
In no event will curator.io, or its suppliers or licensors, be liable with respect to any subject matter of this agreement under any contract, negligence, strict liability or other legal or equitable theory for: (i) any special, incidental or consequential damages; (ii) the cost of procurement for substitute products or services; (iii) for interruption of use or loss or corruption of data; or (iv) for any amounts that exceed the fees paid by you to curator.io under this agreement during the twelve (12) month period prior to the cause of action. curator.io shall have no liability for any failure or delay due to matters beyond their reasonable control. The foregoing shall not apply to the extent prohibited by applicable law.
Disclaimer of Warranties
The Website is provided “as is”. curator.io and its suppliers and licensors hereby disclaim all warranties of any kind, express or implied, including, without limitation, the warranties of merchantability, fitness for a particular purpose and non-infringement. Neither curator.io nor its suppliers and licensors, makes any warranty that the Website will be error free or that access thereto will be continuous or uninterrupted. You understand that you download from, or otherwise obtain content or services through, the Website at your own discretion and risk.
Indemnification
You agree to indemnify and hold harmless curator.io, its contractors, and its licensors, and their respective directors, officers, employees and agents from and against any and all claims and expenses, including attorneys’ fees, arising out of your use of the Website, including but not limited to your violation of this Agreement.
Severability
Should any provision of the Terms be held invalid or unenforceable for any reason or to any extent, such invalidity or enforceability shall not in any manner affect or render invalid or unenforceable the remaining provisions of the Terms, and the application of that provision shall be enforced to the extent permitted by law.
Choice of law, mandatory arbitration and venue
These Agreements are subject to the laws of Australia, without regard to choice or conflicts of law principles. Further, you and curator.io agree to the exclusive jurisdiction of the courts of Australia to resolve any dispute, claim or controversy that arises in connection with these Agreements.
Free Accounts and API Access
Unless otherwise agreed with a Curator representative, Free accounts must display the Powered by Curator.io link either below or above the feed. If you’re connecting to the to the Curator API through any method other than the embed code generated via the Dashboard we require that you sign up to a Professional, Business or Enterprise Plan.
One Account Per Domain
Unless otherwise agreed with a Curator representative, only one Curator accounts can be used on one domain. If you need multiple feeds please consider upgrading.
Third Party Integrations / Service Providers
Curator.io makes use of the following third party integrations / API’s, by using agreeing to the Curator.io Terms of Service you are also agreeing to the following Terms of Services:
YouTube Terms of Service - YouTube, LLC, 901 Cherry Ave., San Bruno, CA 94066, USA.
Miscellaneous
This Agreement constitutes the entire agreement between curator.io and you concerning the subject matter hereof, and they may only be modified by a written amendment signed by an authorized executive of curator.io, or by the posting by curator.io of a revised version.
These Terms are Effective as of April 20, 2020.

Thank you for reading our terms. We hope you enjoy BOOMBOX

You can reach us at support@BOOMBOX.com</pre>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<!-- Modal ENDS -->
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
new daum.Postcode({
oncomplete: function(data) {
// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("user_address").value = extraAddr;
            
            } else {
                document.getElementById("user_address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_zip').value = data.zonecode;
            document.getElementById("user_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("user_address").focus();
        }
    }).open();
}
</script>	

</body>
</html>