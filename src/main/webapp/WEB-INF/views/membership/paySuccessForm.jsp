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
				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
				<!-- google -->
				<meta name="google-signin-scope" content="profile email">
				<meta http-equiv="X-UA-Compatible" content="ie=edge">
				<script src="https://apis.google.com/js/platform.js" async defer></script>
				<meta name="google-signin-client_id"
					content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">







				<style>
				        .main_container{
				        	padding-top : 30px;
				        	padding-left : 30px;
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
					/*피드 로우*/
					.recommendRow{
						white-space:nowrap;
				    	overflow-x: auto;

				    	}
				</style>

			</head>

			<body>


				<jsp:include page="/WEB-INF/views/menu/navi.jsp" />



	<div style="    margin: 80px;"  class="col-md-8 video_box">
			<div class="p-4 pt-3">
				<a style="font-size: 60px"><spring:message code="paySuccessForm.sucess.title" /></a>
			</div>
			<br>



				<div class="p-5 pt-3">
					<a style="font-size: 40px"><spring:message code="paySuccessForm.sucess.content" /> </a><br><br>
					<a style="font-size: 30px" href="/membership/membershipForm"> >><spring:message code="paySuccessForm.sucess.move" /><< </a>

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
				<!-- 구글 -->
				<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

			</body>

			</html>