<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a6b1415e6e.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>

<!-- google -->
<meta name="google-signin-scope" content="profile email">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">


<style>


@media ( min-width : 768px) {
	#sidebar-wrapper {
		margin-left: 0;
	}
	#page-content-wrapper {
		min-width: 0;
		width: 100%;
	}
	#wrapper.toggled #sidebar-wrapper {
		margin-left: -15rem;
	}
}
#myStagefeed{

 float: right;


}


/* feed-small */
.head-image {
	height: 320px;
}

.rounded-circle {
	width: 48px;
}

.feed-small {
	height: 500px;
}

.small-feed-info {
	color: #606060;
}
</style>
<!-- 구글 -->
<script type="text/javascript">
    function onSignIn(googleUser) {
    	  var profile = googleUser.getBasicProfile();
    	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    	  console.log('Name: ' + profile.getName());
    	  console.log('Image URL: ' + profile.getImageUrl());
    	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    	}

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          location.href = "/user/logout";
        });
      }

    function onLoad() {
        gapi.load('auth2', function() {
          gapi.auth2.init();
        });
      }


	/* 스테이지 수정 */
    function updateStageForm(){
	    var upload=	 window.open("/stage/updateStageForm", "updateStageForm","width=650, height=950");

    	}
    /* 신고하기 수정 */
    function reportForm(){
	    var upload=	 window.open("/report/reportForm", "reportForm","width=650, height=950");

    	}



    </script>

</head>

<body>
<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
	<!--Main Contents-->
	<div class="d-flex" id="wrapper">


		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<!-- main content -->
				<div class="row main_container">
					<div class="col-md-12">
						<!-- Recommended section -->
						<div class="container-fluid">
							<div class="p-3 pt-5"><h1>My Stage </h1></div>

								<div >

								<div class="row p-2">
									<div class=" text-left" >
									<br>
									<!-- 배너사진 -->
									<div class="text-left">
										<c:choose>
											<c:when test="${myStage.stage_bannerImgO != null }">
												<div class="pl-5 pr-5 pb-5"><img  alt="uploadPhoto" src="/stage/banner?=${myStage.stage_id }" height="200px" width="1000px"></div>
											</c:when>
											<c:otherwise>
												<div class="pl-5 pr-5 pb-5"><img   alt="BannerPhoto" src="/resources/img/myStage/defultPhotoBar.png" height="200px" width="1000px"></div>
											</c:otherwise>
										</c:choose>


									</div>

										<!-- 프로필사진 -->
										<div class=" pl-2">

										<c:choose>
											<c:when test="${myStage.stage_profileImgO != null }">
												<img  alt="ProfileImg" src="/stage/profile?=${myStage.stage_id }" height="200px" width="150px">
											</c:when>
											<c:otherwise>
												<img  alt="ProfileImg" src="${url }" height="200px" width="150px">
											</c:otherwise>
										</c:choose>
										<h4 >프로필 사진</h4>

										</div>

										<!-- 수정하기 팔로우 -->
										<!-- 아직 회원가입시 보이는 수정하기 버튼이 보이지 않아 팔로워버튼으로 해놓은상태 -->

										<div class=" pl-2">
										<c:choose>
											<c:when test="${sessionScope.loginId == myStage.stage_user_id }">
												<div >
													<a class="btn btn-primary" href="#" role="button" onclick="updateStageForm();">수정 하기</a>
												</div>
											</c:when>

											<c:otherwise>
											<c:choose>
											<c:when test="${follow.follow_id ==null}">
														<div>
															<a class="btn btn-primary" href="/stage/insertFollow?stage_id=${myStage.stage_id }&stage_user_id=${myStage.stage_user_id }" role="button" >Follow</a>
														</div>

												</c:when>
												<c:otherwise>
														<div>
															<a class="btn btn-primary" href="/stage/deleteFollow?follow_id=${follow.follow_id }&stage_user_id=${myStage.stage_user_id }" role="button" >취소하기</a>
														</div>
												</c:otherwise>

											</c:choose>
											</c:otherwise>
										</c:choose>
										</div>

										<!-- 프로필사진 -->
										<div class="col-2 mt-3 pl-4">
											<div><h4>Intro</h4></div>
												<c:choose>
													<c:when test="${myStage.stage_intro != null }">
													<div class="card">${myStage.stage_intro }</div>
													</c:when>
													<c:otherwise>
													<div class="card ">소개글을 적어주세요.</div>
													</c:otherwise>
												</c:choose>
										</div>

										<div class="pt-5 pl-2">

											<c:if test="${sessionScope.loginId != myStage.stage_user_id }">
												<div >
													<a class="btn btn-primary" href="#" role="button"   onclick="reportForm();">신고하기</a>
												</div>
											</c:if>


										</div>

											<div id="myStagefeed" class="container-fluid ">
											<div class="grid_title">Recommended</div>


											<div class="p-2 text-left">

												<!--FEED-SMALL-->
											<c:forEach items="${list }" var="video">
												<div class="col-md-3 col-sx-10 p-2 feed-small">
													<a href="/video/watchForm?video_id=${video.VIDEO_ID}">
														<div class="card">
															<img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image" alt="image" />
															<div class="row">
																<div class="col-2 mt-3 pl-4">
																	<img id="img"
																		src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
																		class="rounded-circle">
																</div>
																<div class="col-10 mt-3">
																	<p class="mb-2"
																		title="${video.VIDEO_TITLE }">
																		${video.VIDEO_TITLE }
																	</p>
																	<p class=small-feed-info>
																		${video.USER_NAME } <i class="fas fa-check-circle"></i><br>
																		${video.VIDEO_HIT } views ${video.VIDEO_INDATE }
																	</p>
																</div>
															</div>
														</div>
													</a>
												</div>
												<!--FEED-SMALL Ends-->
											</c:forEach>

											</div>
										</div>


									</div>






								</div>



<!-- Page Content -->
		<div id="page-content-wrapper"  class="text-left" >
			<div >
				<!-- main content -->
				<div class="row main_container">
					<div class="row">
						<!-- Recommended section -->



						<!-- Recommended Section -->

						<hr>

						<!-- Trending Section -->
						<div class="container-fluid">
							<div class="grid_title">Trending</div>
							<div class="row">
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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
														Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant,
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

			<!-- 영상 다이브끝 -->
			</div>
		</div>
		</div>

</div>

		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	</div>
	</div>



	</div>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
		<!-- 구글 -->
	    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

</body>
</html>