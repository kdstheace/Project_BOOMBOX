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
<style>
        .main_container{
        	padding-top : 30px;
        	padding-left : 60px;
        	margin-left : 50px;
        }

#follow {
   margin-bottom: 20px;
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

/* uplord END */
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menu/navi.jsp" />
   <!--Main Contents-->
   	<div class="row main_container col-md-10">
      <div class="col-md-9 video_box">
         <div>
            <h1>영상 업로드/수정</h1>
         </div>
         <iframe id="videoPlayer" class="video_responsive" width="100%"
            height="500"
            src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
            frameborder="0"
            ></iframe>
         <div class="p-1 pt-3">


            <form action="/video/upload" method="post" enctype="multipart/form-data">

               <div class="row mt-2 border-bottom">

                  <h5>Movie :</h5>
                  &emsp;<input type="file" name="uploadVideo">
                  <h5>Thumbnail :</h5>
                  &emsp; <input type="file" name="uploadThumbnail"><br>


               </div>
               <div>
                  <div>
                     <p style="color: #303030;">
                        <b>Title</b> &emsp; <input type="text" name="video_title"><br>
                  </div>
                  <div>
                     <p style="color: #303030;">
                        <b>Content</b><br>
                        <textarea rows="4" cols="30"  name="video_content"></textarea>
                        <br>
                         <label>License :&emsp; <input type="checkbox" name="video_copyright"></label><br>
                        <label>AdultOnly :&emsp;<input type="checkbox" bname="video_ageLimit"></label><br>
                        <label>How public: &emsp;<input type="checkbox" name="video_public"></label><br>
                        <label>Use MotionAI :&emsp;<input type="checkbox" name="video_motion" value="true"></label><br>
                        <label>General&emsp;<input type="radio" name="video_class" value="1" checked="checked" ></label>
                        <label>&emsp;&emsp;Teaching&emsp;<input type="radio" name="video_class"  value = "2"></label><br>


			<label>
					<div>
					<a href=#none id="show100" onclick="if(hide100.style.display=='none') {hide100.style.display='';show100.innerText='▶홈트레이닝 접기'} else {hide100.style.display='none';show100.innerText='▶홈트레이닝 펼치기'}">▶홈트레이닝 펼치기</a>
					<div id="hide100" style="display: none">
						홈 트레이닝<input type="checkbox" name="videoInterest_interest" value = "101">
					</div>
					</div>

					<div>
					<a href=#none id="show200" onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='▶Kids 접기'} else {hide200.style.display='none';show200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide200" style="display: none">
						동요율동<input type="checkbox" name="videoInterest_interest" value = "201">
						치어리딩<input type="checkbox" name="videoInterest_interest" value = "202">
						Other<input type="checkbox" name="videoInterest_interest" value = "299">
					</div>
					</div>
					
					
					<div >
					<a href=#none id="show300" onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='▶방송댄스 접기'} else {hide300.style.display='none';show300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide300" style="display: none">
						K-POP<input type="checkbox" name="videoInterest_interest" value = "301">
						J-POP<input type="checkbox" name="videoInterest_interest" value = "302">
						Others<input type="checkbox" name="videoInterest_interest" value = "399">
					</div>
					</div>
					
					<div>
					<a href=#none id="show400" onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='▶클럽댄스 접기'} else {hide400.style.display='none';show400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide400" style="display: none">
						MALE<input type="checkbox" name="videoInterestt_interest" value = "401">
						FEMALE<input type="checkbox" name="videoInterest_interest" value = "402">
						Others<input type="checkbox" name="videoInterest_interest" value = "499">
					</div>
					</div>
					
					<div>
					<a href=#none id="show500" onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='▶힙합 접기'} else {hide500.style.display='none';show500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide500" style="display: none">
						팝핀<input type="checkbox" name="videoInterest_interest" value = "501">
						B-BOY<input type="checkbox" name="videoInterest_interest" value = "502">
						락킹<input type="checkbox" name="videoInterest_interest" value = "503">
						Others<input type="checkbox" name="videoInterest_interest" value = "599">
					</div>
					</div>
					
					
					<div>
					<a href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='▶Others 접기'} else {hide600.style.display='none';show600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide600" style="display: none">
						탱고<input type="checkbox" name="videoInterest_interest" value = "601">
						탭댄스<input type="checkbox" name="videoInterest_interest" value = "602">
						발리댄스<input type="checkbox" name="videoInterest_interest" value = "603">
						자이브<input type="checkbox" name="videoInterest_interest" value = "604">
						재즈<input type="checkbox" name="videoInterest_interest" value = "605">
						Others<input type="checkbox" name="videoInterest_interest" value = "699">
					</div>
					</div><br>
					
					
				<div class="line-box">
					<div class="line"></div>
				</div>

                     <div>
                        <br> <input class="btn btn-outline-success my-2 my-sm-7" type="submit" id="uploadsub" value="Upload">&emsp;&emsp;
                        <button class="btn btn-danger" value="" onclick="">취소</button>

                     </div>
                  </div>

               </div>
            </form>
         </div>

      </div>
</div>
   <script>
      $(document).ready(function() {
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
</body>
</html>