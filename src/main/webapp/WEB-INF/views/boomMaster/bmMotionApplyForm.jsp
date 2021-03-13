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
    .label-active { top: -3em; } 
    button { display: inline-block; padding: 12px 24px; background: rgb(220,220,220); font-weight: bold; color: rgb(120,120,120); border: none; outline: none; border-radius: 3px; cursor: pointer; transition: ease .3s; } 
    button:hover { background: #8BC34A; color: #ffffff; } 
    

</style>
<title>붐마스터 신청하기</title>

<script type="text/javascript">
	function fn_bmApplyFormCheck() {

		return true;
	}

	function fn_applyMotion() {


		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var boommaster_intro = document.getElementById("boommaster_intro").value;


		if(name == null || name.length == 0){
			alert("이름을 적어주세요.");
			return false;
		}
		if(email == null || email.length == 0){
			alert("E-MAIL를 적어주세요.");
			return false;
		}
		if(boommaster_intro == null || boommaster_intro.length == 0){
			alert("MESSAGE를 적어주세요.");
			return false;
		}

		var result = confirm("신청 하시겠습니까?");
		if(result){
		    alert("신천완료 되었습니다.");
		}else{
		    alert("취소 되었습니다.");
		    return false;
		}
		return true;
	}

	function cancel(){
		location.href='/report/closeForm';
	}
</script>


</head>
<body>
	<div>
		<div id="allSize" class="container">
			<p>
				<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
					width="15%" style="min-width: 120px; max-width: 200px;">
			</p>
			<h1>모션인식 신청하기</h1>


			<div class="panel-body">

				<form id="form" class="topBefore"
					onsubmit="return fn_applyMotion();">

					<input id="name" type="text" placeholder="NAME"
						style="width: 100%;">
					<hr class="one"
						style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
					<input id="email" type="text" placeholder="E-MAIL"
						style="width: 100%;">
					<hr class="one"
						style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">
					<textarea class="form-control" cols="200" rows="3"
						id="boommaster_intro" name="boommaster_intro"
						placeholder="MESSAGE"></textarea>
					<hr class="one"
						style="width: 100%; border-bottom: 0px; text-align: left; margin-left: 0px">

					<input id="submit" type="submit" value="모션인식 신청메일 보내기">
					<input type="reset" value="cancel" onclick="return cancel();">

				</form>

			</div>




		</div>
	</div>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->

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