<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
				<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
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
						gapi.load('auth2', function () {
							gapi.auth2.init();
						});
					}

				    function updateInfoForm(){
				    	window.open("/user/updateInfoForm", "updateInfoForm","width=650, height=950");
				    	}

				    function crmForm(){
				    	window.open("/manager/crmForm", "crmForm","width=650, height=950");
				    	}
			    	
				    function bmApplyForm(){
				    	window.open("/boomMaster/bmApplyForm", "bmApplyForm","width=650, height=950");
				    	}
									
					function searchFnc(page){
						var searchform = document.getElementById("searchForm");
						console.log("펑션으로 들어옴.");
						document.getElementById("page").value = page;
						searchForm.submit();
						}

				</script>
				
				<style type="text/css">
									* {
						font-family: 'Do Hyeon';
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

					@media (min-width : 768px) {
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
										.rounded-circle {
						width: 48px;
					}
					        .nav-btn > a > img{
            width : 30px;
            display : block;
            margin : auto;
            height : 30px;

        }

        .nav-link{
            width: 80px;
            text-align : center;
        }    
					
				
				</style>

</head>
<body>
				<nav class="navbar navbar-expand-lg navbar-light bg-light upper-bar">
					<div class="col-3">
						<a href="/"><img src="/resources/img/logo_home.png" class="main-logo img-fluid"></a>
					</div>

					<form action="/video/searchForm" method="get" id="searchForm" class="form-inline my-2 my-lg-0 col-6">
						<input type="hidden" name="page" id="page">
						<input class="form-control mr-sm-2 search-bar" type="search" name = "searchText" value="${searchText }"
							placeholder="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="searchFnc(1);">Search</button>
					</form>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse col-3" id="navbarSupportedContent">
						<ul class="navbar-nav col-3">
							<li class="nav-item nav-btn active"><a class="nav-link" href="/video/editorForm"><img src="/resources/img/nav/edit.png">Editor</a></li>
							<li class="nav-item nav-btn active"><a class="nav-link" href="/video/uploadForm"><img src="/resources/img/nav/upload.png">Upload</a>
							</li>
							<li class="nav-item nav-btn active"><a class="nav-link" href="/others/alarmForm"><img src="/resources/img/nav/alarm.png">Alarm</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
									id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <img id="img" src="${sessionScope.loginImg }"
										class="rounded-circle">
									${sessionScope.loginName }
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" onclick="updateInfoForm();">개인정보 수정</a> <a
							class="dropdown-item" href="/stage/myStageForm">My Stage</a> <a
							class="dropdown-item" href="/membership/membershipForm">결제 및 멤버십</a> 
						<a class="dropdown-item" onclick="bmApplyForm();">붐마스터
							관리</a> <a class="dropdown-item" onclick="crmForm();">고객센터</a>
						<div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#" onclick="signOut();">로그아웃</a>
				
								</div>
							</li>
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
</body>
</html>