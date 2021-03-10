<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <jsp:include page="/WEB-INF/views/menu/navi-school.jsp" />    
    
    
    <script> $('.carousel').carousel({ interval: 2000 }) </script>

    
    <style>
    
    
    
    .carousel-inner > .carousel-item > img{  width: 100%; height: 500px;  }

    
    
    
				
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
		

		
							<!-- -->
							
/* 							.navbar {
					  background-color: #333;
					  width: 100%;
					} */
					
					/* Style the links inside the navigation bar */
					
					
/* 					.navbar a {
					  float: left;
					  color: #f2f2f2;
					  text-align: center;
					  padding: 14px 16px;
					}
					 */
					
					
					/* Change the color of links on hover */
					
					
/* 					.navbar a:hover {
					  background-color: #ddd;
					  color: black;
					}
					 */
					
					/* Add a color to the active/current link */
					
					
/* 					.navbar a.active {
					  background-color: #bbe1f4;
					  color: white;
					}
					
					.nav-font {
					  font-size: 25px;
					} */
							

    </style>    
</head>


<body>

	<div class="allSize" id="allSize" style="margin: 1%">
	<div class="schoolMainMenu">
		<a href="/school/schoolForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;"> All </a> &emsp; 
		<a href="/school/mySchoolForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">My School</a> &emsp; 
		<a href="/school/homeTrainingForm" class="btn btn-dark"  style="width: 170px; height: 40px; font-size: 22px; color: rgb(0, 56, 161); background-color: rgb(189, 225, 255);">홈트레이닝</a> &emsp; 
		<a href="/school/kidsForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">Kids</a> &emsp; 
		<a href="/school/broadcastDanceForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">방송댄스</a> &emsp; 
		<a href="/school/clubDanceForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">클럽댄스</a> &emsp; 
		<a href="/school/hiphopForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">힙합</a> &emsp; 
		<a href="/school/othersForm" class="btn btn-dark" style="width: 170px; height: 40px; font-size: 22px;">Others</a>
	</div>

	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">

<!-- 
    <div class="navbar">
        <a href="../home/home.html" class="col-1 nav-font">All</a>
        <a href="../activity/activity_main.html" class="active col-1 nav-font">My School</a>
        <a href="../search/search_main.html" class="col-1 nav-font">홈트레이닝</a>
        <a href="../profile/profile_main.html" class="col-1 nav-font">Kids</a>
        <a href="../profile/profile_main.html" class="col-1 nav-font">방송댄스</a>
        <a href="../profile/profile_main.html" class="col-1 nav-font">클럽댄스</a>
        <a href="../profile/profile_main.html" class="col-1 nav-font">힙합</a>
        <a href="../profile/profile_main.html" class="col-1 nav-font">Others</a>
    </div>


	<hr class="one" style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">

	 -->
	
	
	
	
			<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
			
				<!-- main content -->
				<div class="row main_container">
					<div class="col-md-12">
					
					<h2>추천 강사</h2>	
				<div class="container"></div> 
				<div id="demo" class="carousel slide" data-ride="carousel"> 
					<div class="carousel-inner"> 
					
						<!-- 슬라이드 쇼 --> 
						<div class="carousel-item active"> 
							<!--가로--> 
							<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide"> 
							<div class="carousel-caption d-none d-md-block"> 
							</div> 
						</div> 
						
						<div class="carousel-item"> 
						
							<img class="d-block w-100" src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="Second slide"> 
						</div> 
						<div class="carousel-item"> 
							<img class="d-block w-100" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide"> 
						</div> 
						<!-- / 슬라이드 쇼 끝 --> 
						
						<!-- 왼쪽 오른쪽 화살표 버튼 --> 
						<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
							
							<!-- <span>Previous</span> --> 
						</a> 
							<a class="carousel-control-next" href="#demo" data-slide="next"> 
								<span class="carousel-control-next-icon" aria-hidden="true"></span> 
							<!-- <span>Next</span> --> </a> 
							
							<!-- / 화살표 버튼 끝 --> 
							
							<!-- 인디케이터 --> 
							<ul class="carousel-indicators"> 
								<li data-target="#demo" data-slide-to="0" class="active"></li> 
								
								<!--0번부터시작--> 
								<li data-target="#demo" data-slide-to="1"></li> 
								<li data-target="#demo" data-slide-to="2"></li>
							</ul> <!-- 인디케이터 끝 --> </div><br>
						
						
						<!-- Trending Section -->
						<div class="container-fluid">
							<div class="grid_title">Trending</div>
							<div class="row">
								<!--FEED-SMALL-->
								<c:forEach items="${list }" var="video">
									<div class="col-md-3 col-sx-10 p-2 feed-small">
										<a href="/video/watchForm?video_id=${video.VIDEO_ID}">
											<div class="card">
												<img src="/video/thumbnail?video_id=${video.VIDEO_ID}"
													class="head-image" alt="image" />
												<div class="row">
													<div class="col-2 mt-3 pl-4">
													<c:choose>
														<c:when test="${video.STAGE_PROFILEIMGO != null }">
															<img id="img" src="/stage/profile?=${myStage.stage_id }" class="rounded-circle">
														</c:when>
														<c:otherwise>
															<img id="img" src="/resources/img/myStage/defultProfileImg.png" class="rounded-circle">
														</c:otherwise>
													</c:choose>
													</div>
													<div class="col-10 mt-3">
														<p class="mb-2" title="${video.VIDEO_TITLE }">
															${video.VIDEO_TITLE }
														</p>
														<p class=small-feed-info>
															${video.USER_NAME } <i
																class="fas fa-check-circle"></i><br>
															${video.VIDEO_HIT } views ${video.VIDEO_INDATE }
														</p>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
								<!--FEED-SMALL Ends-->
	
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
	
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
								<!--FEED-SMALL-->
								<div class="col-md-3 col-sx-10 p-2 feed-small">
									<a href="">
										<div class="card">
											<img src="https://picsum.photos/200/300" class="head-image"
												alt="image" />
											<div class="row">
												<div class="col-2 mt-3 pl-4">
													<img id="img"
														src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
														class="rounded-circle">
												</div>
												<div class="col-10 mt-3">
													<p class="mb-2"
														title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE |
														Sushant,
													</p>
													<p class=small-feed-info>
														T-Series <i class="fas fa-check-circle"></i><br> 70M
														views 7 months ago
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!--FEED-SMALL Ends-->
								
							</div>
						</div>
						<!-- Trending Section -->
						
						<p>
							<br>
						</p>
						<p>
							<br>
						</p>
					</div>
				</div>
				<!-- main content -->
	
			</div>
		</div>
		<!-- /#page-content-wrapper -->
		
	</div>
	<!-- /#wrapper -->
	
	

	
	
	
	
	
	
	
	
	
	
	














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