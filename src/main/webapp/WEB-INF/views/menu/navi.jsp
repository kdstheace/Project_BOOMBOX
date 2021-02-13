<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<a class="dropdown-item" onclick="updateInfoForm();">개인정보 수정</a> <a
							class="dropdown-item" href="/stage/myStageForm">My Stage</a> <a
							class="dropdown-item" href="/membership/membershipForm">결제 및 멤버십</a> 
						<a class="dropdown-item" onclick="bmApplyForm();">붐마스터
							관리</a> <a class="dropdown-item" onclick="crmForm();">고객센터</a>
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

</body>
</html>