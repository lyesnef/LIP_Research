<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Make Survey</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
var peopleNum = 0;
var questionNum = 0;
var price = 0;
function plusPeople(){
	var textPeople = document.getElementById('limitParticipateNumber');
	if(textPeople.value == 10000){
		alert("인원은 10000명 이상일 수 없습니다.");
	}else{
		peopleNum = peopleNum + 100;
		textPeople.value = peopleNum;
		totalPrice();
	}
}
function minusPeople(){
	var textPeople = document.getElementById('limitParticipateNumber');
	if(textPeople.value == 0){
		alert("인원은 0명 이상 입니다.");
	}else{
		peopleNum = peopleNum - 100;
		textPeople.value = peopleNum;
		totalPrice();
	}
}
function plusQue(){
	var queNum = document.getElementById('questionCount');
	if(queNum.value == 20){
		alert("문항수는 20이하 입니다.");
	}else{
		questionNum = questionNum + 1;
		queNum.value = questionNum;
		totalPrice();
	}
}
function minusQue(){
	var queNum = document.getElementById('questionCount');
	if(queNum.value == 0){
		alert("문항수는 0이상 입니다.");
	}else{
		questionNum = questionNum - 1;
		queNum.value = questionNum;
		totalPrice();
	}
}
function totalPrice(){
	var textPrice = document.getElementById('price');
	price = (questionNum*200)*peopleNum;
	textPrice.value = price;
	
}
function createSur(){
	var title = document.getElementById('surveyTitle');
	if(questionNum == 0){
		alert("문항수를 선택해주세요.");
		return false;
	}else if(peopleNum == 0){
		alert("인원수를 선택해주세요.");
		return false;
	}else if(title.value == ''){
		alert("설문조사의 제목을 입력해주세요.");
		return false;
	}else{
		var myform = document.formSurvey;
		myform.action = "SetBasicInfoTarget.action";
		myform.submit();
	}
	
}
/* $(function(){
	$("#formSurvey").submit(function(){
		dataString = $("#JqAjaxForm").serialize();
		
		$.ajax({
			type: "POST",
			url: "SetBasicInfoTarget.action",
			data: dataString,
			dataType: "html",
			success: function(data) {
				alert("보내짐");
			}
		});
	});		
}); */
</script>

</head>

<body>

	<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
	

	<form id="formSurvey" name="formSurvey" method="POST">
		<div align="center">
			<h2>설문조사 만들기</h2>
			<h3>설문 조사 예상 가격 측정 페이지 입니다.</h3>
		</div>
		<div align="center">
			<img style="width:350;height:220;" alt="LIP_Research" src="/LIP_Research/images/survey/surveyMain.jpg">
		</div>
		<br/>
		<div id="divSurEx" style="margin-left: 27%">
			<p>
				<label style="width:100px" for="limitParticipateNumber">설문제목</label>
				<input type="text" style="width:400px" id="surveyTitle" name="surveyTitle"/>
			</p>
			<p>
				<label style="width:100px" for="limitParticipateNumber">인&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" style="width:200px" name="limitParticipateNumber" id="limitParticipateNumber" readonly="readonly" placeholder="버튼으로 인원을 설정해주세요."/>
				<input type="button" style="width:40px;" onclick="plusPeople()" value="&nbsp;+&nbsp;"/>
				<input type="button" style="width:40px;" onclick="minusPeople()" value="&nbsp;-&nbsp;"/>
			</p>
			<p>
				<label style="width:100px" for="questionCount">문항수&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" style="width:200px" id="questionCount" name="questionCount" readonly="readonly" placeholder="버튼으로 문항을 설정해주세요."/>
				<input type="button" style="width:40px;" onclick="plusQue()" value="&nbsp;+&nbsp;"/>
				<input type="button" style="width:40px;" onclick="minusQue()" value="&nbsp;-&nbsp;"/>
			</p>
			<p>
				<label style="width:100px" for="price">가&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" style="width:200px" name="price" id="price" readonly="readonly" placeholder="인원/문항을 선택하세요."/>
			</p>
			
		</div>
		<div align="center">
			<p>
				<input type="button" id="subBt" onclick="createSur()" value=" 설문조사 생성 "/>
			</p>
		</div>
		
	</form>
	

	
	<jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>