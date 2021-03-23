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

	return true;
}

</script>
</head>
<body>

<div id="allSize" class="container">
    <h1><img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo" width="15%" style="min-width: 120px; max-width: 200px;" ></h1>
    <form action="/user/join" method="post" onsubmit="return fn_updateFormCheck();"> 
        <label> 
        	<input type="hidden" id="user_googleId" name="user_googleId" value="${BasicProfile.getId () }">
			<input type="hidden" id="user_googleImg" name="user_googleImg" value="${BasicProfile.getImageUrl () }">
        	
            <p class="label-txt"><spring:message code="user.myInfoForm.nickname" /></p> 
            <input type="text" class="input" id="user_name" name="user_name">
            <input id="button" type="button" value="중복체크">
            <div class="line-box"> 
                <div class="line">
                </div> 
            </div> 
        </label> 

 
        <label> 
            <p class="label-txt"><spring:message code="user.myInfoForm.zip" /></p> 
            <input type="text" class="input" id="user_zip" name="user_zip"> <input id="button" type="button" value="주소검색">
            <div class="line-box"> 
                <div class="line">
                </div> 
            </div> 
        </label> 
        <label> 
            <p class="label-txt"><spring:message code="user.myInfoForm.address" /></p> 
            <input type="text" class="input" id="user_address" name="user_address"> 
            <div class="line-box"> 
                <div class="line">

                </div>
            </div> 
        </label> 
        <label> 
            <p class="label-txt"><spring:message code="user.myInfoForm.email" /></p> 
            <input type="text" class="input" id="user_email" name="user_email" > <input id="button" type="button" value="중복체크">
            <div class="line-box"> 
                <div class="line">

                </div> 
            </div> 
        </label> 

        <label> 
            <p class="label-txt"><spring:message code="user.myInfoForm.interest" /></p> 
            <input type="text" class="input" id="userInterest_interest" name="userInterest_interest"> 
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