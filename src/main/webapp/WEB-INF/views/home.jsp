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
* {
	font-family: 'Do Hyeon';
}

.grid_title {
	font-size: 30px;
}

.upper-bar {
	background-color: #ffd343 !important;
	font-size: 20px;
}

.search-bar {
	width: 70% !important;
	margin-left: 20px;
	min-width: 300px;
}

.main-logo {
	width: 300px;
	height: 100px;
	min-width: 300px;
}

.dropdown-item {
	font-size: 20px;
}

/* sidebar */
#wrapper {
	overflow-x: hidden;
}

#sidebar-wrapper {
	min-height: 100vh;
	margin-left: -15rem;
	-webkit-transition: margin .25s ease-out;
	-moz-transition: margin .25s ease-out;
	-o-transition: margin .25s ease-out;
	transition: margin .25s ease-out;
}

#sidebar-wrapper .sidebar-heading {
	padding: 0.875rem 1.25rem;
	font-size: 1.2rem;
}

#sidebar-wrapper .list-group {
	width: 15rem;
}

#page-content-wrapper {
	min-width: 100vw;
}

#wrapper.toggled #sidebar-wrapper {
	margin-left: 0;
}

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
    </script>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light upper-bar">
		<div class="col-3">
			<img src="/resources/img/logo_home.png" class="main-logo img-fluid"
				href="/">
		</div>

		<form action="/video/searchForm" method="get" id="searchForm"
			class="form-inline my-2 my-lg-0 col-6">
			<input class="form-control mr-sm-2 search-bar" type="search"
				value="${searchText }" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse col-3"
			id="navbarSupportedContent">
			<ul class="navbar-nav col-3">
				<li class="nav-item active"><a class="nav-link"
					href="/video/editorForm"><i class="fas fa-film"></i>Editor</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="/video/uploadForm"><i class="fas fa-cloud-upload-alt"></i>Upload</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="/others/alarmForm"><i class="fas fa-bell"></i>Alarm</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img id="img"
						src="${sessionScope.loginImg }" class="rounded-circle">
						${sessionScope.loginName } 
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/user/updateInfoForm">개인정보 수정</a> <a
							class="dropdown-item" href="/stage/myStageForm">My Stage</a> <a
							class="dropdown-item" href="/membership/membershipForm">결제 및 멤버십</a> 
						<a class="dropdown-item" href="/boomMaster/bmMngForm">붐마스터
							관리</a> <a class="dropdown-item" href="/manager/crmForm">고객센터</a>
						<div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#" onclick="signOut();">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<!--Main Contents-->
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a href="/" class="list-group-item list-group-item-action bg-light">Home</a>
				<a href="/school/schoolForm"
					class="list-group-item list-group-item-action bg-light">School</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">My
					Follows</a> 
				<a href="#" class="list-group-item list-group-item-action bg-light">Trending</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">Interests</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">History</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">Likes</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<!-- main content -->
				<div class="row main_container">
					<div class="col-md-12">
						<!-- Recommended section -->
						<div class="container-fluid">
							<div class="grid_title">Recommended</div>
							<div class="row">
							
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

			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->


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
