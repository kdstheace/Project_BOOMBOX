<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sawarabi+Gothic&display=swap" rel="stylesheet">
      	<!-- google -->
		<meta name="google-signin-scope" content="profile email">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<meta name="google-signin-client_id" content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">
		<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
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

            function updateInfoForm() {
                window.open("/user/updateInfoForm", "updateInfoForm", "width=650, height=950");
            }

            function crmForm() {
                window.open("/manager/crmForm", "crmForm", "width=650, height=950");
            }

            function bmApplyForm() {
                window.open("/boomMaster/bmApplyForm", "bmApplyForm", "width=650, height=950");
            }

            function searchFnc(page) {
                var searchform = document.getElementById("searchForm");
                console.log("펑션으로 들어옴.");
                document.getElementById("page").value = page;
                searchForm.submit();
            }

        </script>

        <style type="text/css">
            * {
                font-family: 'Do Hyeon', 'Sawarabi Gothic', sans-serif;
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
                background-color: black !important;
                font-size: 20px;
            }

            .search-bar {
                width: 70% !important;
                margin-left: 20px;
                min-width: 300px;
            }

            .main-logo {
                width: 50%;
                height: 50%;
                min-width: 200px;
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
                <a href="/school/schoolForm"><img src="/resources/img/boomSchool_main.png" class="main-logo img-fluid"></a>
            </div>

            <form action="/video/searchForm" method="get" id="searchForm" class="form-inline my-2 my-lg-0 col-6">
                <input type="hidden" name="page" id="page">
                <input class="form-control mr-sm-2 search-bar" type="search" name="searchText" value="${searchText }"
                    placeholder=<spring:message code="nav.searchbar.search" />>
                <button class="btn btn-outline-warning my-2 my-sm-0" type="button"
                    onclick="searchFnc(1);"><spring:message code="nav.searchbar.search" /></button>
            </form>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse col-3" id="navbarSupportedContent">
                <ul class="navbar-nav col-3">
                           <li class="nav-item dropdown active">
                    	<a class="nav-link dropdown active" href="#" id="langDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img id="img" src="/resources/img/nav/langY.png" class="rounded-circle" style="width:45%"><br><font color="yellow"><spring:message code="nav.button.region" /></font>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="langDropdown">
                            <a class="dropdown-item" href="/school/schoolForm?lang=ja">日本語</a>
                            <a class="dropdown-item" href="/school/schoolForm?lang=ko">한국어</a>
                            <a class="dropdown-item" href="/school/schoolForm?lang=en">English</a>
                        </div>
                    </li>
                    <li class="nav-item nav-btn active">
                     <a class="nav-link" data-toggle="modal" data-target="#termsModal">
                    <img src="/resources/img/nav/uploadY.png">
                    <font color="yellow">Upload</font></a>
                    </li>
                    <li class="nav-item nav-btn active"><a class="nav-link" href="/others/alarmForm">
                    <img src="/resources/img/nav/alarmY.png"><font color="yellow">Alarm</font></a></li>
                    <li class="nav-item dropdown">
                    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img id="img" src="${sessionScope.loginImg }" class="rounded-circle">
                            <font color="yellow">${sessionScope.loginName }</font>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">

 							<a class="dropdown-item" onclick="updateInfoForm();"><spring:message code="nav.dropdown.profile" /></a>
                            <a class="dropdown-item" href="/stage/myStageForm"><spring:message code="nav.dropdown.myStage" /></a>
                            <a class="dropdown-item" href="/membership/membershipForm"><spring:message code="nav.dropdown.membership" /></a>
							<a class="dropdown-item" href="/boomMaster/bmHome"><spring:message code="nav.dropdown.boomMaster" /></a>
                    		<a class="dropdown-item" onclick="crmForm();"><spring:message code="nav.dropdown.crm" /></a>
                            <div class="dropdown-divider"></div>
                            <c:if test="${sessionScope.userManager == 2 }">
                            <a class="dropdown-item" href="/manager/home"><spring:message code="nav.dropdown.manager" /></a>
                            </c:if>
                            <a class="dropdown-item" onclick="signOut();"><spring:message code="nav.dropdown.logout" /></a>

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
                    <a href="/" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.home" /></a>
                    <a href="/school/schoolForm" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.school" /></a>
                    <a href="/sidebar/followForm" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.follow" /></a>
                    <a href="/sidebar/trendForm" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.trending" /></a>
                    <a href="/sidebar/interestForm" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.interest" /></a>
                    <a href="/sidebar/likeForm" class="list-group-item list-group-item-action bg-light"><spring:message code="nav.sidebar.like" /></a>
                </div>
            </div>
<!-- Modal -->
    <div class="modal fade bd-example-modal-xl" id="termsModal" tabindex="-1" role="dialog"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">
	                    <i class="fas fa-sign-in-alt"></i>
	                    &nbsp Upload Video
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>


      <div  style="	border: 5px solid transparent;
			    	border-color: #cd853f;
			    	border-radius: 20px;
			    	box-sizing: border-box;
			    	display: 5px solid transparent;
			    	background: #FDF5E6;"

       class="col-md-12 video_box">



            <form action="/video/upload" method="post" enctype="multipart/form-data">
			<div style="margin-left: 100px;">

               <div class="row mt-2 border-bottom">

               	   <div>
               	   	<p><a style="font-size: 40px; margin-top: 20px; ">Movie&emsp;&emsp; : </a>&emsp;<input type="file" id="uploadVideo" name="uploadVideo"></p>

               	   </div>
               </div>
                <div class="row mt-2 border-bottom">
                 	 <div>
                 	  <p><a style="font-size: 40px;">Thumbnail :</a> &emsp; <input type="file" id="uploadThumbnail" name="uploadThumbnail"></p>

                 	 </div>
                 </div>




                 <div style="margin-top: 50px;">


                      <a  style="font-size: 40px;">Title &emsp; &emsp; <input type="text" id="video_title" name="video_title" style="width: 90%"></a><br>

                  <div>
                     <p style="color: #303030;">
                        <h2>Content</h2><br>
                        <textarea rows="4" cols="30"  id="video_content" name="video_content" style=" width: 90%; height: 300px;"></textarea>
                        <br>
                      <div  style="
                      				width: 90%;
                      				font-size:25px;
									padding: 20px;
									 margin-top: 20px;
			   						 border-color: #AAFA82;
				   					 border: 5px solid transparent;
				    				 border-radius: 20px;
									 background: mintcream;
			   						 width: 90%px;">


						<div style=" text-align: center; width: 90%; font-size: 20px;">-체크 사항-</div><br>
						<div style="margin-top: -20px;">

                         <label>License :&emsp;&emsp; <input 	 style="zoom: 1.5; "  type="checkbox" name="video_copyright"></label>
                        <label>&emsp;Adult Only :&emsp;<input  style="zoom: 1.5; " type="checkbox" name="video_ageLimit"></label>
                        <label>&emsp;How public: &emsp;<input style="zoom: 1.5; " type="checkbox" name="video_public"></label>
                        <label>&emsp;Use MotionAI :&emsp;<input  style="zoom: 1.5; " type="checkbox" name="video_motion" value="true"></label><br>
                        <label>General&nbsp;&nbsp;&emsp;&emsp;<input  style="zoom: 1.5; "  type="radio" name="video_class" value="1" checked="checked" ></label>
                        <label>&emsp;&nbsp;Teaching&nbsp;&emsp;&emsp;<input  style="zoom: 1.5; " type="radio" name="video_class"  value = "2"></label><br>
						</div>
                      </div>

                  </div>


			<div class="row recommendRow"  style="margin-top: 25px; width: 90%; font-size: 25px;">
				<div style="    margin-left: 30px; margin-right: 20px;">카테고리 선택  :</div>
				<div class="col-md-5 " style="margin-right: -50px;" >
				<div>
					<a style="font-size: 30px; "  href=#none id="show100" onclick="if(hide100.style.display=='none') {hide100.style.display='';show100.innerText='▶홈트레이닝 접기'} else {hide100.style.display='none';show100.innerText='▶홈트레이닝 펼치기'}">▶홈트레이닝 펼치기</a>
					<div id="hide100" style=" white-space: normal; display: none ">
						홈 트레이닝&emsp;<input  style="zoom: 1.5;  " type="checkbox" name="videoInterest_interest" value = "HOME TRAINING">
					</div>
					</div>

					<div>
					<a style="font-size: 30px;"  href=#none id="show200" onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='▶Kids 접기'} else {hide200.style.display='none';show200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide200" style=" white-space: normal; display: none">
						동요율동&emsp;<input  style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "KIDS">
						&emsp;치어리딩&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "CHEERLEADING">
						&emsp;Other&emsp;<input   style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "OTHER(TEENS)">
					</div>
					</div>


					<div >
					<a style="font-size: 30px;"  href=#none id="show300" onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='▶방송댄스 접기'} else {hide300.style.display='none';show300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide300" style=" white-space: normal; display: none">
						K-POP&emsp;<input   style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "K-POP">
						&emsp;J-POP&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "J-POP">
						&emsp;&emsp;Others&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "OTHERS(CHOREO)">
					</div>
					</div>

				</div>

				<div class="col-md-5 " >
				<div>
					<a style="font-size: 30px;"  href=#none id="show400" onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='▶클럽댄스 접기'} else {hide400.style.display='none';show400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide400" style=" white-space: normal; display: none">
						MALE&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterestt_interest" value = "MALE CLUBDANCE">
						&emsp;FEMALE&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "FEMALE CLUBDANCE">
						&emsp;&emsp;Others&emsp;<input   style="zoom: 1.5;"  type="checkbox" name="videoInterest_interest" value = "OTHERS(CLUB)">
					</div>
					</div>

					<div>
					<a style="font-size: 30px;"  href=#none id="show500" onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='▶힙합 접기'} else {hide500.style.display='none';show500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide500" style=" white-space: normal; display: none">
						팝핀&emsp;<input      style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "POPPIN DANCE">
						&emsp;B-BOY&emsp;<input  style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "BREAK DANCE">
						&emsp;&emsp;&emsp;&nbsp;락킹&emsp;<input       style="zoom: 1.5;"  type="checkbox" name="videoInterest_interest" value = "LOCKING">
						&emsp;Others&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "OTHERS(HIPHOP)">
					</div>
					</div>


					<div>
					<a style="font-size: 30px;"  href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='▶Others 접기'} else {hide600.style.display='none';show600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide600" style=" white-space: normal; display: none">
						탱고&emsp;<input    style="zoom: 1.5;" type="checkbox" name="videoInterest_interest" value = "TANGO">
						&emsp;탭댄스&emsp;<input    style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "TAP DANCE">
						&emsp;&emsp;&emsp;&emsp;발리댄스&emsp;<input   style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "BELLY DANCE">
						&emsp;자이브&emsp;<input    style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "JIVE">
						&nbsp;&emsp;&emsp;재즈&emsp;<input     style="zoom: 1.5; " type="checkbox" name="videoInterest_interest" value = "JAZZ">
						&emsp;Others&emsp;<input   style="zoom: 1.5; "  type="checkbox" name="videoInterest_interest" value = "OTHERS">
					</div>
					</div>

				</div>
				</div>



				<div class="line-box">
					<div class="line"></div>
				</div>
                  </div>

                     <div style="

                  			    width: 85%;
							    text-align: center;
							    margin-bottom: 40px;">
                        <br> <input class="btn btn-outline-success my-2 my-sm-7" type="submit" id="uploadsub" value="Upload"
                        style="color: white; border-radius: 20px; font-size: 30px; border-color: white; background: #1de81d;" onclick="return agree();">&emsp;&emsp;
                        <a style="font-size: 28px; border-radius: 20px;" href="/" role="button" class="btn btn-danger">취소</a>
                     </div>

          	 	</div>
          	 </form>
         </div>
















                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">

function agree() {
	var videoCheck = document.getElementById("uploadVideo").value;
	var thumbnailCheck = document.getElementById("uploadThumbnail").value;
	var titleCheck = document.getElementById("video_title").value;
	var contentCheck = document.getElementById("video_content").value;


	if(videoCheck == null || videoCheck.length == 0){
		alert("Movie File을 업로드 해주세요.");
		return false;
	}




	if(thumbnailCheck == null || thumbnailCheck.length == 0){
		alert("Thumbnail을 업로드 해주세요.");
		return false;
	}


	if(titleCheck == null || titleCheck.length == 0){
		alert("Title을 입력해 해주세요.");
		return false;
	}


	if(contentCheck == null || contentCheck.length == 0){
		alert("Content을 입력해 해주세요.");
		return false;
	}



	var count = 0;
	var interestCheck = document.getElementsByName('videoInterest_interest');
	for(var i = 0; i < interestCheck.length; i++) {
		if(interestCheck[i].checked) {
			count = 1;
			break;
			}
		}
	if (count == 0) {  //관심분야 확인
		  alert("카테고리를 1개 이상 체크해 주세요");
		  return false;
	}
	return true;
}


</script>



<!-- Modal ENDS -->

            <!-- /#sidebar-wrapper -->
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