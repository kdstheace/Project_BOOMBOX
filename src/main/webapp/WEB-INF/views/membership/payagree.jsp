<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    .tl{
    font-size: 30px;
    }
    .pl{
     text-align: center;
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
        text-align: left;
        -webkit-box-shadow: 2px 2px 3px  4px rgba(0,0,0,0.1);
        box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
        min-width: 850px;
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
<title>Insert title here</title>
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



</script>
</head>
<body>

	<div id="allSize" class="container">
	<p>
			<img id="mainLogo" src="/resources/img/BOOMBOXsq.png" alt="Logo"
				width="15%" style="min-width: 120px; max-width: 200px;">
		</p>
		<h1>약관 동의</h1>
		<form action="/stage/uploadStage" method="post" enctype="multipart/form-data">
		<div class="box_tap" style="padding:0.1px;">

    		<font class="tl">제1조 목적</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		이 약관은 통신과금서비스를 제공하는 주식회사 케이지모빌리언스(이하 "회사"라 합니다)와
    		통신과금서비스 이용자(이하 "이용자"라 합니다) 사이의 통신과금서비스에 관한 기본적인 사항을
    		정함으로써 통신과금서비스의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.<br><br>

        <p>
    		<font class="tl">제2조 (용어의 정의)</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>

    		이 약관에서 정하는 용어의 정의는 다음과 같습니다.<br>
    		</p><ol>
    			<li>
        		"통신과금서비스"라 함은 정보통신서비스로서 다음 각 호의 업무를 말합니다.<br><br>
    			1) 타인이 판매, 제공하는 재화 또는 용역(이하 "재화 등"이라 한다)의 대가를 자신이 제공하는
    			전기통신역무의 요금과 함께 청구, 징수하는 업무<br><br>
    			2) 타인이 판매, 제공하는 재화 등의 대가가 제1호의 업무를 제공하는 자의 전기통신역무의 요금과
    			함께 청구, 징수되도록 거래정보를 전자적으로 송수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 업무<br><br>
    			</li>
    			<li>
        		"이용자"라 함은 이 약관에 동의하고 회사가 제공하는 통신과금서비스를 이용하여 재화 등을 구입, 이용하는 자를 말합니다.<br><br>
    			</li>
    			<li>
        		"접근매체"라 함은 통신과금 거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여
        		사용되는 수단 또는 정보로서 유무선 전화 및 통신사에 등록된 이용자의 유무선 전화 번호, 이용자의 생체정보,
        		등록된 이용자번호, 이용자 결제정보와 연동되어 생성되는 고유번호(이하 ‘고유번호’), 카드, 이상의 수단이나
        		정보를 사용하는데 필요한 비밀번호 등을 말합니다.<br><br>
    			</li>
    			<li>
        		"거래지시"라 함은 이용자가 통신과금서비스계약에 따라 회사에게 통신과금서비스의 처리를 지시하는 것을 말합니다.<br><br>
    			</li>
    			<li>
        		"거래상대방"이라 함은 통신과금서비스를 이용하여 그 대가를 받고 이용자에게 재화 등 을 판매,
        		제공하는 자(회사와 결제대행계약을 체결한 가맹점 등을 포함)를 말합니다.<br><br>
    			</li>
    			<li>
        		"지정한 기일"이란 이용자가 통신사와 약정한 1항의 전기통신역무의 요금 납입기한을 의미하며, 이는 이동통신사의 기준에 따릅니다.<br><br>
    			</li>
    			<li>
    			"휴대폰실시간충전서비스"라 함은 동 서비스에 등록한 선불카드를 사용하여 이용자가 가맹점에서 거래지시를 하면,
    			휴대폰결제를 통해 거래지시 금액만큼 선불카드에 실시간으로 충전이 되는 서비스입니다.<br><br>
    			</li>
    			<li>
    			"오프라인 휴대폰결제서비스"란 동 서비스에 미리 가입한 이용자가 휴대폰을 가맹점 단말기에 접촉하거나
    			일회성으로 발급된 바코드를 스캔함으로써 거래지시를 하는 서비스를 말합니다.<br><br>
    			</li>
    			<li>
    			"월자동결제서비스"라 함은 이용자의 동의를 받아 첫 구매 이후 재화 및 용역의
    			이용기간이 자동으로 연장되어 그 대가가 이용자에게 매월 자동 청구되는 상품을 말합니다.<br><br>
    			</li>
    			<li>
    			"결제 간소화 서비스"라 함은 이용자의 최초 1회 결제 시 이용자의 결제정보와 연동된 고유번호를 생성하고,
    			생성된 고유번호를 활용하여 이용자가 인증만으로 간편하게 계속적으로 결제를 할 수 있는 서비스를 말합니다.<br><br>
    			</li>
    		</ol>
        <p></p>

        <p>
    		<font class="tl">제3조 약관의 명시 및 변경</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    			<li>
        		회사는 이용자가 통신과금서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br><br>
    			</li>
    			<li>
        		회사는 이용자의 요청이 있는 경우 전자문서의 전송방식, 모사전송, 우편에 의하여 본 약관의 사본을 이용자에게 교부합니다.<br><br>
    			</li>
    			<li>
        		회사가 약관을 변경하는 때에는 변경되는 약관의 시행일 1개월 전에 이용자에게 통지하거나 변경되는 약관을 회사의 홈페이지에 공지합니다.
        		이 경우 변경되는 약관에 대하여 이의가 있는 이용자는 통신과금서비스에 관한 계약을 해지할 수 있습니다.<br><br>
    			</li>
    		</ol>
        <p></p>

        <p>
    		<font class="tl">제4조 접근매체의 등록</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		이용자는 동 약관에 동의하고 휴대폰 번호, 카드 번호, 비밀번호 등의 접근매체를 등록하면 동 접근매체의 사용만으로 통신과금서비스를
    		이용할 수 있습니다. 본 약관에 대해 등록 시 동의하시면 향후 결제 시에는 본 약관에 대한 별도 동의 없이도 본 약관의 내용이 적용됩니다.<br>
        </p>

        <p>
    		<font class="tl">제5조 거래지시</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		아래의 경우 거래지시가 있는 것으로 봅니다.<br>
    		</p><ol>
    			<li>
        		이용자가 결제창에 인증번호, 고유식별정보 등을 입력하고 동 약관에 동의하는 경우<br><br>
    			</li>
    			<li>
        		이용자가 제4조의 등록된 접근매체를 사용하여 결제를 요청하는 경우<br><br>
    			</li>
    		</ol>
        <p></p>

        <p>
    		<font class="tl">제5조의 2(월자동결제서비스)</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    			<li>
        		회사는 이용자가 월자동결제서비스를 이용할 경우에는전자적 대금 결제창에서 이용금액과 매월 자동 결제된다는
        		내용에 체크하는 방법 등으로 명시적 동의를 받습니다.<br><br>
       			</li>
    			<li>
        		월자동결제서비스를 제공하는 동안 이용금액을 증액할 경우에는 제1항의 동의를 받을 때
				또는 이용금액이 증액되기 전에 이용자가 전자적 대금 결제창에서 이용금액 증액에 관한
				내용에 체크하는 방법 등으로 명시적 동의를 받습니다.<br><br>
    			</li>
    			<li>
        		제2항에 따라 이용금액이 증액될 경우 회사는 이용자에게 이용금액 변경사실을 단문메시지(SMS) 등을 통하여
        		사전에 통지하며, 이용금액이 증액될 때마다 재동의를 받습니다.<br><br>
    			</li>
    			<li>
        		회사가 월자동결제서비스를 제공하는 동안 콘텐츠제공사업자의 영업양도ㆍ양수 또는 합병 발생 시 이용자에 대한
        		전월 월자동결제 내역이 존재하거나 당월에 월자동결제 동의 내역이 존재하는 경우에만 월자동결제서비스를 제공합니다.<br><br>
    			</li>
    			<li>
    			이용자는 원할 경우 월자동결제서비스를 차단할 수 있으며 본 약관 제18조에서 정하는 방법으로 신청할 수 있습니다.<br><br>
    			</li>
    		</ol>
        <p></p>

        <p>
    		<font class="tl">제6조 회사의 권리와 의무</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    			<li>
    			회사는 서비스가 안전하게 제공될 수 있도록 선량한 관리자로서 주의를 다할 것입니다.<br><br>
    			</li>
				<li>
				회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 전자상거래 등에서의 소비자보호 등에 관한 법률에 따라 방송통신위원회와 (사)한국전화결제산업협회에서 마련한 가이드라인에 따른 결제창을
				이용자에게 제공하여 전자적 대금지급 시 고지 의무를 강화하고 안전한 결제 환경 조성 등 이용자 보호를 위해 노력합니다.<br><br>
				</li>
				<li>
				회사는 불법 과금, 복제폰, 휴대폰 깡, 및 불법 마케팅 등으로부터 이용자를 보호하기 위하여 유관 기관과 협조하며,
				피해방지를 위해 최선의 노력을 합니다.<br><br>
				</li>
				<li>
				회사는 이용자의 청약의사가 진정한 의사 표시에 의한 것인지를 확인하기 위하여 다음 각 호의 사항에
				대하여 명확히 고지하고, 고지한 사항에 대한 이용자의 확인절차를 마련합니다.<br><br>
				1) 재화 등 내용 및 종류<br><br>
				2) 재화 등의 가격<br><br>
				3) 용역의 제공기간<br><br>
				</li>
				<li>
				회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제61조에 따라
				과학기술정보통신부장관이 아래 각 호에 해당하는 자에 대해 명한 통신과금서비스
				제공의 거부, 정지 또는 제한 명령을 성실히 준수합니다.<br><br>
				1) 청소년보호법 제16조를 위반하여 청소년유해매체물을 청소년에게 판매, 대여,
				제공하는 자<br><br>
				2) 다음 어느 하나에 해당하는 수단을 이용하여 이용자로 하여금 재화 등을 구매,
				이용하게 함으로써 이용자의 이익을 현저하게 저해하는 자<br><br>

				<div style="padding-left:15px;">- 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제50조를 위반한 영리목적의 광고성 정보 전송</div><br>

				<div style="padding-left:15px;">- 이용자에 대한 기망 또는 부당한 유인</div><br>

				3) 정보통신망 이용촉진 및 정보보호 등에 관한 법률 또는 다른 법률에서 금지하는 재화 등을 판매, 제공하는 자<br><br>
				</li>
    		</ol>
    	<p></p>

        <p>
    		<font class="tl">제6조의 2 익월취소 기능 제공</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
				<li>회사는 이용자의 요청 시 휴대폰결제를 이용한 달의 다음 달 이후에도 결제취소 기능을 제공할 수 있습니다. 단, 익월 결제 취소는 이용자가 사용 중인 통신사가 해당 기능을 제공할 때 가능합니다.<br><br></li>

				<li>일부 가맹점의 경우 재화 등의 특성상 익월취소 기능이 제공되지 않을 수 있으며, 통신사 및 PG사의 정책에 따라 익월취소 기능 제공이 가능한 가맹점은 달라질 수 있습니다. <br><br></li>

				<li>익월취소 요청에 따라 발생한 반환 예정 대금은 통신사의 정책에 따라 이용자의 청구 금액에서 상계 처리됩니다. 단, 반환 대금이 향후 청구 금액보다 많을 경우 잔여 반환 대금은 그 이후 청구 금액에서 순차적으로 상계 처리합니다.<br><br></li>

				<li>상계 처리 시 이용자에게 익월취소에 따른 상계가 됨을 SMS 문자 등으로 안내합니다.<br><br></li>

				<li>익월취소는 이용자의 필요 또는 요청에 의해 제공되는 것이므로 반환 대금에 대한 이자는 가산 되지 않습니다.<br><br></li>
    		</ol>
    	<p></p>

    	<p>
    		<font class="tl">제7조 모니터링 및 해킹방지 시스템 구축</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    			<li>회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링체계를 갖추고 있으며, “정보통신망 이용촉진 및 정보보호에 관한 법률 및 그 시행령에 따른 통신과금서비스의 안정성, 신뢰성 확보를 위한 필요조치를 준수합니다.<br><br></li>

				<li>회사는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영하고 있습니다.<br><br>
				1) 침입차단시스템 설치<br><br>
				2) 침입탐지시스템 설치<br><br>
				3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br><br>
				</li>

				<li>회사는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립·운용하고 있습니다.<br><br>
				1) 컴퓨터바이러스 검색·치료 프로그램을 설치하고 최신 버전 유지<br><br>
				2) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색·치료 프로그램으로 진단 및 치료 후 사용<br><br>
				3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차 마련<br><br>
 				</li>
    		</ol>
    	<p></p>

    	<p>
    		<font class="tl">제8조 회사의 정보보호 조치</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
			<li>회사는 이용자의 과실 또는 이용자 장비의 문제로 인해 회사의 정보통신망에 중대한 침해사고가 발생하여 회사의 서비스를 이용하는 이용자의 정보시스템 또는 정보통신망 등에 심각한 장애가 발생할 가능성이 있는 아래 각 호의 경우에는 이용자에 대한 보호조치를 전자우편, 공지사항 등의 방법으로 요청할 수 있습니다.<br><br>

			1) 이용자의 장비가 제3의 사용자에게 이용당하여 회사의 서비스에 장애를 초래한 경우<br><br>

			2) 이용자의 장비의 H/W 혹은 S/W의 문제로 회사의 서비스에 장애를 초래하는 경우<br><br>

			3) 이용자가 고의 혹은 실수로 회사의 악의적인 접속을 시도하거나 접속을 한 경우<br><br>
			</li>

			<li>이용자가 취할 보호조치의 내용은 아래 각 호와 같습니다.<br><br>

			1) 해당 장비의 네트워크로부터 연결케이블 제거, 서비스 포트 차단, 네트워크 주소<br><br>
			차단 등의 즉각적인 분리

			2) 해당 장비에 대한 보안점검<br><br>

			3) 관련 원인점검 및 패치, OS재설치, 필터링 등의 사후 보안 조치 실시<br><br>
			</li>
			<li>회사는 이용자가 전항의 보호조치를 이행하지 아니할 경우 정보통신망으로의 접속을 5일간 제한 할 수 있습니다.<br><br></li>

			<li>회사가 이용자의 보호조치 불이행에 대하여 부당한 접속 제한을 한 경우 이용자는 제18조 제2항의 담당자에게
			이의제기를 할 수 있으며, 회사는 이의제기를 접수 후 2주 이내로 사실을 확인하고, 이용자에게 서면(전자문서 포함. 이하 같다)으로
			답변을 발송하여야 합니다.<br><br></li>
    		</ol>
    	<p></p>

    	<p>
    		<font class="tl">제9조 개인정보의 보호</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 “정보통신망 이용촉진 및 정보보호 등에 관한 법률”에 따라 개인정보의 제공동의 및 처리위탁에 대한 동의를 받을 때는
    		본 약관의 동의와 별도로 개인정보의 수집, 이용에 대한 동의와 구분하여 동의를 받으며, 이에 대하여 이용자는 동의를 하지
    		아니한다는 이유로 회사는 서비스 제공을 거부하지 않습니다. 다만, 개인정보의 수집, 이용에 대한 동의, 개인정보의 제공동의
    		및 처리위탁에 대한 동의를 거부할 경우 결제가 완료될 수 없음을 알려드립니다.<br><br>
    		</li>
    		<li>
    		개인정보의 보유, 이용 기간이 만료된 개인정보는 아래와 같은 방법으로 파기합니다.<br><br>
			1) 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br><br>
			2) 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br><br>
			</li>
    		<li>
    		이동통신사와의 청구수납대행계약에 따른 요금정산을 위해 필요한 정보(휴대전화번호, 고유식별번호, 사용일자,
    		청구일자, 청구 및 수납금액 등)를 제공, 처리위탁받을 수 있습니다.<br><br>
    		</li>
    		<li>
    		회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기
    		위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 홈페이지(www.mobilians.co.kr)에 게시된
    		개인정보처리방침이 적용됩니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제10조 개인정보 누출 등의 통지, 신고</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 개인정보의 분실, 도난, 유출(이하 “유출 등”이라 합니다) 사실을 안 때에는 지체 없이 다음 각 호의 모든 사항을
    		전자우편, 서면, 모사전송, 전화 또는 이와 유사한 방법 중 어느 하나의 방법으로 해당 이용자에게 알리고 방송통신위원회
    		또는 한국인터넷진흥원에 신고합니다. 다만, 이용자의 연락처를 알 수 없는 등 정당한 사유가 있는 경우에는 인터넷 홈페이지에
    		30일 이상 게시함으로써 통지를 갈음 할 수 있습니다.<br><br>
			1) 유출 등이 된 개인정보 항목<br><br>
			2) 유출 등이 발생한 시점<br><br>
			3) 이용자가 취할 수 있는 조치<br><br>
			4) 회사의 대응 조치<br><br>
			5) 이용자가 상담 등을 접수할 수 있는 부서 및 연락처<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제11조 이용자의 권리의무 등</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>회사는 통신과금서비스 제공을 위하여 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.<br><br>
			</li>
			<li>회사는 이용자에게 거래 금액 외에 일정금액의 수수료를 부과할 수 있습니다. 수수료가 부과되는 경우 서비스 이용 전 이용자에게
			 미리 고지해 드립니다.<br><br>
			</li>
			<li>이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 위탁할 수 없습니다.<br><br>
			</li>
			<li>이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안 되며, 접근매체의 도용이나 위조 또는
			변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br><br>
			</li>
			<li>이용자가 아래 행위를 할 경우 회사는 “정보통신망 이용촉진 및 정보보호에 관한 법률” 제72조에 의거하여 관계당국에
			고소 및 고발, 민사상의 법적 조치를 취할 수 있습니다.<br><br>
			1) 재화등의 판매,제공을 가장하거나 실제 매출금액을 초과하여 통신과금서비스에 의한
			거래를 하거나 이을 대행하게 하는 행위<br><br>
			2) 통신과금서비스이용자로 하여금 통신과금서비스에 의하여 재화 등을 구매, 이용하도록
			한 후 통신과금서비스이용자가 구매, 이용한 재화 등을 할인하여 매입하는 행위<br><br>
			</li>
			<li>이용자는 휴대폰 결제를 이용한 전기통신역무의 요금과 함께 청구된 재화 등의 대가를 지정된 일자(전기통신역무의 요금 납입기일의 최종일을 의미함)까지 납입하여야 합니다.
			이용자가 이를 지정된 일자까지 납입하지 아니한 때에는 그 청구된 재화 등의 대가의 1000분의 30에 상당하는 가산금을 부과하며,
			위 지정된 일자가 속한 월의 다음 월의 전기통신역무의 요금과 함께 청구된 위 재화 등의 대가와 가산금 합계액을 해당 월의 전기통신역무의 요금 납입기일까지 납입해야 합니다.
			만약 이용자가 위 납입기일까지 재화 등의 대가와 가산금 합계액을 납입하지 않는 경우 그 청구된 재화 등의 대가의 1000분의 5에 상당하는 가산금을 추가로 부과하며,
			이용자는 위 납입기일이 속한 월의 다음 월 전기통신역무의 요금 납입기일까지 청구된 위 재화 등의 대가와 가산금 및 추가 가산금 합계액을 모두 납입해야 합니다.
			<br><br>
			</li>
			<li>회사는 각 서비스별 이용자 보호를 위해 비정상 거래 및 위험거래를 방지하기 위한 회사의 정책을 변경할 수 있습니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제12조 비정상 거래 및 위험 거래 차단 시스템 구축</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 스미싱, 명의도용 등 이용자가 아닌 비정상 거래 및 위험거래로 발생하는 제3자의 결제로부터 선량한 이용자를 보호하고,
    		이로 인한 이용자의 손해를 최소화하기 위해 수집한 개인정보를 활용하여 다음 각 호와 같은 시스템을 구축하여야 합니다.<br><br>
			1) 비정상 거래 유형 분석 시스템<br><br>
			2) 복제폰 이용 거래 탐지 시스템<br><br>
			3) 기타 비정상 및 위험 결제 의심 거래 모니터링 시스템<br><br>
    		</li>
    		<li>
    		회사는 본조 제1항 각 호의 시스템을 통해 비정상결제(스미싱, 개인정보도용 시도로 의심되는 일정 금액 이상 일정 횟수
    		이상 결제 시도 등) 또는 위험 결제(환금성이 있어 스미싱, 개인정보 도용에 이용되기 쉬운 서비스의 금액 및 횟수 고려)
    		요청으로 판단될 경우, 결제 요청을 제한 또는 차단할 수 있습니다.<br><br>
    		</li>
    		<li>
    		전항에 의한 제한 또는 차단 사유가 해소된 경우, 이용자는 제18조 제2항의 담당자에게 연락을 하여 본인 확인 절차를
    		거치는 등 필요한 조치를 한 후 통신과금서비스를 이용할 수 있습니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제13조 한국전화결제산업협회</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 전결협의 민원경보시스템 운영을 위해 항시 연락 가능한 담당자를 아래와 같이 지정하여, 신속한 민원처리에 협조합니다.<br><br>
    		1) 고객서비스담당 부서 : 고객센터<br>
			<div style="padding-left:15px;">- 전화번호 : 1800-0678</div>
			<div style="padding-left:15px;">- 이메일 : salesop@kggroup.co.kr</div><br>
    		</li>
    		<li>
    		회사는 전결협 운영위에서 심사하고, 전결협, 과학기술정보통신부장관이 제시한 가이드라인을 준수하며,
    		가맹점에게 가이드라인의 준수를 권고하고 지속적으로 모니터링 합니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제14조 회사의 배상책임</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사가 접근매체의 발급주체가 아닌 경우, 접근매체의 위조나 변조로 발생한 사고로 인하여 발생한 이용자의 손해에 대하여,
    		그 손해가 이용자의 고의 또는 중대한 과실로 인해 발생했을 경우 회사는 그 책임의 전부 또는 일부를 이용자에게 부담하게 할 수 있습니다.<br><br>
    		</li>
    		<li>
    		이용자가 고의 또는 중대한 과실로 제11조 제3항의 접근매체관리의무를 위반하여 발생한 손해에 대하여 회사는 그 책임의 전부 또는 일부를
    		이용자에게 부담하게 할 수 있습니다.<br><br>
    		</li>
    		<li>
    		회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.<br><br>
			</li>
			<li>
			회사는 이용자의 고의 또는 중대한 과실로 인한 손해에 대하여 그 책임의 전부 또는 일부를 이용자에게 부담하게 할 수 있습니다.<br><br>
			</li>
			<li>
			회사와 이용자 사이에 손해배상에 관한 협의가 성립되지 아니하거나 협의를 할 수 없는 경우에는 당사자는 방송통신위원회에 재정을 신청할 수 있습니다.<br><br>
			</li>
			<li>
			회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 통신과금서비스의 제공을 일시적으로 중단할 수 있습니다.<br><br>
			</li>
			<li>
			회사는 전항의 사유로 통신과금서비스의 제공이 일시적으로 중단됨으로 인하여 이용자가 입은 손해에 대하여 배상합니다.
			단, 회사가 고의 또는 과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제15조 고지사항</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 전화, 모사전송, 휴대전화 등을 이용하여 이용자에게 신속하게 전자적 대금지급 사실을 알립니다<br><br>
    		1) 통신과금서비스 이용일시<br><br>
			2) 통신과금서비스를 통한 구매·이용의 거래 상대방의 상호와 연락처<br><br>
			3) 통신과금서비스를 통한 구매·이용 금액과 그 명세<br><br>
			4) 이의신청 방법 및 연락처<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제16조 거래기록의 보존 및 확인</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 다음 각 호의 사항에 관한 기록을 해당 거래를 한 날부터 1년간 보존하여야 합니다. 다만, 건당 거래 금액이 1만원을 초과하는
    		거래인 경우에는 5년간 보존하여야 합니다.<br><br>
			1) 통신과금서비스를 이용한 거래의 종류<br><br>
			2) 거래 금액<br><br>
			3) 거래 상대방<br><br>
			4) 거래 일시<br><br>
			5) 대금을 청구·징수하는 전기통신역무의 가입자번호<br><br>
			6) 제11조 제2항의 수수료<br><br>
			7) 해당 거래와 관련한 전기통신역무의 접속에 관한 사항<br><br>
			8) 거래의 신청 및 조건의 변경에 관한 사항<br><br>
			9) 거래의 승인에 관한 사항<br><br>
			10) 그 밖에 과학기술정보통신부장관이 정하여 고시하는 사항<br><br>
    		</li>
    		<li>
    		전항에 따른 거래기록은 서면, 마이크로필름, 디스크, 자기테이프, 그 밖의 전산정보처리조직에 의하여 보존하여야 합니다.
    		다만, 디스크, 자기테이프, 그 밖의 전산정보처리조직에 의하여 보존하는 경우에는 전자문서 및 전자거래기본법 제5조
    		제1항 각 호의 요건을 모두 갖추어야 합니다.<br><br>
    		</li>
    		<li>
    		회사는 이용자가 구매·이용 내역을 확인할 수 있는 방법을 제공하여야 하며, 이용자가 구매·이용 내역에 관한
    		서면(전자문서를 포함합니다)을 요청하는 경우에는 그 요청을 받은 날부터 2주 이내에 이를 제공하여야 합니다.<br><br>
    		</li>
    		<li>
    		이용자가 전항에서 정한 서면 교부를 요청하고자 할 경우 다음의 연락처로 요청할 수 있습니다.<br><br>
    		<div style="padding-left:15px;">주소: 서울특별시 중구 통일로 92(순화동 1-170) KG타워 16층</div>
			<div style="padding-left:15px;">이메일 주소: help@mobilians.co.kr</div>
			<div style="padding-left:15px;">전화번호: 1800-0678</div>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제17조 통신과금정보의 위탁금지</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 통신과금서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 통신과금의 내용과
    		실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 위탁, 누설하거나 업무상 목적 외에 사용하지 아니합니다.
    		단, 서비스의 제공에 관한 계약을 이행하기 위하여 필요하여 이용자 정보를 제3자에게 위탁할 경우, 본 약관 또는 홈페이지를
    		통해 공개하거나 전자우편, 서면, 모사전송, 전화 또는 이와 유사한 방법 중 어느 하나의 방법으로 이용자에게 알립니다.<br><br>
    		</li>
    		<li>
    		회사는 정보통신망이용촉진및정보보호등에관한법률 (제7장 통신과금서비스)의 관련규정에 의거하여 구성된 "한국전화결제산업협회"가
    		이용자 보호를 위해 통신과금서비스 관련 정보를 요청하면 다음 각 호의 경우에는 관련 정보를 위탁할 수 있습니다.<br><br>
			1) 휴대폰깡, 대포폰, 복제폰 등 시장 질서를 교란시키는 불법업체 혹은 불법행위자에 의한 민원 발생의 경우<br><br>
			2) 지인 사용 등 제3자 결제로 인한 민원발생의 경우<br><br>
			3) 기타 통신과금서비스를 통한 불법행위가 발생하여 이용자 보호가 필요한 경우<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제18조 이의신청 및 권리구제</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사는 이용자와 거래 상대방 사이에 전자적 대금지급과 관련하여 다툼이 있는 경우 이용자나 거래 상대방이 분쟁해결을 위하여 분쟁발생
    		사실을 소명하여 요청하는 경우 분쟁해결에 필요한 범위 내에서 다음 각 호의 사항에 대하여 지체 없이 협조합니다.<br><br>
			1) 분쟁의 원인이 된 대금지급과 관련된 정보(이용자 인증 관련 정보를 포함합니다)의 열람, 복사 허용<br><br>
			2) 분쟁의 원인이 된 대금지급에 대한 회사의 보안유지 조치관련 정보의 열람, 복사허용.
			단, 공개할 경우 보안유지에 장애가 발생할 우려가 있는 정보에 대해서는 공개를 거부할 수 있습니다.<br><br>
    		</li>
    		<li>
    		이용자는 다음의 보호책임자 및 담당부서에 대하여 이의신청 및 권리구제를 요청할 수 있습니다.<br><br>
			1) 개인정보 보호책임자 성명 : 최호황<br>
			<div style="padding-left:15px;">- 직위 : IT총괄</div>
			<div style="padding-left:15px;">- 전화번호 : 1800-0678</div>
			<div style="padding-left:15px;">- 이메일 : privacy_mobil@kggroup.co.kr</div>
			<br>
			2) 개인정보 보호담당자 성명 : 전상호<br>
			<div style="padding-left:15px;">- 전화번호 : 1800-0678</div>
			<div style="padding-left:15px;">- 이메일 : privacy_mobil@kggroup.co.kr</div>
			<br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제19조 재화 등의 공급계약상 대금채권의 채권자</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		회사가 어느 재화 등의 대가를 가맹점에 선지급한 경우, 위 선지급 대상인 재화 등에 관한 공급계약(이용자는 회사의
    		고객센터를 통해서 이용자가 거래한 가맹점이 해당 거래의 대상인 재화 등의 대가를 회사로부터 선지급 받는지 여부를
    		확인하실 수 있습니다)과 관련하여 이용자와 해당 가맹점이 체결한 해당 재화 등의 공급계약상 대금채권의 채권자가
    		회사임을 해당 가맹점을 대리하여 알려드리며, 이용자는 이에 동의합니다.<br><br>
    		</li>
    		<li>
    		회사는 회사가 제1항의 재화 등의 공급계약상 대금채권의 채권자가 되는 것에 동의합니다. 단, 제1항의
    		재화 등의 대금은 통신사의 휴대폰 이용요금 청구시 함께 청구될 예정이며, 이용자가 휴대폰 요금과 함께
    		위 재화 등의 대금을 통신사에 납부할 경우 회사는 이용자가 회사에 대하여 위 대금채무를 이행한 것으로
    		보게 됨을 알려드립니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    	<p>
    		<font class="tl">제20조 약관 외 준칙 및 관할</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
    		</p><ol>
    		<li>
    		본 약관에 명시되지 아니한 사항 또는 약관 해석상 다툼이 있는 경우에는 관련 법령 및 일반 상관례에 따릅니다.<br><br>
    		</li>
    		<li>
    		회사와 이용자 간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.<br><br>
    		</li>
    		</ol>
    	<p></p>
    </div>
    	<div class="pl">

    	<p>
    		<font class="tl">부 칙</font><br>
    		<img class="bar" src="/imagesv2/common/bar_underline.gif" alt=""><br>
			이 약관은 2021년 01월 01일부터 시행한다.
    	</p>
  		  <a class="btn btn-primary" href="/report/closeForm" role="button">확인</a>
    	</div>



		</form>


    </div>


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
		<!-- 구글 -->
	    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

</body>
</html>