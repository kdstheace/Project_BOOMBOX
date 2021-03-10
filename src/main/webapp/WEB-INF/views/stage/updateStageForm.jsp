
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
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
        margin: 60px  0px; }
    .label-txt {
        position: absolute;
        top: -1.6em;
        padding: 0px;
        font-size: 1em;
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
    .bannerST{
  		   overflow: hidden;
           text-overflow: ellipsis;
           white-space: nowrap;

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

<style type="text/css">



</style>
<title>회원가입</title>

<script type="text/javascript">


function nowDate(){

document.getElementById("crm_writeDate").value = new Date().toISOString().slice(0,-1);

}

function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp() { // 24시간제
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


	function delectFuntion(){
		var result = confirm("정말로 삭제 하시겠습니까?");
		if(result){
		    alert("삭제 되었습니다.");
		}else{
		    alert("취소 되었습니다.");
		    return false;
		}
		return true;
		}


	/* function uploadClose(){



		var uploadBanner = document.getElementById("uploadBanner").value;
		var profileImg = document.getElementById("profileImg").value;
		var stage_intro = document.getElementById("stage_intro").value;

		if(uploadBanner == null || uploadBanner.length == 0){
			alert("배너 파일을 선택해 주세요.");
			return false;
		}

		if(profileImg == null || profileImg.length == 0){
			alert("프로필 사진을 선택해 주세요.");
			return false;
		}

		if(stage_intro == null || stage_intro.length == 0){
			alert("소개글을 적어주세요.");
			return false;
		}else if( stage_intro != null && stage_intro.length != 0){

			var result = confirm(" 업로드 하시겠습니까?");

			if(result){
			    alert("업로드 되었습니다.");
			}else{
			    alert("취소 되었습니다.");
			    return false;
			}

			return true;
			}



		} */




</script>


</head>
<body>


<div id="allSize" class="container">
		<p>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</p>
		<h1>스테이지 수정</h1>
		<form action="/stage/uploadStage" method="post" enctype="multipart/form-data">

			<label>
			<p class="label-txt">Banner Upload :</p>
			<a class="bannerST">현재 파일 : ${stage.stage_bannerImgS } <a class="btn btn-danger" href="/stage/deleteBanner" role="button" style="font-size: 0.8px; line-height: 0.5px; " onclick="delectFuntion();">사진 삭제</a></a>

			<input type="file" id="uploadBanner" name="uploadBanner" style="margin-top: 30px; margin-bottom: 10px;" >

				<div class="line-box" style="margin-bottom: 20px">
					<div class="line"> </div>
					<div style="text-align: right;"><h6>1300X200<br></h6></div>

				</div>
			</label>




			<label>
			<p class="label-txt"  >Profile Upload :</p>

			<a class="bannerST">현재 파일 : ${stage.stage_profileImgS} <a class="btn btn-danger" href="/stage/deleteProfile" role="button" style="font-size: 0.8px; line-height: 0.5px; " onclick="delectFuntion();">사진 삭제</a><br></a>



			<input type="file" id="profileImg" name="profileImg" style="margin-top: 28px; margin-bottom: 10px;" >
				<div class="line-box">
					<div class="line"></div>
					<div style="text-align: right;"><h6>150X150<br></h6></div>
				</div>
			</label>

			<label>
				<p class="label-txt" style="margin-top: 20px; "> Intro </p><br> <textarea  id="stage_intro" name="stage_intro" class="form-control" rows="5"  >${stage.stage_intro }</textarea>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>



				<input class="btn btn-outline-success my-2 my-sm-7" type="submit" id="uploadsub" value="수정하기" onclick="return uploadClose();">
				<a class="btn btn-danger" href="/report/closeForm" role="button">취소</a>

		</form>

	</div>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
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