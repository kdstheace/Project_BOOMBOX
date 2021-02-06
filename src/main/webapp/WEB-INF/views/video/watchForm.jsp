<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>



<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a6b1415e6e.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="module" src="https://unpkg.com/player-chrome"></script>

<script type="text/javascript">
        function test(){
        $(document).ready(function(){

         $("#videoPlayer").css("transform","rotateY(180deg)");
          });
          }
        function test1(){
          $(document).ready(function(){
         $("#videoPlayer").css("transform","rotateY(0deg)");
          });
        }
        </script>




<style>
* {
	font-family: 'Do Hyeon';
}
/* NAVISTART */
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
/* NAVIEND */
/* SIDEBAR */
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

/* 		SIDEBAR END */
/* WATCHFORM START */
#follow {
	margin-bottom: 20px;
}
/* WATCHFORM END */
</style>

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
					href="/video/uploadEditForm"><i class="fas fa-cloud-upload-alt"></i>Upload</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="/others/alarmForm"><i class="fas fa-bell"></i>Alarm</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img id="img"
						src="/resources/img/logo_home.png" class="rounded-circle">
						${sessionScope.loginName } <%--                         <c:if test="${empty sessionScope.loginId}">
                        	Manager
                        </c:if>
                        <c:otherwise>
                        	${sessionScope.loginName }
                        </c:otherwise> --%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/user/editInfoForm">개인정보 수정</a> <a
							class="dropdown-item" href="/stage/myStageForm">My Stage</a> <a
							class="dropdown-item" href="/membership/membershipForm">결제 및
							멤버십</a> <a class="dropdown-item" href="/boomMaster/bmMngForm">붐마스터
							관리</a> <a class="dropdown-item" href="/manager/crmForm">고객센터</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/user/logout">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</nav>


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
	<!--Main Contents-->
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a href="/" class="list-group-item list-group-item-action bg-light">Home</a>
				<a href="/school/schoolForm"
					class="list-group-item list-group-item-action bg-light">School</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">My
					Follows</a> <a href="#"
					class="list-group-item list-group-item-action bg-light">Trending</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">Interests</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">History</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">Likes</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->






		 <!-- 영상 부분  -->
   <div class="container-fluid watch_video">
      <div class="row pt-4">
         <div class="col-md-8 video_box">
            <iframe id="videoPlayer" class="video_responsive" width="100%" height="500" src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
            <div class="p-1 pt-3">

               <div class="row mt-2 border-bottom">
                  <div class="col-7">
                  <div>제목 : 홍주오빠 나해도되?</div>
                  </div>
							<div class="col-5 text-right">
								<div class="row">
									<div class="col-3 border-bottom border-dark">
										<a href="#" style="color: #606060;" title="I like this"> <svg
												style="height: 18px; width: 18px; margin: auto;"
												viewBox="0 0 24 24">
									  <path
													d="M1 21h4V9H1v12zm22-11c0-1.1-.9-2-2-2h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 1 7.59 7.59C7.22 7.95 7 8.45 7 9v10c0 1.1.9 2 2 2h9c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73v-1.91l-.01-.01L23 10z"
													fill="#606060"></path>
									</svg> 500K
										</a>
									</div>
									<div class="col-3 border-bottom border-dark">
										<a href="#" style="color: #606060;" title="I dislike this">
											<input type="button" value="원상복구" onclick="test1();">
											<svg style="height: 18px; width: 18px; margin: auto;"
												viewBox="0 0 24 24"></svg>

										</a>
									</div>
									<div class="col-3 border-bottom border-dark">
										<a href="#" style="color: #606060;" title="Share"> <input
											type="button" value="거울모드" onclick="test();"> <svg
												style="height: 18px; width: 18px; margin: auto;"
												viewBox="0 0 24 24">
									 </svg>
										</a>
									</div>
									<div class="col-3 border-bottom border-dark">
										<a href="#" style="color: #606060;" title="Save"> <svg
												style="height: 18px; width: 18px; margin: auto;"
												viewBox="0 0 24 24">
									</svg>등록일
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-4 border-bottom ">
							<div class="col-1 pr-0 w-2 text-right">
								<img id="img" width="48"
									src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
									class="rounded-circle">
							</div>
							<div class="col-9 pl-0">
								<p style="color: #303030;">
									<b>채널이름</b> <i class="fas fa-check-circle"></i><br> <span
										style="color: #606060">139M 구독자</span> <span
										style="color: #606060">등록일</span>

								</p>
								<p>
									영상 소개 내용 ~~알라비 뽀이~야야~~<span id="dots">...</span>
								</p>

							</div>
							<div class="col-2 text-right">
								<button class="btn btn-danger" id="follow">Follow</button>
								<br>
								<button class="btn btn-outline-success my-2 my-sm-0">Motion</button>
							</div>


						</div>
						<div class="row mb-4">
							<div class="col-12 m-4" style="color: #303030; font-weight: bold">댓글수</div>
							<div class="col-1">
								<img id="img" width="50" src="/resources/img/logo_home.png"
									class="rounded-circle">
							</div>
							<div class="col-11">
								<form>
									<input type="text" name="comment" class="input_comment"
										placeholder="Add a public comment...">
								</form>
							</div>
						</div>
					</div>
				</div>




				<!-- 사이드 영상 -->
				<div class="col-md-4">
					<div class="row">
						<div class="col-6">Up Next</div>
						<div class="col-6 text-right">
							AUTOPLAY <label class="switch"> <input type="checkbox"
								class="switch-input"> <span class="switch-label"
								data-on="On" data-off="Off"></span> <span class="switch-handle"></span>
							</label>
						</div>
					</div>
					<div class="container-fluid video_list">
						<a href="#"> </a>
						<div class="card">
							<a href="#">
								<div class="row p-0">
									<div class="col-md-5">
										<!-- 썸네일사진으로 주소이동 -->
										<img class="video_list_responsive"
											src="data:image/jpeg;base64,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"
											alt="image" width="100%" height="94">
									</div>
									<div class="col-md-7 p-0">
										<p class="mb-1 title"
											title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
											내춤 배워볼래??</p>
										<p style="color: #606060;">
											구독다음영상 <i class="fas fa-check-circle"></i> <br> (조회수)
											•23M (업로드시간)
										</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="container-fluid video_list">
						<a href="#"> </a>
						<div class="card">
							<a href="#">
								<div class="row p-0">
									<div class="col-md-5">
										<img class="video_list_responsive"
											src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMVFhUVFxcYGBcYFxgXGBoVFxUXFhcYGBUYHSggGBolHRUXITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFxAQFSsdFx0tLSstKystLS0rLS0rLS0rKy0rLSsrLS0tLSstKy0tLS0tLS03LS0tLTIrKy0rNy0rK//AABEIAKgBLAMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgMEAAIHAQj/xABFEAACAQIDBQYDBQQIBQUBAAABAgMAEQQSIQUGMUFREyJhcYGRBzKhFEKxwdFSYnKSIzNDU6LC4fAVY4KTshYko9Lxc//EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAHxEBAQEBAQEAAwEBAQAAAAAAAAERAiExAxJBcWEi/9oADAMBAAIRAxEAPwBxwW7l9LkD3HsaundRk76kNbW1rEeXH6WothtoQD+2i/7ifrV07Xw9v6+H/uJ+taoTsTByOhHLn7VSOFp4faGEcd6WA26uh+t9KG4yPBnVcREnh2isPqagWTgaryYDqKOS4mBf7aJh1VwfpxrZVRxdGVh1Ug/hVCviIQgJIuDzH6VWjjvTHtTCjIT01oRDiIf7xPeoMgwhPAUf2bu6z8dB5Cq+A2hhl4ypTHhN48Io/r0+v6VRtHurFYXLE+g/CtZt24xwFWTvXg/79Pr+lRvvXgz/AG6n3/SpKAOMgWGRVUrd8yuhYDMhGot16UwYfYsbAHiD5UMl2ts92zO0bHxS598tEYt6cGBYSqAOQBH5VaLR2FD+zVHFbAQagVP/AOrMJ/fD2b9Kjk3qwZ/th7N+lSCgNkD9kVbg2GOgrxd5MJ/ej2b9KspvRhP74ex/SlHh2RbkPahu0ykCuxXvEBVt8xcm4tbpYe9qLf8AqXCn+2X60Bxm0oXxHaO6siW7NQdL6am9BRwGzmhu8sWaR+AuSxJFsqhT6k1cwGzCpLSwF5G8SAo5Kqjl40T2fNhcxkeSHOeAuLIvQcrniTx1tRVNqYYcJYh/1KKilvaOzmYAJhivU3c+gt+NDZNkS2NoZL8r5z+AFPX/ABWD++i/nX9aw7RgOnbR/wDcX9aIRYMDJb+oLeIaUf5TU/2Zhxw8g8pmH4x04wYqBRZZIwP4wfzqYY2L+8T+YfrQILK1/kmA/wD65voVFD8UzC/dkPmRwrpM86Hg6/zCguLCnmPerikBZbnvxOo62DfQEVWxxjBsAxW3HIQb+V6cMXhwelZgMAoXQDieVTApYKXtNEU2HM6fSrX/AA8njrTB9kCk2A68Kk+zDpQLX2K3KoZoLUxzYe1VFwOY60AjD4LS50HU6C3iarz7wYKK+adGI5JeT/wvaju3owmFnPSKQ/4DXzzLKbkX0FVH01s/byY+JMRGjIhzKoa17IxW+nC5Br3sCOABHU8ddenpVDcnZj4fAwRPbOqktY3F3Zn4+RFHLVRzBMM44g2rBg26G1MrYdQC2YAC9zcWFuNzyqpgsZh5WyxzRSMPuq6k28gaygRHh3UHQ6i31H6VG0bHrTMYK0OEHSqFoQN0raGN1IKkqRzBtR+TA9KVcdt8oGkTDu8KuUMt7LmBsbaHS+lzUUxx7dxQFmyuLa5gL+62+tB5cMZHvlsba6jrV3ZuIWaNZE4N9CDYg1agXv8A/SfxFEI+3ttHDzCFY8zAAm5tx1AFabO22TIBJcJmGchL5EvZmNuQGvpTttbYEM9mcBWUg9oAMwUcrkcKsbPbD/Z3fsuy7XMhDXu1+73b8Qb8rVnrrHTnn9ooDCKdUYOuuVgRYjqK3GAPSg+E3lhgw7mOIns5TCkd/wBlSxa4+7ofpRbdTepMTL2Lx9nJYsvMMBYka6g218QDWozYsLson7o96kGyW6D3FMiwVFtCeOCNpZTlRBcn1sB5kkD1qoBf8JboPcVn/Cm6D3obhPiNhy4EkTojC4YEP5BlABv5X4024LaWHmh7eOVDEOLk5Qvg2axU+BoAo2Ueg962XZTdB71Pgd7MDNIsSSm7myFkdUc3tZHYWJvp430ozNiYELhpEBjUO4LAFUPBmvwGnGg5pvBvEkErRKuZl0Y8g3Shab5Nf5FI8f8AShu82BP2vEuXXKZnIa+hBa4/G3pQoop4EH6VB2DY+XEQrNGO61x4gg2I9wavDA+FV/hlhrYBBYgh5L3BGpe/PjoRTaIBUUujZx6Vn2A9PrTGYRVfDYiKQkRyI5XiFZWI8wDpVQGGCI5V6MKfGjxhrUxVAE+znxqKWBvH3rbaO9GChk7KSdQ4NiLEhT+8QLLx58KKvECNOdVS3Dh3LkMSR5074CDIirbgKDYHC3l4c6ZUWqirPFzrXLV110rTsCRyqCjJHetFhtWuB2jFK7oj3eM2dSrIy6kXyuAbXB14G1XStULm+hy4DFH/AJLj3Fvzr5ybifWvoj4lyZdm4k9Qi/zSov5187cz60o+n93s32WDOSX7JMxPM5RV+1a4SPLGi9EUeyipLVRx3G4J4tk4tM2YiYNcBgSGaNtQyg63v6igyxF5JCgXs4CmQplWWMmPMDH/AHlsrEob3tprXT94dmiTBYiK7LK9mVWLF3WHK2Vc51FlANidLXtXKsBh1aOSGNi00s8GWNVbOhjMgdi1rD5xYg/hUHXMCc8aNe91Bv1uONT9lRTA7KCRqmcvlFs7WJa3Mkc6sfYVogC0Vcz3axUDYeaGZSxQyZsz2Ckk6ABhcaX4HUV03fTaaYHCvOQGa6qik2zOx0F/AAnyU1wnYE18RmeJpi5YlUtmubklQeJ8KzWublNfwwxWZZob3ykOL9D3T/4j3q/vfvAcKwSO3aFTrxyqSLHzNjSKm02gxTy4bMlmIAcC9jxDJwGo4eFVdqYx55Wkc3d2JPTyA5DwrUSiM+8mKkved7dNALcOQohsPb6oGeYtJIthGOVz16cKXo10FG8LsZHwUuIzgMjqtiQOJNwutzoyH3pZL9WWqWBxIjZmlTMhfOV/iDA3t/EK3fbMcONixOHSyx5SV1ObiHtc8wxFU0xOXQi44EeB/Kh88GXUG45H8jTDX0zs/EpNGssbBkcXBFKnxdnC7PZSbF5IwB1s2Y/hf0pU+DW8ywSy4aY2jkVpEJ4CSNSzDoMyA+qjrSxtzb82MkLysTm1C3OVRyAXlRBWDYsYhdpJlsihxlBzB04WJ4gg/hUrYHtCztEZpCdZEfJh3KgNfFKSGRkGvd+fzvdYnxDGMR62B587UVwOKw64WYtFnxN4zGxJsArDPoOOljrWYtwTMrAMJJc7SzYJ4rjLokjo+RBcIB3RbTQDQcKdd5d2Y58bNJI8ijJEjWHdtkkcKxzXILLG3DTs7X1pKw2y8Vi8fg2Zf6OTLIsg1Xs1PaNcg8Ra1j4V17emdQWdVUs4yscoB0Hd14nmNetZ6/JOf9b543/HFc0ckjhhY5mZSehY3B8RerGEjgTvnglye6RcLrfiddOGlUsThSZNDYggeutz5a0W2psKUwXZydL5bdB9az+zWHn4XbaM8LK/z52YDhp0+l/WnfsTXE9y3kgOcGxVrj+UXHlY13HZW2YpoO2uFCrd7/dsDf8ACrOp8Y65/pU+I8Mp2fMsdwzGNdOamRQw9r1yjduaTDzR4oRAJArl8oCl1yEEHTvMbimj4gb/AL4hXghtHHca2u7BSGFzwAuBoOnGlDHY15MMe8AXKhlvrbqB04XOugrepM/px3Z36mkxUSzsvZ4i4UAfIxtkHC/EgcTXSOw8W96+dsfjJkGHDuLx3y2JJGWwBvw5cqJ7wbzYzH4oxxPIAx7NIYnZVYC4JKg2JPE3olVFjE+JxSGRVvJI6swJvaRibEDob+ldH+Em1jPgzExu2HbLf/lt3k9u8PQVy2bd3EroEVm1BEcsbtyuCiMTzGlqdPgp3MTIneDFWEqkWylWHZ+tywI8BVF/b2/0kE4bDqphWRo3LrfO6MM6qb3UAc/Guj7p7eGNwy4hUKZi6lSb6oxUkHmDbpXOt4tiAdpDhQsizSTB2IW6O8hI73gGIvyy0X+F+3rdps+VMk0bO4AIK5O4SAVJFxmvodb+dSVbMN+8+1xhoRJlzXdEtcD5jcm56KCbc7Uv7W3/AMHE6gQSzyKPmCqmXXgGcg38hbxqff3debaMSpFIE7AtIOeeYLZEvcZbAm5/eFcWk2nMM4kUiaLQgixzXy6r1FXSYeNj4yMbXbFq5VMRIIgjLY5pFClTrY2ZV1HWurV8zTLiDBFNZ8iOckoJYBu7YE37hBA0Nr3r6A3Q2yMXhIp/vMtnHSRe649xfyIpEoP8W3tsyXxeEf8AyqfyrgeBW8iDqyj3YCu3/Gia2AC/tTJ/hDGuM7vJfFQDrNEPeRaqPqSvK1JrWikH43wTBIMRGSqx9pG5DEN/S5LDTipykHzFIPw2izYtnuc8cTyIASCzgqORF9CdL611D4i7yYLsnwUsgLygKQNRHqLO54La17cdK5Fs1xArm7rnLZZchs8UZOkZ6sQASDppUSPojZkshiUyWz/eym4v51azUE3S2mk8GeNw65iAQuUDQd3Ly/8A2jF6qOdfHR//AGUI64gH2ik/WuP7v4zssTE+YqFcZiNbLfXTnpXc/iLsYY0YfD3KntM1xyGU5jbnoK+flNm01F/K4v8ASos8Oe9+DeSRsSkcbQSMD20eX5iouHA1Vibk30uaUpW1Fqv4bbTrJdbIjWDIPkK3106251b3p2R2LK6ghGJHrxHuL+1XfcW++hGeo5cTmYtYDXQDgOgF9bVNAhJABsfMD8aLSbovmsssbAAm4uOAvYDmaWpJQtjcBuZ5eHWtsNIQQRbQg9bEHQ2qX7DLpaM5Suh0ykcL3OgryZI43yrIJFyglgLANzXxt1q6YYNmbns2HxGNkmUdlF2yqgvmLAGxbgvzWIF+dK+GOvCuy/CvZSvh5o5DmjniF16LKt7efH1rm2yd3/tKN2M0ZmRsqxmydon7Ycmw8qzuLgTLNnvb7v8A+Vmy58kqltVzDNfmhNmFv4SaN7fR4SmHkw6xv1DISbCx0UnS/Wgb4W2vEc6T1en0QuAhw/ZrDGEAEh0PdGbLew5XIJ870r7W2w0kjgmwU93xCi5P4e9S7p7QE0KNmYyZVEl72DKMosTxuAKU9s40x4l8qhrXte9u9qdOeteb8nvTtz5yJSbJVpFVEuxHeUanPlu3pw+tGJdgYuaJYVje4FrtdAeneI1qjujiycXCw1yRMXP7zd2ulJtfTlpWueN+s3vCLtrdk4SGN2YF8tnC/L81iFFtBYjXnaoNysUJftGGf5WUg++Un8K8373iLu8YsQsdvJnZSf8ACv1ofsrJDLDMt8sqlXvykzkjyBXL/s1nqLzd+kXbmBeCeaJtWjOXTgbgEHXqpv60TxeGX7PEQwzlbFbfsrxv78uVNvxW2WrxJjEHeGWN+mTXI1utzl9R0pSwe1EXCNGVJcEAX+WxbTne49uFdJbZMc+plCWSTEL2Si7qbqPE2BA89Paq+Mjkwc7qCMzIQG1BCyCxIsRZrXHPiaZtxNnHNNipLrHDZgRpmlDXVBf/AHqKrfFXDkYpJPuPEAraalSSdOPB19/OukvqZ5oKZ0GoyGw/d8edvAcNRTf8LndmxWJZm7RsqhiOJY3vfmQVFc/fBSCMTFf6NtA1xrqRwvfiDy6dRXSvhZtFBhWhJ73as6jTgVUE28xzrp+X8n7T4nE9XZNoth0kaxIjLMbc+62v++tLPw7x8km1onUAA584Fh3WjKk2JP3ip0NHd8BH2bo8jR3jZbnvAyDvLHpx5elDPgrgT9v7dwRHHG/ePDOcoAHU6k6dK5xb6760eRNOXHxPM+prkk+zl/8AULXQFJomZltcE5cpa3moromJ2yjgrFdr87MB00uKRo9lSfbZ5mjdy0XZ65ropzaKV172VTcaC9VkG+H+zjHiMXs6dBJAf6QI4upyuQpAPXKvqopg+G21I2kxuHiTJHFPmjThlV7qyjU6BoyeJ41T2PmTG9tMnZBIStje5JYmyg62GgHrRnczYUUBxEyD+ukJBPHLmLW8B3uHhTVwtfHSe0OGT9p5D/Kqj/PXNtyYs2Pwo/58Z/lYN+VPPx1k7+FXosx92jH+Wlb4YwZtoQ/uhm9l/wBaqPoRXr3NVEOaztTQc5+Fm7eHxBxMmLj7aeKcqe0JZeGpKHRjmzcQap/GWR2mijWMCOFCBlK/fyk90fKosK23YxWTE4kRPIBKwc30Oe7X9NazeJWWdMQGNywBJOoI0B8dAamh3+G+y0w+BRVkWTOzSMyk5cx0sL9AAPrTSjVy7Z2SAyJDJIt2V8g+TvA5ipHDgDY9dKsHaUvHtX/mNUMm9ePGH7XEnTsYWym39o1lQDqbtXzneu3b1QYvEYVBCmeKwzXIDFg1wVuRfmK5Di8Oc5UqQwNiLWN/KsxbMUlF9BxNP2+GHaTBYaWzXRVzjlqoF/f8aXcBsgiRMxyKzBbtyv1A4V0XbmOiTDFQSUCgHS5yE5Lip19jXE2VyVmsL310rZdrTAm0ja8R90+a8Dx51Fi7cBqL6HgSKhUVusLuEkeaRYzKR2jqt2Y5RmYLcjoL0zb/AO4UmzirBzLC+mfLlKv+ywBI1tcG/XpqngV1qJVxeCUSE2kQXPRl+953F6gsfB7aMk0eIUm7xxkX+8Q9zHw42btB6iuZrE0OV1bKVHHnwtwr3ZO05cI06ra7qYj4EMLMOp0P81UIIpJWEUYLsx0Uczb9L1TVvaW8U06or27puOtx4/reiOFIkQMBoRYjoaNQfDwLh5HlYmQKSMpsiHxNrsaS27XDu6Xsw0PMHS4Iv4HQ9DUnjVlza7Fu7sxsLgczFS8lyoU3shPduf2tTfpp0objdjdomfixcqetgAaZ9g4oNgoSbG6BuGmoBA9OFBNrYd+xVwos8jEtciy3PDrqAPeuH212zxPuXsgxue0FjYjXgRe4OtPSwRgcYx/KPxrn+AiXQ6UaXFoUIfRf2rWHj3jpSd58jN4/6D7WwETYmRyysDmPc79/6MqvyX4Xv6UWGwy6QxZCLpYtbRSFFmPUjS3W1D4mgGJ7AyNcpn7ovaNgMpz/AC964ta9G8XvfBDA6ZcrqAsR0Aka3C50zaXsdaSWr5EO+ckMGBkjlYMAosb6swIK2U871xjZ21o0mR2UsgvmWwNwQRa3PjV/amNnx8hspcjUgfKo4XJ9aESbKlXOcmZYzZmU3A97G3pW+OMnrn31tdB2ZvDhpzFh4cM6wB2dlbUsx7wJAJuAL8T06UX333UgxEeeVjFIq2jy/KqDUBlNr/ThXON2tsNh5VlTivEEAgjmCKeX2scXIzWIjTLbxY3OvkLVbzZfFnXnpUXcPFthWtLGVV8yRs2VmGU3Zbnuk3HdPGw6VX2VujMuHlxXa5DGhYItyxsLm5FraX609rhrjM2iDi34gDmfCqO7mOKdpFOoTtC2UcivubX6GrbicyWgUO50k+AfGviTmRXkCsS4KICTck3Rjl8aJfCnCzlJZjpAtlF+JkOU6eAU6+YqTCf+2jGQBiq2sb2N+o58at7C3uMLx7MSDNnkYu5bW8haU2UAC4uOPIVb7E58roGzsKxhuLXuLaX0vrw9anmdUF5HRbmwuAD5C/Ol7a+9MWECrMkiW+VwhMbeBaPvA+nvSltr4lwyvHHGhVASZHfM1zply31AGt7jpUnzw6n/AKQbd2msDS4mZi8s7Hsl5rENFA6AA39aa/hxtxsRhzmiZMrNlJHddGYkFSfmIvY+QoPvLurDJEuOja7xxiTvEmNowM+nSwvbl+NabvbzAqDcAjhy9KnxrN8AvjdNfFQL0hv/ADSN/wDWqXwbjvjif2YHPuyL+dR/F7EB8apHDsI7epdv81EfgnH/AE87dIlH8z3/AMtbc3XqzLXt6zNWhyqAZMS7W+aqe3hI/HK63Nrg6A8NL2PtRmddb1RxIJFqgiwmIWNM8rBRwvoPIWA/CtMNtwTTJFDGSGYBpG0VV5tbnp5VpJNDIRAxDG+a2umUHiR51eGHCqQgtoQPagatt7xx5eygIOlu7wApQ+wxAmRlBYal24jxvyqrsFdGPjb6VFvZI4w7ZeBIDfwk/ras8zF6ul/eDa/aOQhIQHQjS5HP9KGTbRmcWMjEWC26gHQEDjrVYtTRu5sHTtZRr9wX4fvH30FVG2ydglOzecKwcXCkA28786rb3bLjhZGj0D5rryBFtR4a8KZ2BMYU8UY29f8AUUc3c2LFjCVmQP2diARpcnr6Ui1x5TXQt08QfsQGp7zgcNBfgOfG59aV98cAkOMlWP8AqyxZPAHUqPBWuPSi+52KBiMXNWLeht+dVATetAmIKi3yoTYWuxF/wt7U27p4aLDhSrCRpEDFwLEZhfJ3ugtw50L3h3emmxiZUbs5cgMgF1W1lYk8rDXWmjefdUYBkERJhYd3NqwItmBPO5u3Lj4UEm2p88bWLqcttHIB8wDrXO94MHlCy5r3JDA6nQd1ifHUegpoaRmFr1XbZpmVoyOKnKeWbiD7gUU9YJOyweHTh/Qx+H3ATUexsC00UhBcZiwBuWyksbZVNxpe9vCrO3VftIY0XuvGwXgdVKC3Howp73f2SYcPHGwAa12t1Jv624Vy5mTXTqkLD7AxzXAkw5YEAN2DqQeeZc1joeR42ofjtwMViHJmxYCrYZY4wOmYAk6DTnmrpzRNHdVFlJ1/08aqTZg4VOFu8fM1qOdcy3g3eGGkw0OHeQsQI2DHNcd5kXlwsf5vCmSXdS8IzWLxSRuCByAs/wDhL/Ss3yk7N0xH3YJY5Dpfu27Nvo1PeGgDDMLEN4+FCOf7ubPgwWWOQEiO+YhMxaQaXKj38LClNsanbNZAFcmwOmhJ49fXrT7vPDlckaZhY/xDj9Mtc3ZNdeINWUzC5tvAiCQslsjHQD7p45fxpq3KxwfDspBzLIbGwtlKrxN73v4cKGb+7Kkw8OGaW6tOZGyEaqqBAL9Ce0OnQa1PucuWD+Ik387AfhVQy4zauVVhCXDMCWzWC/8ATlOb3FL28IuVPSimLjuPEVHsDALPNkkay6dLkk6WB8j9KihsW0xGFYBWI1swYa3vfMOBvzBqlhNtImNXEve6rYAnNrYi5YgaVf3z2E+Em7M3yNdo207yX8OYvY8KTsd83pWpNN9Ou+e8QxEP9Gym4OZPmuONwOR14+Fc67SmXdbCK2diL8AONupv15UT2rsiGTUrZj95dD68jUkzw6v7elzAbdnjjeFZG7KRWVkNipDDKbA/KdeItVrBEZVCE3I73W/PSquL2FLGrOvfRBdiNCouBci+upHCquzMaVdbcyAR1BI0pZqS4vb6YlZcUxjuEVIkUNxssag38b3pz+C0RH2prf3IH/yE/lSBtRbyMepp5+F21oYI5VlfKXcEGxIsFtxA01vQdUFZmqHD4lXF1YMOoNxUpeqrk2095o1OWIdq37vy/wA1tfShz4bFYjWRuzT9ldL+et/ejGD2THFwXXqdT71LK/Sqyp7J2SkZuBqL689fGrO13AiY3Km1gQbanTjyraBzUeMQMpVhcGgEbsYhsrKzXsbjUHS3UcaJ46PtI3Q8GBFBdnHKzAaUU7Q1AgvGVJVhYg2I8adt3sdnhW/Fe6fQCx9rUB3lw1mEg+9ofMc/ao938SysyjgRc+FtL/lQFtqY91xA/pLKACFPC50IPM0ewW2JYgTHLJGGALBCBfpe4PC54WoF9hEjXcX86uTxWAHK1FUt58OZI+01LJc3J4qdWvfjQfdicriIwPvEqfIj/QGmXRkZCfmBX3FqTcBOYpUfmja6A8NCLNofWg7K+OZY+zhdDG6XM2jqC11JUg6gW8yRpfWwXa21ZJQqviJJlU3UPlAGltAoHLrfjQrGbUkfKjOxUcF0VR5KgAr1JABQTxPRPZ6XYADUmw8zoKFwODranzcTZLySJOVAiQnU8WYDQAeBPHwpSH3A4BhEBfKwAA0vYD8zWmJWZR3ZQfNCfwNXnnHWgO3sZlW9r62GYlv8N7CsNW6F4/b+IjBJliIHEdmf/v8AlVDB71Z2AawZtCSoC6cLanU3oNtScvqb29vpQiU8xz6VrGXRxhVkurhWVgQVNmuDob8iPCmPAqFFgBYcB4Upbq41GjBuBJ8pBP1ueR0psg41kLW/iWS4/bB9CrA/+Irl2KuDfh5cfQ9a6zv5HfDM17EEanpe3+/OuPYyS/3qsWruESDEKI8Y7OQUWMyyt3QSQ9nN7XFr9bDpRLauEggfLhpo5YyL2Rw+S2mUldPKkXF4kA2vreieExFwCTrVQZllNqCYuazA34a+o8anll0ohuVs+HEYsLOAyKpbITbMwKgAi4uO9woE7bGPbMblrnjmZmI8O8aG4WF5WsPVjwHmfypy373YEWKLEELKWdQNNL8Leo1qlhsOqplUACro9wEioAqgAKACRfvEcWbXifDTSrMmMFDLFTXokLELzJAv4k2qCpvBj2yhFLBX1YXIDAHQEcxeoN30KkyWU6EDMubjxI6NyB8TXSsVuhh5gsQKrIqWuSCL9WvxJN9edqR9o7PkwsrQSrZl6cCp4Mv7p/XxqgTihdiaJ7K0Wh76miOF0FAQgnZDdGZD1UlT7ii0W9uKUWzhrc2UE+9AQ1ZmoGmSoGFWHFRFaqNouFQYhatKmlQyLQLc62cm1etPV3Fwm9UJMPzqA1uvu22OkyEEQrcvJluoItZQeGc3GldH2ZuXgog0aomVxY3uWI/iJuPSluL4g9nAEgwcaAfdWTKoPM6R3v8AWlTE75bQdjZwgP3UGU2/itmJ8b0UR21gBh8TJEPlU93rlPeF/e1U8VILWtVaGd270lyx4km59SeNayOTwqohaQWtTn8P9w8FiV7d1LsGIYEkKHNiLLwNgePU+FJOKiKm54HlRrdLe/EYIOkSowc5rOSACBa4sDyAqAZtuBsNiZYGHejdl14lb91vVbH1r2CbTgKg3k2i+JxDTyZc7WvlGmihQPYVXhka1UF457aW+tdE3Y2ifsqC5uLjyAYnT3rl0ExvqKdd1sTmjZR90huOtm0P1H1qVTpLtBhZxwt7EVT2xtgTosdrMrA5raEWIP5VHhpOKHgeHgetVcZgHUg2FjwsbipIBk+GOtvyoZLEQbGmCXDWFD8RBz0rSBf2uSIrJHbODYAi4a+livMf6V0vZe1D3RJGY2I7y3zKDbWxPKueIpDq9hZWDW8iDTDtXeBpCFTS/Ei1/es1TbtF1kjINiOYPS+tcJ2lGFLA8iR7G1dawGL+UcuY46Vy3enCMk7DlIBKv8Mlz7g3HpSBdmAvVzDtpVd4rGpKqLZevdn4h45FlQAlT8pJAYEWIJGoqmKtYe9FNu929cWLgjVoGSZSCGuLC4sw6kHT2FLIOlD8Ue9XonNBJiBrVOQ17NMaqyyGoDezNv4iFwyyZrcBJ3x6ZtR6EVY3o3rlxiokixjsySCikHUWtqTYeHhSuJDU41FBraiEPCqEd70QhNUSistWVqTQN8pqIVvNeolNVFtLVHLXim44VG7UFDGLQx70WxamguLvyNBWOIIOmlXcBIL3NDCuutWY3qAxI1+laLIBrVdTcWrCDa1UT7SOZAeNDIwRqePSrBUjrVeY0Gixkmp4o7V5H4irX5eFBTIIOtGNj49onDKfA89OdVksRqK9jjPLSgZNubZhEbOcQto2UhEt2vEWuhINjp71NurttsTFn/eIte5FiQLjkbVzLbrWmcqQe7lbQHjxHDQ8PGi/w5xzJO0d9GQn/qUjX2JqK6piGNudCMVf0q8JieJqliz41RSkl0qPD45Iz3r35Hlb8qilbWhu0JNagbsFteOwAuX10seVKu9JviGAtkuWW37+ret70qYjbGKLmNJnCqbKBYHT961z6migxfaBDYiyqpudbjiTpxJJqQZLH1qm/S1XZWvVZzWkRAURgj0qthoS1ESltKiheKj1vUDCrWLPtVJjREbmoHNSk1GaCO9WEaogvhU0YoNoxVpKrqKsrQb15evL15einFjVZnqYtp/u9VmFVEqTVq8pB41XtWrNQbYqW/Ghki1ac9ahax5UFUx868ZasPaq0oPjQSwP0q0B40AWYqdKIYXaIB7w9aC1IwHGqLSAnQ3rfF4kN8p41phoB4f78KDYeVThjWDD8x+FW4I9OXrQVwTyqSaYohboDUzRgH8NNKixIBBB4GgVsfOGJI+9rrxvz4Ub+HqN9oJstsh1I14i1qC4uAA2Apx3SgCKGPFhUDoVHIef5VSxIq1ey3Numh8L1RxMnOgoTprQPHPxo7K+tA9qx2F+VUKmMNmv1orsqUMpJve/lVKfU1fwYAqC0VvWsUNzapUh51aiW1UbwYewr2WpVaosQ2tQCsUOP1qk9EMYvMVReggZa0tUjVqCRQait1rCb16BQbLU61Eq1IKDYmtSawtWt6BrEtvCo2e9ZWVRqWNRMa9rKIgeoWNZWUVGBrUjnum/KsrKAKV1NZ2d6ysoLKRgDxqzAlZWUF6EeNS3Xp+JrKyg9Nm66eQqljG4isrKABN81OOyRdFuOQrKygY04Fb9KrYnhxv/AKVlZQCsTLbjQPaGNZlI0t9a8rKgExrciisEVZWUFxBW16ysqjfORWpN69rKDQpflQzEQFaysoKzVqRWVlRXijwrcHwrKyiJRbpXjGsrKH9aFq1vWVlB/9k="
											alt="image" width="100%" height="94">
									</div>
									<div class="col-md-7 p-0">
										<p class="mb-1 title"
											title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
											제목 입력</p>
										<p style="color: #606060;">
											흥미관련영상 <i class="fas fa-check-circle"></i> <br> (조회수)
											views • 7 (업로드시간)
										</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="container-fluid video_list">
						<a href="#"> </a>
						<div class="card">
							<a href="#">
								<div class="row p-0">
									<div class="col-md-5">
										<img class="video_list_responsive"
											src="data:image/jpeg;base64,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"
											alt="image" width="100%" height="94">
									</div>
									<div class="col-md-7 p-0">
										<p class="mb-1 title"
											title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">제목
											입력<</p>
										<p style="color: #606060;">
											흥미관련영상 <i class="fas fa-check-circle"></i> <br> (조회수)
											views • 7 (업로드시간)
										</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="container-fluid video_list">
						<a href="#"> </a>
						<div class="card">
							<a href="#">
								<div class="row p-0">
									<div class="col-md-5">
										<img class="video_list_responsive"
											src="https://i.ytimg.com/vi/hoNb6HuNmU0/hq720.jpg"
											alt="image" width="100%" height="94">
									</div>
									<div class="col-md-7 p-0">
										<p class="mb-1 title"
											title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">제목
											입력<</p>
										<p style="color: #606060;">
											흥미관련영상 <i class="fas fa-check-circle"></i> <br> (조회수)
											views • 7 (업로드시간)
										</p>
									</div>
								</div>
							</a>
						</div>
					</div>

				</div>

				<script>
			$(document).ready(function(){
				$('[data-toggle="tooltip"]').tooltip();
			});

function myFunction() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "SHOW MORE";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "SHOW LESS";
    moreText.style.display = "inline";
  }
}


</script>
</body>
</html>