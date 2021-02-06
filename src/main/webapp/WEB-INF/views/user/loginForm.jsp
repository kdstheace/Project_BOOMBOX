<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    
    <style type="text/css">
    
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
    background-color: rgba(255, 255, 255, 0.322);
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
    
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/user/joinForm.css"> -->
<title>로그인</title>

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

	if(id_token != null) location.href = "/user/googleLogin?id="+profile.getId();
    
  }

</script>


</head>
<body>

    <div class="backVideo">
        <video muted autoplay loop>
            <source src="/resources/videos/main02.mp4" type="video/mp4" >
            <strong>Your browser does not support the video tag. </strong>
        </video>
        <div class="frontBox">
            <img class="front_Logo" src="/resources/img/BOOMBOXsq.png" width="200px" style="align-items: center;">
            <p class="front_text">Boom Box 들어가는 입구 페이지</p><br><br>
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
        </div>
    </div>
    
    
    
    
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>