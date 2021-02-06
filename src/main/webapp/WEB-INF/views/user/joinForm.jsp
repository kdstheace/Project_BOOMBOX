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

function fn_joinFormCheck(){

	var user_name = document.getElementById("user_name").value;
	var user_bday = document.getElementById("user_bday").value;
	var user_gender = document.getElementById("user_gender").value;
	var user_zip = document.getElementById("user_zip").value;
	var user_address = document.getElementById("user_address").value;
	var user_email = document.getElementById("user_email").value;
	var userInterest_interest = document.getElementById("userInterest_interest").value;
	var agreement = document.getElementById("agreement").value;
	
	var user_googleId = document.getElementById("user_googleId").value;
	var user_googleId = document.getElementById("user_googleId").value;
	var user_googleId = document.getElementById("user_googleId").value;

 	
 	/* 닉네임 유효성 검사 */
	/* if(user_name == null || user_name.length == 0){
		alert("닉네임을 입력해 주세요");
		return false;
	} else if(user_name.length < 3 || user_name.length < 8) {
		alert("닉네임은 3~8글자 사이로 입력해 주세요");
		return false;
	} */

	/* 생년월일 */
	/* if(user_bday == null || user_bday.length == 0){
		alert("생년월일을 입력해 주세요");
		return false;
	} else if (isNaN(user_address.value)){
		alert("생년월일은 숫자로 입력해주세요");
		return false;
		} */

	/* 성별 */
	/* if(user_gender == null || user_gender.length == 0){
		alert("성별을 입력해 주세요");
		return false;
	} */

	/* 우편번호 */
	/* if(user_zip == null || user_zip.length == 0){
		alert("우편번호을 입력해 주세요");
		return false;
	} */

	/* 주소 */
	/* if(user_address == null || user_address.length == 0){
		alert("주소을 입력해 주세요");
		return false;
	} */
	
	/* 관심장르 */
	/* if(userInterest_interest == null || userInterest_interest.length == 0){
		alert("관심장르을 입력해 주세요");
		return false;
	} */

	/* 규약 */
	/* if(user_bday == null || user_bday.length == 0){
		alert("규약을 체크해 주세요");
		return false;
	}   */
	

	return true;
}

</script>
</head>
<body>

<div id="allSize" class="container">
    <h1><img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo" width="15%" style="min-width: 120px; max-width: 200px;" ></h1>
    <form action="/user/join" method="post" onsubmit="return fn_joinFormCheck();"> 
        <label> 
        	<input type="hidden" id="user_googleId" name="user_googleId" value="${profile.getId() }">
        	<input type="hidden" id="user_name" name="user_googleId" value="${profile.getName() }">
        	<input type="hidden" id="user_googleId" name="user_googleId" value="${profile.getId() }">
			<input type="hidden" id="user_profileImg" name="user_profileImg" value="https://lh3.googleusercontent.com/a-/AOh14Ghcw88tlWbReNaVbKdxqxIOvtkT4MS6bi-wMXT5Gg=s96-c">
        	
            <p class="label-txt">닉네임</p> 
            <input type="text" class="input" id="user_name" name="user_name">
            <input id="button" type="button" value="중복체크">
            <div class="line-box"> 
                <div class="line">
                </div> 
            </div> 
        </label> 

        <label> 
            <p class="label-txt">생년월일</p> 
            <input type="text" class="input" id="user_bday" name="user_bday"> 
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 

        <label> 
            <p class="label-txt" id="user_gender">성별</p><br>
	            <a style="font-size: 15px;">남자</a> <input type="radio" name="user_gender" class="input"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	            <a style="font-size: 15px;">여자</a> <input type="radio" name="user_gender" class="input"> <br><br>
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 
        <label> 
            <p class="label-txt">우편번호</p> 
            <input type="text" class="input" id="user_zip" name="user_zip"> <input id="button" type="button" value="주소검색">
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 
        <label> 
            <p class="label-txt">주소</p> 
            <input type="text" class="input" id="user_address" name="user_address"> 
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 
        <label> 
            <p class="label-txt">이메일</p> 
            <input type="text" class="input" id="user_email" name="user_email" > <input id="button" type="button" value="중복체크">
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 

        <label> 
            <p class="label-txt">관심장르</p> 
            <input type="text" class="input" id="userInterest_interest" name="userInterest_interest"> 
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 
        <label> 
            <p class="label-txt">규약</p> 
            <div class="container"><br>
                <textarea class="form-control col-sm-13" id="agreement" rows="2"></textarea><br>
            </div>
            <a>동의하시겠습니까?</a> <input type="checkbox"><br><br>
            <div class="line-box"> 
                <div class="line">
                </div> 
            </div> 
        </label> 
        <input class="botten" type="submit" value="회원가입">
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    
</body>
</html>