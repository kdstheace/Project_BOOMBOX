<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="true" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<html>

			<head>
				<title>Home</title>
				<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
				<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
				<script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
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
					/*피드 로우*/
					.recommendRow{
						white-space:nowrap; 
				    	overflow-x: auto; 

				    	}	
				</style>
								<!-- 구글 -->



			</head>

			<body>
				<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
					<!-- Page Content -->
					<div id="page-content-wrapper">
						<div class="container-fluid">
							<!-- main content -->
							<div class="row main_container">
								<div class="col-md-12">
									<!-- Recommended section -->
									<div class="container-fluid">
										<div class="grid_title">Recommended</div>
										<div class="row recommendRow">
											<!--FEED-SMALL-->
											<c:forEach items="${list }" var="video">
												<div class="col-md-3 col-sx-10 p-2 feed-small">
													<a href="/video/watchForm?video_id=${video.VIDEO_ID}">
														<div class="card">
															<img src="/video/thumbnail?video_id=${video.VIDEO_ID}"
																class="head-image" alt="image" />
															<div class="row">
																<div class="col-2 mt-3 pl-4">
																	<img id="img"
																		src="./image/logo/27A21DBF-B559-40CC-8597-908DB5C55B74.jpeg"
																		class="rounded-circle">
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


				<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
					integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
					integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
					integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
					crossorigin="anonymous"></script>
				<!-- 구글 -->
				<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

			</body>

			</html>