<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>

<head>
    <title>Home</title>
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
        .main_container {
            padding-top: 30px;
            padding-left: 30px;
        }

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
        .video_title{
        	overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: nowrap;
        }

        /*피드 로우*/
/*         .recommendRow {
            white-space: nowrap;
            overflow-x: auto;

        }*/   
        
        /*광고*/ 
        .ad{
            width: 100%;
            height: 200px;
            background-size: contain;
            background-position: center;
            cursor: pointer;
        }
 	</style>

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
                            <c:forEach items="${listFollow }" var="video">
                            	<c:choose>
                            		<c:when test="${video.VIDEO_CLASS ==2}">
		                            	<div class="col-md-3 col-sx-10 p-2 feed-small" style="background-color: #ffc107;">
		                                    <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
		                                        <div class="card">
		                                            <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image"
		                                                alt="image" />
		                                            <div class="row">
		                                                <div class="col-3 mt-3 pl-4">
		                                                    <c:choose>
		                                                        <c:when test="${video.STAGE_PROFILEIMGO != null }">
		                                                            <img id="img" height="50"  src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
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
                            		</c:when>
                            		<c:otherwise>
		                            	<div class="col-md-3 col-sx-10 p-2 feed-small">
		                                    <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
		                                        <div class="card">
		                                            <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image"
		                                                alt="image" />
		                                            <div class="row">
		                                                <div class="col-3 mt-3 pl-4">
		                                                    <c:choose>
		                                                        <c:when test="${video.STAGE_PROFILEIMGO != null }">
		                                                            <img id="img" height="50"  src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
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
                            		</c:otherwise>
                            	</c:choose>
                  
                            </c:forEach>

                                <!--FEED-SMALL Ends-->

                        </div>
                    </div>
                    <hr>
                    <!-- Recommended Section -->
                    
                    <!-- Trending Section -->
                    <div class="container-fluid">
                        <div class="grid_title">Trending</div>
                        <div class="row recommendRow">
                            <!--FEED-SMALL-->
                            <c:forEach items="${list }" var="video">
                        		<c:choose>
                        			<c:when test="${video.VIDEO_CLASS ==2}">
		                                <div class="col-md-3 col-sx-10 p-2 feed-small" style="background-color: #ffc107;">
		                                    <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
		                                        <div class="card">
		                                            <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image"
		                                                alt="image" />
		                                            <div class="row">
		                                                <div class="col-3 mt-3 pl-4">
		                                                    <c:choose>
		                                                        <c:when test="${video.STAGE_PROFILEIMGO != null }">
		                                                            <img id="img"  height="50"  src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
		                                                                class="rounded-circle">
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                            <img id="img"  height="50"  src="${video.USER_GOOGLEIMG }" class="rounded-circle">
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
                        			</c:when>
                        			<c:otherwise>
		                                <div class="col-md-3 col-sx-10 p-2 feed-small">
		                                    <a href="/video/watchForm?video_id=${video.VIDEO_ID}">
		                                        <div class="card">
		                                            <img src="/video/thumbnail?video_id=${video.VIDEO_ID}" class="head-image"
		                                                alt="image" />
		                                            <div class="row">
		                                                <div class="col-3 mt-3 pl-4">
		                                                    <c:choose>
		                                                        <c:when test="${video.STAGE_PROFILEIMGO != null }">
		                                                            <img id="img"  height="50"  src="/stage/profile?video_user_id=${video.VIDEO_USER_ID}"
		                                                                class="rounded-circle">
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                            <img id="img"  height="50"  src="${video.USER_GOOGLEIMG }" class="rounded-circle">
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
                        			</c:otherwise>
                        		</c:choose>
                        		
                        		
                        		

                            </c:forEach>
                                <!--FEED-SMALL Ends-->


                        </div>
                        
                    </div>
                    <hr>
                    <!-- Trending Section Ends-->

                        <div class="container-fluid">
	                        <div class="grid_title">AD</div>
	                        <div class="row recommendRow" >

	                            <!--FEED-SMALL-->
	 							<div >
	 								<a href="${advo.ad_redirect_URL }"><img style="width: 123%; margin-bottom: 30px;" class="ad" alt="homeADbanner" src="/manager/homeADbanner"></a>
	 							</div>

	                            <!--FEED-SMALL Ends-->

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

    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
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