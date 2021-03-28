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
                    <li class="nav-item nav-btn active"><a class="nav-link" href="/video/uploadForm">
                    <img src="/resources/img/nav/uploadY.png"><font color="yellow">Upload</font></a>
                    </li>
<!--                     <li class="nav-item nav-btn active"><a class="nav-link" href="/others/alarmForm">
                    <img src="/resources/img/nav/alarmY.png"><font color="yellow">Alarm</font></a></li> -->
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