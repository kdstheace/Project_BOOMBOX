<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
				<title>Home</title>
				<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
				<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
				<script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
	<form action="/video/upload" method="post" enctype="multipart/form-data">
		Movie<br>
		<input type="file" name="uploadVideo"><br>
		Thumbnail<br>
		<input type="file" name="uploadThumbnail"><br>
		
		<label>General<input type="radio" name="video_class" value = "1" checked="checked"></label>
		<label>Teaching<input type="radio" name="video_class" value = "2"></label><br>
		
		<label>Use MotionAI<input type="checkbox" name="video_motion" value="true"></label><br>
		Title
		<input type="text" name="video_title"><br>
		Content<br>
		<textarea rows="4" cols="30" name="video_content"></textarea><br>
		License <input type="checkbox" name="video_copyright" value="true">
		AdultOnly <input type="checkbox" name="video_ageLimit" value="true">
		check: secret <input type="checkbox" name="video_public" value="true"> <br>
		Category<br>
			가나<input type="checkbox" name="videoInterest_interest" value="101">
			다라<input type="checkbox" name="videoInterest_interest" value="102">
			마바<input type="checkbox" name="videoInterest_interest" value="103">
		<input type="submit" value="submit">
	</form>
</body>
</html>