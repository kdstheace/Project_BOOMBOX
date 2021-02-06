<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video Upload</title>
</head>
<body>
	<form action="/video/upload" method="post" enctype="multipart/form-data">
		Movie<br>
		<input type="file" name="upload" value="영상 업로드"><br>
		Thumbnail<br>
		<input type="file" name="uploadThumbnail" value="썸네일 업로드"><br>
		<label>General<input type="radio" name="video_class" checked="checked"></label>
		<label>Teaching<input type="radio" name="video_class"></label><br>
		<label>Use MotionAI<input type="checkbox" name="video_motion"></label><br>
		Title
		<input type="text" name="video_title"><br>
		Content<br>
		<textarea rows="4" cols="30"></textarea><br>
		License <input type="checkbox" name="copyright">
		AdultOnly <input type="checkbox" name="ageLimit">
		Category<br>
		<input type="checkbox" name="videoInterest_interest" value="101">
		<input type="checkbox" name="videoInterest_interest" value="102">
		<input type="checkbox" name="videoInterest_interest" value="103">
		<input type="submit" value="submit">
	</form>
</body>
</html>