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

#myStagefeed {
	float: right;
}

/* 스타일 추가 */
#mystageStyle {
	width: 1500px;
}

#stageVideoStyle {
  	width: 300px;
	height: 80px;
	line-height: 20px ;
}


#feedSizs{
height: 350px;
}

/* feed-small */
.head-image {
	height: 250px;
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

/* style */
#infoStyle{

}

#videoFeed {
	width:1060;
	margin-bottom: 20;
	margin-left : 15px;

	height:800;

	border: 5px solid transparent;
	border-radius: 20px;
	box-sizing: border-box;
 	display: 5px solid transparent;
	background-image: linear-gradient(#444444, #444444), linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);  border-image-slice: 1;
 	background: #D8D8D8;
}
#propileStyle {
	margin-bottom: 20;
	margin-top: 7;
	width: 220;
	height: 803;
	border: 5px solid transparent;
	border-radius: 20px;
	 box-sizing: border-box;
  display: 5px solid transparent;
background-image: linear-gradient(#444444, #444444), linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);  border-image-slice: 1;
  background: #f7f7f7;
}

#proFileStyleCircleshape1 {
    margin: 20;
    width: 150px;
    height: 150px;
    border-radius: 70%;
    overflow: hidden;
}

.proFileStyleCircleshape2{
	 width: 100%;
    height: 100%;
    object-fit: cover;
}
.row{
height: 120;
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

	    var upload=	 window.open("/stage/updateStageForm?stage_user_id="+${myStage.stage_user_id }, "updateStageForm","width=650, height=950");

    	}
    /* 신고하기 수정 */
    function reportForm(){
	    var upload=	 window.open("/report/reportForm?stage_user_id="+${myStage.stage_user_id }, "reportForm","width=650, height=950");

    	}



    </script>

</head>

<body>
<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
	<!--Main Contents-->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<!-- main content -->
			<div class="row ">
				<div id="mystageStyle" class="col-md-12">
						<!-- Recommended section -->
					<div class="container-fluid">
							<div class="row" >
								<div style="width: 1300;">
									<br>
									<!-- 배너사진 -->
									<div class="text-left">
										<c:choose>
											<c:when test="${myStage.stage_bannerImgO != null }">
												<div class="pb-3">
													<img alt="uploadPhoto"
														src="/stage/banner?stage_user_id=${myStage.stage_user_id }" height="200px"
														width="100%">
												</div>
											</c:when>
											<c:otherwise>
												<div class="pb-3">
													<img alt="BannerPhoto"
														src="/resources/img/myStage/defaultPhotoBar.png"
														height="200px" width="100%">
												</div>
											</c:otherwise>
										</c:choose>


									</div>
									<div id="infoStyle" class="container-fluid">
										<div class="row recommendRow">

										<div id="propileStyle"
											class="col-md-2 col-sx-10 p-2 feed-small">

										<!-- 프로필사진 -->
											<div >

													<div id="proFileStyleCircleshape1">
												<c:choose>
													<c:when test="${myStage.stage_profileImgO != null }">
														<img class="proFileStyleCircleshape2" alt="ProfileImg"
															src="/stage/profile?video_user_id=${myStage.stage_id }" height="200px"
															width="220px">

													</c:when>
													<c:otherwise>
														<img class="proFileStyleCircleshape2" alt="ProfileImg" src="${url }" height="200px"
															width="220px">
													</c:otherwise>
												</c:choose>
													</div>
												<p><br></p>
												<h4><br>${list[0].USER_NAME }</h4>
												<h5>Follow : ${countFollow }</h5>

											</div>

										<!-- 수정하기 팔로우 -->
										<div>
										<c:choose>
											<c:when test="${sessionScope.loginId == myStage.stage_user_id }">
												<div >
													<a class="btn btn-primary" role="button" onclick="updateStageForm();">수정 하기</a>
												</div>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${flag }">
														<div>
															<a class="btn btn-primary" href="/stage/deleteFollow?stage_user_id=${myStage.stage_user_id }" role="button" >취소하기</a>
														</div>
													</c:when>
													<c:otherwise>
														<div>
															<a class="btn btn-primary" href="/stage/insertFollow?stage_user_id=${myStage.stage_user_id }" role="button" >Follow</a>
														</div>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										</div>


										<!-- 프로필사진 -->

											<div>
												<div>
												<p><br></p>
													<h4>Intro</h4>
												</div>
												<c:choose>
													<c:when test="${myStage.stage_intro != null }">
														<div class="card">${myStage.stage_intro }</div>
													</c:when>
													<c:otherwise>
														<div class="card ">소개글을 적어주세요.</div>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-10 pt-5 pl-2">

												<c:if
													test="${sessionScope.loginId != myStage.stage_user_id }">
													<div>
														<a class="btn btn-primary" href="#" role="button"
															onclick="reportForm();">신고하기</a>
													</div>
												</c:if>
											</div>
										</div>

										<!--영상시작-->

									<div id="stageVideoStyle" class="col-md-9 col-sx-8 p-2 feed-small">
										<div id="videoFeed" class="row recommendRow">

							<!--FEED-SMALL-->
                            <c:forEach items="${list }" var="video">
                                <div class="col-md-3 col-sx-10 p-2 feed-small">
                                    <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
                                        <div class="card">
                                            <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image"
                                                alt="image" />
                                            <div class="row">
                                                <div class="col-3 mt-3 pl-4">
                                                    <c:choose>
                                                        <c:when test="${video.STAGE_PROFILEIMGO != null }">
                                                            <img id="img" height="50" src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
                                                                class="rounded-circle">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img id="img" height="50" src="${video.USER_GOOGLEIMG }" class="rounded-circle">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="col-9 mt-3">
                                                    <p class="mb-2 video_title" title="${video.VIDEO_TITLE }">
                                                        ${video.VIDEO_TITLE }
                                                    </p>
                                                    <p class=small-feed-info>
                                                        ${video.USER_NAME } <i class="fas fa-check-circle"></i> ${video.countFollow} <i class="fas fa-eye"></i> ${video.VIDEO_HIT } 
                                                        <br>
                                                        ${video.VIDEO_INDATE }
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>

                                <!--FEED-SMALL Ends-->

										</div>
										</div>
										</div>
									</div>

								</div>
							</div>





					</div>

				</div>

			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- /#wrapper -->
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>

</body>
</html>