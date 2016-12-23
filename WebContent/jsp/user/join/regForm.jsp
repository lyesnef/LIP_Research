<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Join To Like It Perfectly</title>
<link media="screen" type="text/css" href="/LIP_Research/css/style.css" rel="stylesheet">
<!-- css -->
<link media="screen" type="text/css" href="/LIP_Research/css/join.css" rel="stylesheet">
<!-- jQuery 1.4.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
<!--  <script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script> -->
<!-- sliding form -->
<script src="/LIP_Research/js/user/join/sliding.form.js" type="text/javascript"></script>
<!-- calendar -->
<link type="text/css" href="/LIP_Research/images/join/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.core.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker-ko.js"></script>
<script type="text/javascript">
var emailValue;
var currentYear = new Date().getYear() + 1900;

$(document).ready(function() {

	$('#datepicker').datepicker({
		changeMonth: true,	changeYear: true,
		yearRange: '1900:'+currentYear,
		onClick: 'button', buttonImage: '/LIP_Research/images/join/datepicker.gif', buttonImageOnly: true,
		// buttonText:'선택',
		altField: '#datepicker', altFormat: 'yy-mm-dd',
		defaultDate: '+0m+0d', maxDate: '+0d'
	});		
});

function emailAgree(){
	var checkVal = document.getElementById('agreeMail');
	if(checkVal.checked == true){
		checkVal.value='true';
	}else{
		checkVal.value='false';
	}
}

function joinMember(){
	var birth = document.getElementById('datepicker');
	if(birth != null || birth != ""){
		var form = document.formElem;
		form.action = "SuccessJoin.action";
		form.submit();
	}
}


</script>
<style type="text/css">
span.reference {
	position: fixed;
	left: 5px;
	top: 5px;
	font-size: 10px;
	text-shadow: 1px 1px 1px #fff;
}

span.reference a {
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
}

span.reference a:hover {
	color: #000;
}

