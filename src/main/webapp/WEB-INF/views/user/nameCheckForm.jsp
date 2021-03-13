<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>name 중복 체크 창</title>

<!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

        <!-- 구글로그인 -->
        <meta name="google-signin-scope" content="profile email">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id"
            content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">




<script type="text/javascript">
	function useName(user_name) {
		opener.document.getElementById("user_name").value = user_name;
		this.close();
	}

	function nameCheck(){
		var user_name = document.getElementById("user_name").value;
		
 	  	if(user_name == null || user_name.length == 0){
 			alert("닉네임을 입력해 주세요");
 			return false;
 		} else if(user_name.length < 3 || user_name.length > 8) {
 			alert("닉네임은 3~8글자 사이로 입력해 주세요");
 			return false;
 		}
 		return true;
	}
	
</script>

<style type="text/css">
            @charset "UTF-8";
            * {
                font-family: 'Do Hyeon', 'Sawarabi Gothic', sans-serif;
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



</head>
<body>

<div id="allSize" class="container">
	<p>
		<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo" width="15%" style="min-width: 120px; max-width: 200px;">
	</p>
	
	<h3>ID 중복 체크 창</h3>

	<form action="/user/nameCheck" method="post" onsubmit="return nameCheck();">
		<p class="label-txt">체크할 아이디</p>
		<input type="text" id="user_name" name="user_name">
		<input type="submit" value="확인">
		<div class="line"></div>
	</form>

	<br><br>

	<c:if test="${userOne.user_name != null}">
			<input type="text" readonly="readonly" style="width: 100%; color: red; text-align: center;" value="아이디가 중복입니다. 다시 입력해 주세요.">
	</c:if>

	<c:if test="${userOne.user_name == null}">
		<c:if test="${checkName.user_name != null}">
				<input type="text" readonly="readonly" style="width: 100%; text-align: center;" value="${checkName.user_name }는 사용 가능합니다."><br><br>
			<input type="button" value="적용하기" onclick="useName('${checkName.user_name }');">
		</c:if>
	</c:if>

</div>

</body>
</html>