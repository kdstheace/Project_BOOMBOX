<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- pay Start -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- pay End-->
<%--
 buyer_email : ${user.user_email },
    buyer_name : ${user.user_name },
    buyer_tel :  ${user.user_phone },
    buyer_addr :  ${user.user_address },
    buyer_postcode :  ${user.user_zip }, --%>

<script>
IMP.init('imp02837838');

IMP.request_pay({
    pg : 'inicis',
    pay_method : 'card',
    merchant_uid : 'BoomBox' + new Date().getTime(),
    name : 'BoomBox MemberShip',
    amount : 100,
    buyer_email : '${user.user_email }',
    buyer_name : ' ${user.user_name }',
    buyer_tel : '${user.user_phone }',
    buyer_addr : '${user.user_address }',
    buyer_postcode : ' ${user.user_zip }',
    m_redirect_url : 'http://localhost:8888/membership/membershipForm'
}, function(rsp) {
    if ( rsp.success ) {

		console.log(rsp);
        var msg = '결제가 완료되었습니다.';

        msg += '결제 금액 : ' + rsp.paid_amount;

        msg += '카드 승인번호 : ' + rsp.apply_num;

        alert(msg);

/*         location.href="/membership/paySuccessForm";  */
        location.href="/membership/paySuccess?membership_price="+rsp.paid_amount;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
	    alert(msg);
	    location.href="/membership/membershipForm";
    }
});

</script>
<script>
var Iamport = require('iamport');
var iamport = new Iamport({
  impKey: '자신의_API_키',
  impSecret: '자신의_APIscret_키'
});

app.get('/payments/status/all',(req,res)=>{
    iamport.payment.getByStatus({
      payment_status: 'paid'
    }).then(function(result){
        res.render('payments_list',{list:result.list});
    }).catch(function(error){
        console.log(error);
        red.send(error);
    })
});


</script>
<body>


</body>
</html>