h1 {
	color: #ccc;
	font-size: 36px;
	text-shadow: 1px 1px 1px #fff;
	padding: 20px;
}
</style>
</head>
<body>
<!-- menubar -->
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />

	<div id="content">
		<h1>Join to Like It Perfectly</h1>
		<div id="wrapper">
			<div id="steps" style="width: 3000px;">
				<form id="formElem" method="post" name="formElem">				
					<fieldset class="step">
						<legend>약관동의</legend>
						<p><b>LIP 이용약관, 개인정보 수집항목, 목적 및 이용안내</b></p>
						<p align="left">
							<br /> ① 본 약관은 회원이 LIP 주식회사가 제공하는 리서치 서비스를 이용함에 있어 제반 권<br/>&nbsp;&nbsp;&nbsp;&nbsp;리 의무와 관련절차 등을 규정함을 목적으로 합니다.<br/>
							② 정회원으로 가입하고자하는 고객은 LIP 홈페이지에서 본 약관에 동의 후 본인확인<br/>&nbsp;&nbsp;&nbsp;&nbsp;및 본인 정보 입력을 함으로써 정회원 가입을 신청합니다. <br/>
							③ 본 약관에서 정하지 않은 사항과 본 약관의 해석에 관하여는 대한민국법 및 상관례<br/>&nbsp;&nbsp;&nbsp;&nbsp;에 따릅니다. <br/>
							④ 회사는 적법하고 공정한 수단에 의하여 회원님의 개인정보를 수집하고 있습니다.<br/>
							⑤ 이 사항에 동의하지 않은 경우에는 정회원 서비스를 이용하실 수 없습니다.<br />
							<br/>
						</p>
						<p>
							<input type="radio" value="agree" id="agreement" name="agreement"/>동의함 
							<input type="radio" value="" id="agreement" name="agreement"/>동의안함
							<br/><font color="red">${fieldErrors.result}</font>
						</p>
					</fieldset>
					<fieldset class="step">
						<legend>계정정보</legend>
						<p>
							<label for="userid">아이디</label> 
							<input id="userid" name="userid" placeholder="ID는 영문,숫자 6~12자 입니다."/>
							<button id="idcheck" style="width:130px;height:30px;font-size:10px;display:inline;">중복확인</button>
							<input type="hidden" id="idHidden" name="idHidden" value="">
						</p>
						<p>
							<label for="pw">비밀번호</label> <input id="pw" type="password" autocomplete="OFF" name="pw" placeholder="패스워드는 8~12자 입니다."/>
						</p>
						<p>
							<label for="repw">비밀번호확인</label>
							<input id="repw" type="password"  autocomplete="OFF" name="repw" placeholder="비밀번호와 동일하게 작성하세요."/>
						</p>
						<p>
							<input type="hidden" name="emailVal" id="emailVal"/>
							<label for="email">이메일</label> <input id="email" type="email"
								autocomplete="OFF" placeholder="UserId@LIP.com" name="email" required/>
							<button id="emailConfirm" style="width:130px;height:30px;font-size:10px;display:inline;">인증메일발송</button>
						</p>
						<p>
							<label for="confirmCheck">인증번호</label>
							<input id="confirmCheck" name="confirmCheck" placeholder="발송된 인증번호를 넣어주세요."/>
						</p>
					</fieldset>
					<fieldset class="step">
						<legend>회원정보</legend>
						<p>
							<label for="mobileco">휴대폰번호</label>
							<select id="mobileco" name="mobileco" style="width:80px;background-color: rgb(255, 255, 255);">
								<option selected value="">통신사</option>
								<option value="SKT">SKT</option>
								<option value="KTF">KTF</option>
								<option value="LGT">LGT</option>
							</select>
							<select  id="firstnum" name="firstnum" style="width:70px;background-color: rgb(255, 255, 255);">
								<option selected value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<label style="display:inline;width:10px;text-align:center; float:left;margin-right:0px;">-</label>
							<input id="secondnum" name="secondnum" type="text" style="width:70px;"/>
							<label style="display:inline;width:10px;text-align:center; float:left;margin-right:0px;">-</label>
							<input id="lastnum" name="lastnum" type="text" style="width:70px;"/>
						</p>
						<p>
							<input type="hidden" name="postcodeVal" id="postcodeVal"/>
							<label for="postcode">우편번호</label>
							<input type="hidden" name="postNumber" id="postNumber" value=""/>
							<input id="postcode1" name="postcode1" style="width:70px;" disabled="disabled"/>
							<label style="display:inline;width:10px;text-align:center; float:left;margin-right:2px;">-</label>
							<input id="postcode2" name="postcode2" style="width:70px;" disabled="disabled"/>
							<button id="postcode" style="width:130px;height:30px;font-size:10px;display:inline;">우편번호</button>
						</p>
						<p>
							<label for="postBasic">기본주소</label>
							<input id="postBasic" name="postBasic" style="width:300px"  placeholder="우편번호를 검색하시면 입력됩니다." disabled="disabled"/>
						</p>
						<p>
							<label for="detailaddress">상세주소</label>
							<input id="detailaddress" name="detailaddress" style="width:300px" placeholder="상세주소를 입력해주세요."/>
						</p>
					</fieldset>
					<fieldset class="step">
						<legend >기타정보</legend>
						<p align="left">
							<label for="gender">성별</label>
							<input style="height:25px;vertical-align:middle;margin-left:0px;" type="radio" id="gender" name="gender" value="male"/>남성
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input style="height:25px;vertical-align:middle;" type="radio" id="gender" name="gender" value="female"/>여성
						</p>
						<p align="left" style="vertical-align:middle;">
							<label for="birth">생년월일</label>
							<input id="datepicker" type="text" name="birth" placeholder="년/월/일 옆 달력을 클릭하세요."/>
							<!-- <label style="display:inline;width:10px;text-align:left; float:left;margin-right:0px;">&nbsp;년</label> -->
						</p>
						<p>
							<label for="recommend">추천인 아이디</label>
							<input id="recommend" name="recommend" placeholder="추천인 아이디 입력하세요."/>
						</p>
						<p>
							<input style="width:40px;height:25px;vertical-align:middle;" type="checkbox" id="agreeMail" name="agreeMail" value="false" onchange="emailAgree()"/>
							<label style="display:inline;width:200px;text-align:left; float:left;margin-right:0px;">메일 수신에 동의합니다.</label>
						</p>
					</fieldset>
					<fieldset class="step">
						<legend>가입완료</legend>
						<p>
							<b>가입을 원하시면 버튼을 눌러주세요.</b>
						</p>
						<p class="submit">
							<button id="registerButton">가입하기</button>
						</p>
					</fieldset>
				</form>
			</div>
			<div id="navigation" style="display:none;">
				<ul>
					<li class="selected"><a href="#">약관동의</a></li>
					<li><a href="#">계정정보</a></li>
					<li><a href="#">회원정보</a></li>
					<li><a href="#">기타정보</a></li>
					<li><a href="#">가입완료</a></li>
				</ul>
			</div>
		</div>
	</div>

<!-- footer -->
<jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>