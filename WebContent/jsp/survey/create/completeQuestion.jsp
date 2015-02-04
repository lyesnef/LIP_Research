<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
.thisLabel{
	position:relative;
    text-align:left;
    background-color:#f0f0f0;
    color:#666;
    text-align:center;
    font-size:15px;
    text-shadow:1px 1px 1px #fff;
    font-weight:bold;
    width:100%;
    padding:5px 0px 5px 10px;
    margin:2px 1px 5px 1px; 
    border-bottom:1px solid #fff;
    border-top:1px solid #d9d9d9;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#paymentSurveyBt').click(function(){
		if(!confirm("기본 설정 인원과 대상인원이 같지 않습니다. 계속 하시겠습니까?")){
			alert("설문 만들기를 취소하셨습니다.");
		}else{
			var myform = document.getElementById('formSurvey');
			var queCnt = document.getElementsByName('queCnt');
			var hiddenQueCnt = document.getElementById('hiddenQueCnt');
			hiddenQueCnt.value = queCnt.length;
			myform.action = "PaySurvey.action";
			myform.submit();
		}
	});
});
</script>
</head>
<body>
	<label class="thisLabel">결제 금액 : ${totalPayment}포인트</label>
	/<label class="thisLabel">사용가능 포인트 : <s:property value="#session.lipMember.memberPoint"/></label><br/><br/>
	<input type="hidden" id="paymentTotal" name="paymentTotal" value="${totalPayment}"/>
	<input type="hidden" id="pointLimit" name="pointLimit" value="${totalPayment}"/>
	<input type="button" id="paymentSurveyBt" value=" 결제하기 "/>
	<input type="hidden" id="hiddenQueCnt" name="hiddenQueCnt" value="0"/>
</body>
</html>