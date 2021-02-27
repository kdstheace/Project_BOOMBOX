<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


<style type="text/css">

@charset "UTF-8";

    *{
        font-family : 'Do Hyeon';
        font-size : 20px;
    }

    body { 
        background: #ffd343; 
        } 

    div#allSize{
        max-width: 1000px; 
        text-align: center;
    }

    #button{
        font-size: 15px;
    }

    img{
        margin: 20px 20px 0px 20px;
    }
    
    form { 
        width: 60%; 
        margin: auto; 
        background: #ffffff; 
        padding: 30px 120px 40px 120px; 
        text-align: center; 
        -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1); 
        box-shadow: 2px 2px 3px rgba(0,0,0,0.1); 
        min-width: 600px;
        } 
    label { 
        display: block; 
        position: relative; 
        margin: 40px 0px; } 
    .label-txt { 
        position: absolute; 
        top: -1.6em; 
        padding: 10px; 
        font-size: .8em; 
        letter-spacing: 1px; 
        color: rgb(120,120,120); 
        transition: ease .3s; 
        } 
    .input { 
        /* width: 100%;  */
        padding: 10px; 
        background: transparent; 
        border: none; 
        outline: none; } 
    .line-box { 
        position: relative; 
        width: 100%; 
        height: 2px; 
        background: #BCBCBC; 
    } 
    .line { 
        position: absolute; 
        width: 0%; 
        height: 2px; 
        top: 0px;    
        left: 50%; 
        transform: translateX(-50%); 
        background: #8BC34A; 
        transition: ease .6s; 
    } 
    .input:focus + .line-box .line { width: 100%; } 
    .label-active { top: -3em; } button { display: inline-block; padding: 12px 24px; background: rgb(220,220,220); font-weight: bold; color: rgb(120,120,120); border: none; outline: none; border-radius: 3px; cursor: pointer; transition: ease .3s; } 
    button:hover { background: #8BC34A; color: #ffffff; } 
    

</style>
<title>붐마스터 신청하기</title>

<script type="text/javascript">

function fn_bmApplyFormCheck(){

	return true;
}


</script>


</head>
<body>

	<div id="allSize" class="container">
		<p>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</p>
		<h1>붐마스터 신청하기</h1>
		<form action="/boomMaster/bmApply" method="post" enctype="multipart/form-data">
			<%-- <input type="hidden" id="user_googleId" name="user_googleId" value="${userVO.user_Id}">  --%>
			<label>
				<p class="label-txt">프로필 사진</p><br>
				<input type="file" name="boommaster_cardImg"><br> 
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			<label>
				<p class="label-txt">샘플영상</p><br> 
				<input type="file" name="boommaster_sampleVideo"><br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			<label>
				<p class="label-txt">샘플사진</p><br> 
				<input type="file" name="boommaster_careerImg"><br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			<label>
				<p class="label-txt">메인분야</p> <br>
				
					<div>
					<a href=#none id="show100" onclick="if(hide100.style.display=='none') {hide100.style.display='';show100.innerText='▶홈트레이닝 접기'} else {hide100.style.display='none';show100.innerText='▶홈트레이닝 펼치기'}">▶홈트레이닝 펼치기</a>
					<div id="hide100" style="display: none">
						홈 트레이닝<input type="radio" name="boommaster_major1" value = "101" checked="checked">
					</div>
					</div>

					<div>
					<a href=#none id="show200" onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='▶Kids 접기'} else {hide200.style.display='none';show200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide200" style="display: none">
						동요율동<input type="radio" name="boommaster_major1" value = "201">
						치어리딩<input type="radio" name="boommaster_major1" value = "202">
						Other<input type="radio" name="boommaster_major1" value = "299">
					</div>
					</div>
					
					
					<div >
					<a href=#none id="show300" onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='▶방송댄스 접기'} else {hide300.style.display='none';show300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide300" style="display: none">
						K-POP<input type="radio" name="boommaster_major1" value = "301">
						J-POP<input type="radio" name="boommaster_major1" value = "302">
						Others<input type="radio" name="boommaster_major1" value = "399">
					</div>
					</div>
					
					<div>
					<a href=#none id="show400" onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='▶클럽댄스 접기'} else {hide400.style.display='none';show400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide400" style="display: none">
						MALE<input type="radio" name="boommaster_major1" value = "401">
						FEMALE<input type="radio" name="boommaster_major1" value = "402">
						Others<input type="radio" name="boommaster_major1" value = "499">
					</div>
					</div>
					
					<div>
					<a href=#none id="show500" onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='▶힙합 접기'} else {hide500.style.display='none';show500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide500" style="display: none">
						팝핀<input type="radio" name="boommaster_major1" value = "501">
						B-BOY<input type="radio" name="boommaster_major1" value = "502">
						락킹<input type="radio" name="boommaster_major1" value = "503">
						Others<input type="radio" name="boommaster_major1" value = "599">
					</div>
					</div>
					
					
					<div>
					<a href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='▶Others 접기'} else {hide600.style.display='none';show600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide600" style="display: none">
						탱고<input type=radio name="boommaster_major1" value = "601">
						탭댄스<input type="radio" name="boommaster_major1" value = "602">
						발리댄스<input type="radio" name="boommaster_major1" value = "603">
						자이브<input type="radio" name="boommaster_major1" value = "604">
						재즈<input type="radio" name="boommaster_major1" value = "605">
						Others<input type="radio" name="boommaster_major1" value = "699">
					</div>
					</div><br>
				
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> 
			
			
			
			<label>
				<p class="label-txt">메인분야2</p> <br>
				
				<div>

						없음<input type="radio" name="boommaster_major2" value = "000" checked="checked">
				
					<div>
					<a href=#none id="show2100" onclick="if(hide2100.style.display=='none') {hide2100.style.display='';show2100.innerText='▶홈트레이닝 접기'} else {hide2100.style.display='none';show2100.innerText='▶홈트레이닝 펼치기'}">▶홈트레이닝 펼치기</a>
					<div id="hide2100" style="display: none">
						홈 트레이닝<input type="radio" name="boommaster_major2" value = "101">
					</div>
					</div>

					<div>
					<a href=#none id="show2200" onclick="if(hide2200.style.display=='none') {hide2200.style.display='';show2200.innerText='▶Kids 접기'} else {hide2200.style.display='none';show2200.innerText='▶Kids 펼치기'}">▶Kids 펼치기</a>
					<div id="hide2200" style="display: none">
						동요율동<input type="radio" name="boommaster_major2" value = "201">
						치어리딩<input type="radio" name="boommaster_major2" value = "202">
						Other<input type="radio" name="boommaster_major2" value = "299">
					</div>
					</div>
					
					
					<div >
					<a href=#none id="show2300" onclick="if(hide2300.style.display=='none') {hide2300.style.display='';show2300.innerText='▶방송댄스 접기'} else {hide2300.style.display='none';show2300.innerText='▶방송댄스 펼치기'}">▶방송댄스 펼치기</a>
					<div id="hide2300" style="display: none">
						K-POP<input type="radio" name="boommaster_major2" value = "301">
						J-POP<input type="radio" name="boommaster_major2" value = "302">
						Others<input type="radio" name="boommaster_major2" value = "399">
					</div>
					</div>
					
					<div>
					<a href=#none id="show2400" onclick="if(hide2400.style.display=='none') {hide2400.style.display='';show2400.innerText='▶클럽댄스 접기'} else {hide2400.style.display='none';show2400.innerText='▶클럽댄스 펼치기'}">▶클럽댄스 펼치기</a>
					<div id="hide2400" style="display: none">
						MALE<input type="radio" name="boommaster_major2" value = "401">
						FEMALE<input type="radio" name="boommaster_major2" value = "402">
						Others<input type="radio" name="boommaster_major2" value = "499">
					</div>
					</div>
					
					<div>
					<a href=#none id="show2500" onclick="if(hide2500.style.display=='none') {hide2500.style.display='';show2500.innerText='▶힙합 접기'} else {hide2500.style.display='none';show2500.innerText='▶힙합 펼치기'}">▶힙합 펼치기</a>
					<div id="hide2500" style="display: none">
						팝핀<input type="radio" name="boommaster_major2" value = "501">
						B-BOY<input type="radio" name="boommaster_major2" value = "502">
						락킹<input type="radio" name="boommaster_major2" value = "503">
						Others<input type="radio" name="boommaster_major2" value = "599">
					</div>
					</div>
					
					
					<div>
					<a href=#none id="show2600" onclick="if(hide2600.style.display=='none') {hide2600.style.display='';show2600.innerText='▶Others 접기'} else {hide2600.style.display='none';show2600.innerText='▶Others 펼치기'}">▶Others 펼치기</a>
					<div id="hide2600" style="display: none">
						탱고<input type=radio name="boommaster_major2" value = "601">
						탭댄스<input type="radio" name="boommaster_major2" value = "602">
						발리댄스<input type="radio" name="boommaster_major2" value = "603">
						자이브<input type="radio" name="boommaster_major2" value = "604">
						재즈<input type="radio" name="boommaster_major2" value = "605">
						Others<input type="radio" name="boommaster_major2" value = "699">
					</div>
					</div><br>
				
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			
			
			
			<label>
				<p class="label-txt">자기소개</p> <br>
					<textarea class="form-control" cols="200" rows="3" id="boommaster_intro" name="boommaster_intro"></textarea> 
<br>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
				<input class="butten" type="submit" value="붐마스터 신청하기" id="uploadsub" value="Upload"> 
				<input type="reset" value="cancel">
			</button>
		</form>

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

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->

				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
					integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
					integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
					crossorigin="anonymous"></script>
		
</body>
</html>