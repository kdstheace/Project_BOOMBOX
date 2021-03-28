<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- 구글로그인 -->
	<meta name="google-signin-scope" content="profile email">
	
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name = "google-signin-client_id"content = "290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">
        <link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
	
	
    <style type="text/css">
    * {
	font-family: 'Do Hyeon';
	font-size: 20px;
}    
    body{
    padding: 0px;
    margin: 0px;
    background-color: antiquewhite;
}

.backVideo{
    width: 100%;
    height: 900px;
    overflow: hidden;
    margin: 0px auto;
    position: relative;
    /* text-align: left; */
}

video{
    width: 100%;
}

.frontBox{
    position: absolute;
    top: 30%;
    width: 80%;
    height:40%;
    padding: 40px;
    background-color: rgba(255, 255, 255, 0);
    margin: 0 auto;

    transform: translate(-50%); /* 추가 */
    left: 50%; /* 추가 */
}

.front_Logo{
    text-align: center;
}

.front_text{
    margin-top: -24px; 
    text-align: left; 
    font-size: 35px; 
    color: #ff0bae;
    margin: 0px auto;
}

.front_googleLogin{
        margin: 0px 5% ;
}
    
    </style>
 <style>
      * { box-sizing: border-box; }
      body { margin: 0px; }
      main { padding-bottom: 100px; }
      header {
        background-color: #ffeb3b;
        height: 700px;
        padding: 100px;
      }
      section {
        display: flex;
        justify-content: space-between;
        padding: 5%;
      }
      section div {
        background-color: #ff9800;
        width: 23%;
        height: 300px;
      }

      /* Scroll Animation (sa, 스크롤 애니메이션) */
      .sa {
        opacity: 0;
        transition: all .5s ease;
      }

      /* 아래에서 위로 페이드 인 */
      .sa-up {
        transform: translate(0, 100px);
      }
      /* 위에서 아래로 페이드 인 */
      .sa-down {
        transform: translate(0, -100px);
      }
      /* 왼쪽에서 오른쪽으로 페이드 인 */
      .sa-right {
        transform: translate(-100px, 0);
      }
      /* 오른쪽에서 왼쪽으로 페이드 인 */
      .sa-left {
        transform: translate(100px, 0);
      }
      /* 왼쪽으로 회전하면서 페이드 인 */
      .sa-rotateL {
        transform: rotate(180deg);
      }
      /* 오른쪽으로 회전하면서 페이드 인 */
      .sa-rotateR {
        transform: rotate(-180deg);
      }
      /* 작아진 상태에서 커지면서 페이드 인 */
      .sa-scaleUp {
        transform: scale(.5);
      }
      /* 커진 상태에서 작아지면서 페이드 인 */
      .sa-scaleDown {
        transform: scale(1.5);
      }

      .sa.show {
        opacity: 1;
        transform: none;
      }
    </style>    
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/user/joinForm.css"> -->
<title>Landing</title>

<script type="text/javascript">

function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);

	if(id_token != null) location.href = "/user/googleLogin?user_googleId="+profile.getId()+"&user_googleImg="+profile.getImageUrl();
/* 
	if(${sessionScope.loginName } == 1){
		location.href = "/user/googleLogin;";
		} */
    
  }

</script>


</head>
<body>

    <div class="backVideo">
        <video muted autoplay loop>
            <source src="/resources/videos/main02.mp4" type="video/mp4" >
        </video>
        <div class="frontBox">
            <img class="front_Logo" src="/resources/img/BOOMBOXsq.png" width="200px" style="align-items: center;">
            <p class="front_text">TURN IT LOOSE, GET FUNKY!</p><br><br>
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
        </div>
    </div>
<!--         <header>
      <h1>섹시<br />SEXYSOO</h1>
    </header>
    <main>
      <section>
        <div class="sa sa-up">디비전 1</div>
        <div class="sa sa-up">디비전 2</div>
        <div class="sa sa-up">디비전 3</div>
        <div class="sa sa-up">디비전 4</div>
      </section>
      <section>
        <div class="sa sa-up">디비전 5</div>
        <div class="sa sa-down">디비전 6</div>
        <div class="sa sa-right">디비전 7</div>
        <div class="sa sa-left">디비전 8</div>
      </section>
      <section>
        <div class="sa sa-rotateL">디비전 9</div>
        <div class="sa sa-rotateR">디비전 10</div>
        <div class="sa sa-scaleUp">디비전 11</div>
        <div class="sa sa-scaleDown">디비전 12</div>
      </section>
    </main>

    <script>
      // Scroll Animation (sa, 스크롤 애니메이션)
      const saTriggerMargin = 300;
      const saElementList = document.querySelectorAll('.sa');

      const saFunc = function() {
        for (const element of saElementList) {
          if (!element.classList.contains('show')) {
            if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
              element.classList.add('show');
            }
          }
        }
      }

      window.addEventListener('load', saFunc);
      window.addEventListener('scroll', saFunc);
    </script> -->
    
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>