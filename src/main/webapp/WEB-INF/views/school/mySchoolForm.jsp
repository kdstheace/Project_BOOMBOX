<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>My School!</title>
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
    <jsp:include page="/WEB-INF/views/menu/navi-school.jsp" />    
    
    
    <style>
				
		/* feed-small */
		.head-image {
			height: 300px;
		}
		
		.rounded-circle {
			width: 48px;
		}
		
		.feed-small {
			height: 480px;
		}
		
		.small-feed-info {
			color: #606060;
		}

		/*피드 로우*/
		.recommendRow{
			white-space:nowrap; 
		}	
		
		.grid_title {
		    font-size: 30px;
		}
		
		.main_container {
		    padding-top: 10px;
		    padding-left: 10px;
		}
		
		.allSize{
			margin: 30px;
			max-width: 100%;
		}
		
		.schoolMainMenu{
			font-size: 20px;
		}

			.schoolMainMenu a:hover{
			background-color: orange;
			color: black;
		}

    </style>    
</head>


<body>

	<div class="allSize" id="allSize" style="margin: 1%">
	<div class="schoolMainMenu">
		<a href="/school/schoolForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;"> All </a> &emsp; 
		<a href="/school/mySchoolForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;  color: rgb(0, 56, 161); background-color: rgb(189, 225, 255);">My School</a> &emsp; 
		<a href="/school/homeTrainingForm" class="btn btn-dark"  style="width: 170px; height: 40px; font-size: 22px;">홈트레이닝</a> &emsp; 
		<a href="/school/kidsForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">Kids</a> &emsp; 
		<a href="/school/broadcastDanceForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">방송댄스</a> &emsp; 
		<a href="/school/clubDanceForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">클럽댄스</a> &emsp; 
		<a href="/school/hiphopForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">힙합</a> &emsp; 
		<a href="/school/othersForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">Others</a>
	</div>

	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">








<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
<!-- main content -->
		<div class="row main_container">
			<div class="col-md-12">

<!-- Recommended section -->
				<div class="container-fluid">

							<div class="row recommendRow">
					<div class="grid_title">홈 트레이닝</div>

								<div class="container-fluid mt-3 pl-2">
									<a href="#">
										<div>
											<div class="row">
												<div class="col-md-2" >
													<div style="width: 100%; text-align: center;">
													<!-- <div style="position: relative; z-index: 5;"> -->
														<img class="rounded-circle" src="/resources/img/profile.jpg" alt="image" width="200" style="margin: 0 auto; width: 150px"/>
													</div><br>
													<div style="text-align: center;">
														<p class=small-feed-info>
                                                        sxutte <i class="fas fa-check-circle"></i> 팔로워 몇명 <i class="fas fa-eye"></i> 영상수 몇개
                                                        <br>
                                                        전문분야 : 홈트레이닝
                                                    </p>
													</div>
												</div>
												<div class="col-md-10">
													<img src="/resources/img/yyy	.png" alt="image" width="100%" height="230" style=" border-radius: 10px;" />
												</div>
											</div>
										</div>
									</a>
								</div>
								
								

								<div class="container-fluid mt-3 pl-2">
									<a href="#">
										<div>
											<div class="row">
												<div class="col-md-2" >
													<div style="width: 100%; text-align: center;">
													<!-- <div style="position: relative; z-index: 5;"> -->
														<img class="rounded-circle" src="/resources/img/profile.jpg" alt="image" width="200" style="margin: 0 auto; width: 150px"/>
													</div><br>
													<div style="text-align: center;">
														<p class=small-feed-info>
                                                        sxutte <i class="fas fa-check-circle"></i> 팔로워 몇명 <i class="fas fa-eye"></i> 영상수 몇개
                                                        <br>
                                                        전문분야 : 홈트레이닝
                                                    </p>
													</div>
												</div>
												<div class="col-md-10">
													<img src="/resources/img/banner_3.png" alt="image" width="100%" height="230" style=" border-radius: 10px;" />
												</div>
											</div>
										</div>
									</a>
								</div>



								<div class="container-fluid mt-3 pl-2">
									<a href="#">
										<div>
											<div class="row">
												<div class="col-md-2" >
													<div style="width: 100%; text-align: center;">
													<!-- <div style="position: relative; z-index: 5;"> -->
														<img class="rounded-circle" src="/resources/img/profile.jpg" alt="image" width="200" style="margin: 0 auto; width: 150px"/>
													</div><br>
													<div style="text-align: center;">
														<p class=small-feed-info>
                                                        sxutte <i class="fas fa-check-circle"></i> 팔로워 몇명 <i class="fas fa-eye"></i> 영상수 몇개
                                                        <br>
                                                        전문분야 : 홈트레이닝
                                                    </p>
													</div>
												</div>
												<div class="col-md-10">
													<img src="/resources/img/banner_3.png" alt="image" width="100%" height="230" style=" border-radius: 10px;" />
												</div>
											</div>
										</div>
									</a>
								</div>



								<div class="container-fluid mt-3 pl-2">
									<a href="#">
										<div>
											<div class="row">
												<div class="col-md-2" >
													<div style="width: 100%; text-align: center;">
													<!-- <div style="position: relative; z-index: 5;"> -->
														<img class="rounded-circle" src="/resources/img/profile.jpg" alt="image" width="200" style="margin: 0 auto; width: 150px"/>
													</div><br>
													<div style="text-align: center;">
														<p class=small-feed-info>
                                                        sxutte <i class="fas fa-check-circle"></i> 팔로워 몇명 <i class="fas fa-eye"></i> 영상수 몇개
                                                        <br>
                                                        전문분야 : 홈트레이닝
                                                    </p>
													</div>
												</div>
												<div class="col-md-10">
													<img src="/resources/img/banner_3.png" alt="image" width="100%" height="230" style=" border-radius: 10px;" />
												</div>
											</div>
										</div>
									</a>
								</div>










								
							</div>

						</div>
					</div>
				</div>
<!-- main content -->

		</div>
	</div>
<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->






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