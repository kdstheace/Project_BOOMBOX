<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

        <!-- 구글로그인 -->
        <meta name="google-signin-scope" content="profile email">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id"
            content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">

        <style type="text/css">
            @charset "UTF-8";
            * {
                font-family: 'Do Hyeon', 'Sawarabi Gothic', sans-serif;
                font-size: 20px;
            }

            body {
                background: #ffd343;
            }

            div#allSize {
                max-width: 1000px;
                text-align: center;
            }

            #button {
                font-size: 15px;
            }

            img {
                margin: 20px 20px 0px 20px;
            }

            form {
                width: 60%;
                margin: auto;
                background: #ffffff;
                padding: 30px 120px 40px 120px;
                text-align: center;
                -webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
                box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
                min-width: 600px;
            }

            label {
                display: block;
                position: relative;
                margin: 40px 0px;
            }

            .label-txt {
                position: absolute;
                top: -1.6em;
                padding: 10px;
                font-size: .8em;
                letter-spacing: 1px;
                color: rgb(120, 120, 120);
                transition: ease .3s;
            }

            .input {
                /* width: 100%;  */
                padding: 10px;
                background: transparent;
                border: none;
                outline: none;
            }

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

            .input:focus+.line-box .line {
                width: 100%;
            }

            .label-active {
                top: -3em;
            }

            button {
                display: inline-block;
                padding: 12px 24px;
                background: rgb(220, 220, 220);
                font-weight: bold;
                color: rgb(120, 120, 120);
                border: none;
                outline: none;
                border-radius: 3px;
                cursor: pointer;
                transition: ease .3s;
            }

            button:hover {
                background: #8BC34A;
                color: #ffffff;
            }
        </style>
        <title>Edit Profile</title>
        <script type="text/javascript">


        function cancle(){
        	location.href='/report/closeForm';

        	}



        function fn_updateFormCheck(){

        	var user_name = document.getElementById("user_name").value;
        	var user_zip = document.getElementById("user_zip").value;
        	var user_address = document.getElementById("user_address").value;
        	var user_email = document.getElementById("user_email").value;
        	/* var userInterest_interest = document.getElementById("userInterest_interest").value; */


             	/* 닉네임 유효성 검사 */
         	  	if(user_name == null || user_name.length == 0){
        		alert("닉네임을 입력해 주세요");
        		return false;
        		} else if(user_name.length < 3 || user_name.length > 8) {
        		alert("닉네임은 3~8글자 사이로 입력해 주세요");
        		return false;
        		}





        	/* 우편번호 */
         	  if(user_zip == null || user_zip.length == 0){
        		alert("우편번호을 입력해 주세요");
        		return false;
        	}

        	/* 주소 */
          	if(user_address == null || user_address.length == 0){
        		alert("주소을 입력해 주세요");
        		return false;
        	}

        	/* 이메일 */

          	if(user_email == null || user_email.length == 0){
        		alert("이메일을 입력해 주세요");
        		return false;
        	}

        	/* 관심장르 */
        	var count = 0;
        	var interestCheck = document.getElementsByName('userInterest_interest');
        	for(var i = 0; i < interestCheck.length; i++) {
        		if(interestCheck[i].checked) {
        			count = 1;
        			break;
        			}
        		}
        	if (count == 0) {  //관심분야 확인
        		  alert("관심분야를 체크해 주세요");
        		  return false;
        	}


        	return true;
        }


        function nameCheckForm() {
            window.open("/user/nameCheckForm", "nameCheckForm", "width=600, height=500");
        }

        function emailCheckForm() {
            window.open("/user/emailCheckForm", "emailCheckForm", "width=600, height=500");
        }




            function fn_check() {
                //var user_gender = document.getElementById("user_gender").checked;
                ////start
                var check_count = document.getElementsByName("user_gender").length;
                var user_gender = "male";
                for (var i = 0; i < check_count; i++) {
                    if (document.getElementsByName("user_gender")[i].checked == true) {
                        user_gender = document.getElementsByName("user_gender")[i].value;
                    }
                }
                ////end

                console.info("Test값 가져오기");
                console.info("닉네임 : ", user_name.value);
                console.info("폰넘버 : ", user_phone.value);
                console.info("주소 : ", user_address.value);
                console.info("우편번호 : ", user_zip.value);
                console.info("이메일 : ", user_email.value);
                console.info("생일 : ", user_bday.value);

                console.info("성별 : ", user_gender);
                console.info("구글아이디 : ", user_googleId.value);
                console.info("구글 이미지 : ", user_googleImg.value);
            }

        </script>



    </head>

    <body>

        <!-- <input type="text" id="sample6_postcode" placeholder="우편번호"> -->
        <!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> -->
        <!-- <input type="text" id="sample6_address" placeholder="주소"><br> -->
        <!-- <input type="text" id="sample6_detailAddress" placeholder="상세주소"> -->
        <!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->


        <div id="allSize" class="container">
            <p>
                <img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo" width="15%"
                    style="min-width: 120px; max-width: 200px;">
            </p>
            <h1><spring:message code="user.updateInfoForm.title" /></h1>
            <form action="/user/updateInfo" method="post" onsubmit="return fn_updateFormCheck();">
                <input type="hidden" id="user_googleId" name="user_googleId" value="${userVO.user_Id}"> <label>
                    <p class="label-txt"><spring:message code="user.updateInfoForm.nickname" /></p>
                    <input type="text" class="input" id="user_name" name="user_name" readonly="readonly"
                        value="${loginName }">
                    <input type="button" value="<spring:message code="user.updateInfoForm.nicknameCheck" />" onclick="nameCheckForm();">
                    <div class="line-box">
                        <div class="line"></div>
                    </div>
                </label>

                <label>
                    <p class="label-txt"><spring:message code="user.updateInfoForm.zip" /></p> <input type="text" class="input" id="user_zip" name="user_zip"
                        value="${userZip }">
                    <input type="button" value="<spring:message code="user.updateInfoForm.zipSeek" />" onclick="sample6_execDaumPostcode()" style="width: 130px;">
                    <div class="line-box">
                        <div class="line"></div>
                    </div>
                </label>

                <label>
                    <p class="label-txt"><spring:message code="user.updateInfoForm.address" /></p> <input type="text" class="input" id="user_address"
                        name="user_address" value="${userAddress }">
                    <div class="line-box">
                        <div class="line"></div>
                    </div>
                </label> <label>
                    <p class="label-txt"><spring:message code="user.updateInfoForm.email" /></p> <input type="text" class="input" id="user_email" name="user_email"
                        readonly="readonly" value="${userEmail }">
                    <input type="button" value="<spring:message code="user.updateInfoForm.emailCheck" />" onclick="emailCheckForm();">
                    <div class="line-box">
                        <div class="line"></div>
                    </div>
                </label> <label>
                    <p class="label-txt"><spring:message code="user.updateInfoForm.interest" /></p> <br>
                    <div>
                        <a href=#none id="show100" onclick="if(hide100.style.display=='none') {hide100.style.display='';show100.innerText='<spring:message code="user.updateInfoForm.homeTrainingClose" />'} else {hide100.style.display='none';show100.innerText='<spring:message code="user.updateInfoForm.homeTrainingOpen" />'}"><spring:message code="user.updateInfoForm.homeTrainingOpen" /></a>
                        <div id="hide100" style="display: none">
                            <spring:message code="user.updateInfoForm.homeTraining" /><input type="checkbox" name="userInterest_interest" value="HOME TRAINING" checked="checked">
                        </div>
                    </div>

                    <div>
                        <a href=#none id="show200"
                            onclick="if(hide200.style.display=='none') {hide200.style.display='';show200.innerText='<spring:message code="user.updateInfoForm.kidsClose" />'} else {hide200.style.display='none';show200.innerText='<spring:message code="user.updateInfoForm.kidsOpen" />'}"><spring:message code="user.updateInfoForm.kidsOpen" /></a>
                        <div id="hide200" style="display: none">
                            <spring:message code="user.updateInfoForm.fluctuation" /><input type="checkbox" name="userInterest_interest" value="KIDS"> 
                            <spring:message code="user.updateInfoForm.cheerleading" /><input type="checkbox" name="userInterest_interest" value="CHEERLEADING"> 
                            <spring:message code="user.updateInfoForm.others" /><input type="checkbox" name="userInterest_interest" value="OTHER(TEENS)">
                        </div>
                    </div>


                    <div>
                        <a href=#none id="show300"
                            onclick="if(hide300.style.display=='none') {hide300.style.display='';show300.innerText='<spring:message code="user.updateInfoForm.broadcastDanceClose" />'} else {hide300.style.display='none';show300.innerText='<spring:message code="user.updateInfoForm.broadcastDanceOpen" />'}"><spring:message code="user.updateInfoForm.broadcastDanceOpen" /></a>
                        <div id="hide300" style="display: none">
                            <spring:message code="user.updateInfoForm.kpop" /><input type="checkbox" name="userInterest_interest" value="K-POP">
                            <spring:message code="user.updateInfoForm.jpop" /><input type="checkbox" name="userInterest_interest" value="J-POP">
                            <spring:message code="user.updateInfoForm.others" /><input type="checkbox" name="userInterest_interest" value="OTHERS(CHOREO)">
                        </div>
                    </div>

                    <div>
                        <a href=#none id="show400"
                            onclick="if(hide400.style.display=='none') {hide400.style.display='';show400.innerText='<spring:message code="user.updateInfoForm.clubDanceClose" />'} else {hide400.style.display='none';show400.innerText='<spring:message code="user.updateInfoForm.clubDanceOpen" />'}"><spring:message code="user.updateInfoForm.clubDanceOpen" /></a>
                        <div id="hide400" style="display: none">
                            <spring:message code="user.updateInfoForm.clubMale" /><input type="checkbox" name="userInterest_interest" value="MALE CLUBDANCE"> 
                            <spring:message code="user.updateInfoForm.clubFemale" /><input type="checkbox" name="userInterest_interest" value="FEMALE CLUBDANCE">
                            <spring:message code="user.updateInfoForm.others" /><input type="checkbox" name="userInterest_interest" value="OTHERS(CLUB)">
                        </div>
                    </div>

                    <div>
                        <a href=#none id="show500"
                            onclick="if(hide500.style.display=='none') {hide500.style.display='';show500.innerText='<spring:message code="user.updateInfoForm.hiphopClose" />'} else {hide500.style.display='none';show500.innerText='<spring:message code="user.updateInfoForm.hiphopOpen" />'}"><spring:message code="user.updateInfoForm.hiphopOpen" /></a>
                        <div id="hide500" style="display: none">
                            <spring:message code="user.updateInfoForm.poppin" /><input type="checkbox" name="userInterest_interest" value="POPPIN DANCE">
                            <spring:message code="user.updateInfoForm.bboy" /><input type="checkbox" name="userInterest_interest" value="BREAK DANCE"> 
                            <spring:message code="user.updateInfoForm.locking" /><input type="checkbox" name="userInterest_interest" value="LOCKING"> 
                            <spring:message code="user.updateInfoForm.others" /><input type="checkbox" name="userInterest_interest" value="OTHERS(HIPHOP)">
                        </div>
                    </div>


                    <div>
                        <a href=#none id="show600" onclick="if(hide600.style.display=='none') {hide600.style.display='';show600.innerText='<spring:message code="user.updateInfoForm.othersClose" />'} else {hide600.style.display='none';show600.innerText='<spring:message code="user.updateInfoForm.othersOpen" />'}"><spring:message code="user.updateInfoForm.othersOpen" /></a>
                        <div id="hide600" style="display: none">
						<spring:message code="user.updateInfoForm.tango" /><input type="checkbox" name="userInterest_interest" value = "TANGO">
						<spring:message code="user.updateInfoForm.tapDance" /><input type="checkbox" name="userInterest_interest" value = "TAP DANCE">
						<spring:message code="user.updateInfoForm.bellyDance" /><input type="checkbox" name="userInterest_interest" value = "BELLY DANCE">
						<spring:message code="user.updateInfoForm.jive" /><input type="checkbox" name="userInterest_interest" value = "JIVE">
						<spring:message code="user.updateInfoForm.jazz" /><input type="checkbox" name="userInterest_interest" value = "JAZZ"><br>
						<spring:message code="user.updateInfoForm.others" /><input type="checkbox" name="userInterest_interest" value = "OTHERS">
                        </div>
                    </div>
                    <br>


                    <div class="line-box">
                        <div class="line"></div>
                    </div>
                </label> <input class="button" type="submit" value="<spring:message code="user.updateInfoForm.editInfo" />"> <input type="reset" value="cancel" onclick="cancle()">
                </button>
            </form>

        </div>

        <script>$(document).ready(
                function () {
                    $('.input').focus(
                        function () {
                            $(this).parent().find(".label-txt").addClass('label-active');
                        });
                    $(".input").focusout(
                        function () {
                            if ($(this).val() == '') {
                                $(this).parent().find(".label-txt").removeClass('label-active');
                            };
                        });
                });
        </script>

        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
        <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>


        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("user_address").value = extraAddr;

                        } else {
                            document.getElementById("user_address").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('user_zip').value = data.zonecode;
                        document.getElementById("user_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("user_address").focus();
                    }
                }).open();
            }
        </script>


    </body>

    </html>