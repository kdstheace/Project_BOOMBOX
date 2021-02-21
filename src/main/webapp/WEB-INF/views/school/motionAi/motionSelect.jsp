<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BOOM SCHOOL</title>
    <link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <!-- google -->
    <meta name="google-signin-scope" content="profile email">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
        content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">
        
    <style>
        .grid_title {
            font-size: 30px;
        }

        .main_container {
            padding-top: 30px;
            padding-left: 30px;
        }

    </style>    
</head>

<body>
	<jsp:include page="/WEB-INF/views/menu/navi-school.jsp" />
    <!-- Page Content -->
    <div id="page-content-wrapper">
       <div class="container-fluid">
          <!-- main content -->
          <div class="row main_container">
             <div class="col-md-12">
             
             <!-- 여기에 쓰면 된다!! -->
             	<a href="/motion/count?motion_video_id=${motion_video_id }">Count</a>
				<a href="/motion/pose?motion_video_id=${motion_video_id }">Pose Accuracy</a>
             
             
	 		 </div>
		  </div>
	   </div>
	</div>

   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
      integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
      crossorigin="anonymous"></script>
      </body>
</html>