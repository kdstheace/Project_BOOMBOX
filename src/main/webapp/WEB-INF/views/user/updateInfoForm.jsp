<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

	<!-- 구글로그인 -->
	<meta name="google-signin-scope" content="profile email">
	
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name = "google-signin-client_id"content = "290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">



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
<title>회원가입</title>
<script type="text/javascript">

function fn_updateFormCheck(){

	var user_name = document.getElementById("user_name").value;
	var user_zip = document.getElementById("user_zip").value;
	var user_address = document.getElementById("user_address").value;
	var user_email = document.getElementById("user_email").value;
	
	var user_googleId = document.getElementById("user_googleId").value;
	var user_googleImg = document.getElementById("user_googleImg").value;

        	
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
/* 	 var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
  	if(user_email == null || user_email.length == 0){
		alert("이메일을 입력해 주세요");
		return false;
	}  else if (!reg_email.test(user_email)) {
		alert("이메일을 제대로 입력해 주세요");
		return false;
	} */

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
	window.open("/user/nameCheckForm", "nameCheckForm","width=300, height=400");
	}

function emailCheckForm(){
	window.open("/user/emailCheckForm", "emailCheckForm","width=300, height=400");
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
////start
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

</script>



</head>
<body>

	<div id="allSize" class="container">
		<h1>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</h1>
		<form action="/user/updateInfo" method="post" onsubmit="return fn_updateFormCheck();">
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
				<p class="label-txt">우편번호</p> <input type="text" class="input" id="user_zip" name="user_zip"> 
				<input id="button" type="button" value="주소검색">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			<label>
				<p class="label-txt">주소</p> 
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
						홈 트레이닝<input type="checkbox" name="userInterest_interest" value = "101">
					</div>
					</div>

					<div>
					<a href=#none id="show200" onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='▶Kids 접기'} else {hide200.style.display='none';show200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide200" style="display: none">
						동요율동<input type="checkbox" name="userInterest_interest" value = "201">
						치어리딩<input type="checkbox" name="userInterest_interest" value = "202">
						Other<input type="checkbox" name="userInterest_interest" value = "299">
					</div>
					</div>
					
					
					<div >
					<a href=#none id="show300" onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='▶방송댄스 접기'} else {hide300.style.display='none';show300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide300" style="display: none">
						K-POP<input type="checkbox" name="userInterest_interest" value = "301">
						J-POP<input type="checkbox" name="userInterest_interest" value = "302">
						Others<input type="checkbox" name="userInterest_interest" value = "399">
					</div>
					</div>
					
					<div>
					<a href=#none id="show400" onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='▶클럽댄스 접기'} else {hide400.style.display='none';show400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide400" style="display: none">
					MALE<input type="checkbox" name="userInterest_interest" value = "401">
					FEMALE<input type="checkbox" name="userInterest_interest" value = "402">
					Others<input type="checkbox" name="userInterest_interest" value = "499">
					</div>
					</div>
					
					<div>
					<a href=#none id="show500" onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='▶힙합 접기'} else {hide500.style.display='none';show500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide500" style="display: none">
					팝핀<input type="checkbox" name="userInterest_interest" value = "501">
					B-BOY<input type="checkbox" name="userInterest_interest" value = "502">
					락킹<input type="checkbox" name="userInterest_interest" value = "503">
					Others<input type="checkbox" name="userInterest_interest" value = "599">
					</div>
					</div>
					
					
					<div>
					<a href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='▶Others 접기'} else {hide600.style.display='none';show600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide600" style="display: none">
					탱고<input type="checkbox" name="userInterest_interest" value = "601">
					탭댄스<input type="checkbox" name="userInterest_interest" value = "602">
					발리댄스<input type="checkbox" name="userInterest_interest" value = "603">
					자이브<input type="checkbox" name="userInterest_interest" value = "604">
					재즈<input type="checkbox" name="userInterest_interest" value = "605">
					Others<input type="checkbox" name="userInterest_interest" value = "699">
					</div>
					</div><br>
					
					
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
				<input class="butten" type="submit" value="정보수정하기"> 
				<input type="reset" value="cancel">
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
		
</body>
</html>