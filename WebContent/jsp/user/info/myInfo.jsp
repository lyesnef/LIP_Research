<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<!--[if IE 9]><html lang="ko" class="no-js modern ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="ko" class="no-js modern"><!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<title>Member Info</title>
<!--[if lte IE 9]><script src="include/js/libs/CFInstall.min.js"></script>
<script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})});</script><![endif]-->
<!--[if IE 6]><script src="/LIP_Research/js/user/info/DD_belatedPNG.min.js"></script>
<script>DD_belatedPNG.fix('.png_bg, img');</script><![endif]-->
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<link href="http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb" rel="stylesheet" />
<link rel="stylesheet" href="/LIP_Research/include_tab/css/style.css" />
<link rel="stylesheet" href="/LIP_Research/include_tab/css/tabs.css" />
<link rel="stylesheet" href="/LIP_Research/include_button/css/buttons.css" />
<script src="/LIP_Research/include_tab/js/libs/modernizr.min.js"></script>
<script src="/LIP_Research/include_tab/js/libs/jquery.min.js"></script>
<script src="/LIP_Research/include_tab/js/jquery.tabs.js"></script>
<script src="/LIP_Research/include_tab/js/tab_design.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/LIP_Research/include_button/js/buttons.js"></script>
<script type="text/javascript">
function participatePoll(){
	jQuery.ajax({
		type:"POST",
		url:"MyParticipatePoll.action",
		data: "",
		success:function(msg){
			$("#participateView").empty().append(msg);
		}, error: function(xhr,status,error){
			alert(error);
		}
	});
}
function participateSurvey(){
    jQuery.ajax({
        type:"POST",
        url:"MyParticipateSurvey.action",
        data: "",
        success:function(msg){
            $("#participateView").empty().append(msg);
        }, error: function(xhr,status,error){
            alert(error);
        }
    });
}
function makedSurvey(){
    jQuery.ajax({
        type:"POST",
        url:"MySurvey.action",
        data: "",
        success:function(msg){
            $("#participateView").empty().append(msg);
        }, error: function(xhr,status,error){
            alert(error);
        }
    });
}
function makedPoll(){
    jQuery.ajax({
        type:"POST",
        url:"MyPollInfo.action",
        data: "",
        success:function(msg){
          
        	$("#participateView").empty().append(msg);
        }, error: function(xhr,status,error){
            alert(error);
        }
    });
}
function changeImage(){
	window.open("/LIP_Research/jsp/user/info/changeImage.jsp", "postSearchPage", "width=420, height=200, All=no");
	return false;
}
function postFind(){
	window.open("/LIP_Research/jsp/user/join/postSearch.jsp", "postSearchPage", "width=420, height=600, All=no");
	return false;
}
function modifyForm(){
	var pwVal = document.getElementById('userPW');
	var repwVal = document.getElementById('userRepw');
	if (pwVal.value.length > 7 && pwVal.value.length < 13) {
		var strPW = pwVal.value;
		var splitPW = strPW.split('');
		var cntPW = 0;
		for ( var i = 0; i < pwVal.value.length; i++) {
			if (isNaN(splitPW[i])) {
				cntPW++;
			}
		}
		if (cntPW == pwVal.value.length || cntPW == 0) {
			alert('비밀번호는 영문, 숫자 혼합으로만 만들 수 있습니다.');
			return false;
		}
	}else if (pwVal.value.length>0 && pwVal.value.length < 8 || pwVal.value.length > 12) {
		
		alert('비밀번호는 8~12자 입니다.');
		return false;
	}
	if (pwVal.value != repwVal.value) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	alert("정보수정");
	var myform = document.formElem;
	myform.action = "MyInfoModify.action";
	myform.submit();
}
function agreeChange(){
	var checkVal = document.getElementById('mailAgree');
	var hiddenVal = document.getElementById('agreeMail');
	if(checkVal.checked == true){
		hiddenVal.value='true';
	}else{
		hiddenVal.value='false';
	}
}
function successMail(){
	   document.myform.action="/LIP_Research/master/member/SuccessEmail.action";
	   document.myform.mehtod="post";
	  document.myform.submit(); 
}
</script>
<style type="text/css">

.makepoll{
 padding: 0;
}

.information{
	position:relative;
    text-align:left;
    background-color:#f0f0f0;
    color:#666;
    font-size:18px;
    text-shadow:1px 1px 1px #fff;
    font-weight:bold;
    float:left;
    width:97%;
    padding:5px 0px 5px 10px;
    margin:2px 1px 5px 1px; 
    border-bottom:1px solid #fff;
    border-top:1px solid #d9d9d9;
}
.infolabel{
	float:left;
	height:25px;
	vertical-align:middle;
	margin:5px 0px 0px 5px;
}

.inputBox{
	height:15px;
	margin-left:50px;
}
#participateView{
    padding:10px;
    overflow: scroll;
    overflow-x:hidden;
    overflow-y:hidden;
    height: 550px;
    width: 590px;
}


</style>
</head>
<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
<div id="body-section">
	<div id="page-wrap">
		<!-- <h1 style="height:20px">내 정보 보기<span>My Info View</span></h1> -->
		<div id="tab_design">
			<nav class="tab_menu clearfix">
				<ul>
					<li>
						<a href="#myinfo">
							<img alt="" src="/LIP_Research/images/common/u_name.png"/>내정보
						</a>
					</li>
					<li>
						<a href="#participate">
							<img alt="" src="/LIP_Research/images/common/u_site.png"/>참여정보
						</a>
					</li>
					<li>
						<a href="#invite">
							<img alt="" src="/LIP_Research/images/common/u_email.png"/>친구초대
						</a>
					</li>
				</ul>
			</nav><!-- tab_menu -->
			<div class="tab_contents">
				<ul>
					<li id="myinfo">
					<form id="formElem" name="formElem" action="#" method="post">
						 <s:if test="#session.lipMember.memberImage!=null">
                
               <img alt="" src="/LIP_Research/ReadImage.action?imgName=<s:property value="#session.lipMember.memberImage"/>" title="나의정보" width="158" height="150" align="middle" hspace="5">
               
                </s:if>
                <s:else>
                	<s:if test="#session.lipMember.genderNumber==1">
                		<img alt="" src="/LIP_Research/images/common/member/default1.gif" title="나의정보" width="158" height="150" align="middle" hspace="5">
                	</s:if>
                	<s:elseif test="#session.lipMember.genderNumber==2">
                		<img alt="" src="/LIP_Research/images/common/member/default_woman.jpg" title="나의정보" width="158" height="150" align="middle" hspace="5">
                	</s:elseif>
                </s:else>
						<a style="position:absolute;margin-top:160px;margin-left:-130px;height:7px;padding-top:7px;" class="button yellow medium ani rounder" onclick="changeImage()">이미지변경</a>
						<!-- <h3>내정보</h3> -->
						<div style="margin-left: 140px">
							<fieldset class="info">
								<legend class="information">기본정보</legend>
								<p>
									<label class="infolabel">아&nbsp;이&nbsp;디&nbsp;&nbsp;&nbsp;</label>
									<input type="text" id="userid" name="userid" disabled="disabled" value="<s:property value="lipMember.memberId"/>" style="width:200px;" class="inputBox"/>
								</p>
								<p>
									<label class="infolabel">이&nbsp;메&nbsp;일&nbsp;&nbsp;&nbsp;</label>
									<input type="text" id="userEmail" name="userEmail" disabled="disabled" value="<s:property value="lipMember.memberEmail"/>" style="width:200px;" class="inputBox"/>
								</p>
								<p>
									<label class="infolabel">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;</label>
									<input type="text" id="userGender" name="userGender" disabled="disabled" value="<s:if test='lipMember.genderNumber==1'>남성</s:if><s:else>여성</s:else>" style="width:200px;" class="inputBox"/>
								</p>
								<p>
									<label class="infolabel">생년월일&nbsp;&nbsp;</label>
									<input type="text" id="userBirth" name="userBirth" disabled="disabled" value="<s:property value="lipMember.memberBirth"/>" style="width:200px;" class="inputBox"/>
								</p>
							</fieldset>
							
							
							<fieldset class="info">
								<legend class="information">상세정보</legend>
								<p>
									<label class="infolabel">비&nbsp;밀&nbsp;번&nbsp;호</label>
									<input type="password" style="width:200px;" id="userPW" name="userPW" class="inputBox" value=""/>
								</p>
								<p>
									<label class="infolabel">비밀번호확인</label>
									<input type="password" style="width:200px;margin-left:38px;" id="userRepw" name="userRepw" class="inputBox" value=""/>
								</p>
								<p>
									<label class="infolabel">휴대폰번호</label>
									<select id="userCellCo" name="userCellCo" style="margin-left:50px;">
										<option value="">통신사</option>
										<option <s:if test="lipMember.memberCellphoneCo=='SKT'">selected</s:if> value="SKT">SKT</option>
										<option <s:if test="lipMember.memberCellphoneCo=='KTF'">selected</s:if> value="KTF">KTF</option>
										<option <s:if test="lipMember.memberCellphoneCo=='LGT'">selected</s:if> value="LGT">LGT</option>
									</select>
									<input type="text" style="width:145px;" id="userCell" name="userCell" value="<s:property value="lipMember.memberCellphoneNumber"/>"/>
								</p>
								<p>
									<label class="infolabel">우&nbsp;편&nbsp;번&nbsp;호</label>
									<input type="text" style="width:80px;" id="postcode1" name="postcode1" class="inputBox" value='<s:property value="pc.postcode1st"/>'/>
									&nbsp;-&nbsp;
									<input type="text" style="width:80px;" id="postcode2" name="postcode2" value='<s:property value="pc.postcode2nd"/>'/>
									&nbsp;&nbsp;<a onclick="postFind()">우편번호</a>
									<input type="hidden" id="postNumber" name="postNumber" value='<s:property value="pc.postcodeNumber"/>'/>
									<input type="hidden" id="postcodeVal" name="postcodeVal" value='<s:property value="pc.postcode1st"/>' />
								</p>
								<p>
									<label class="infolabel">기&nbsp;본&nbsp;주&nbsp;소</label>
									<input type="text" style="width:200px;" id="postBasic" name="postBasic" class="inputBox" value='<s:property value="pc.postcodeAddress"/>'/>
								</p>
								<p>
									<label class="infolabel">상&nbsp;세&nbsp;주&nbsp;소</label>
									<input type="text" style="width:200px;" id="userDetailpost" name="userDetailpost" class="inputBox" value="<s:property value="lipMember.memberDetailAddress"/>"/>
								</p>
								<p>
									<label class="infolabel" style="display:inline;">메&nbsp;일&nbsp;수&nbsp;신</label>
									<input type="checkbox" id="mailAgree" name="mailAgree" value="false" onchange="agreeChange()" style="margin-left:50px;height:20px;vertical-align:middle"/>메일 수신에 동의합니다.
									<input type="hidden" id="agreeMail" name="agreeMail" value="false"/>
								</p>
								<p align="center">
									<a onclick="modifyForm()">정보수정</a>
								</p>
							</fieldset>
						</div>
						</form>
					</li>
					<li id="participate">
						<input type="hidden" id="memberId" name="memberId" value="memberNum"/>
						<div id="button_wrap" align="center">
							<a href="#" onclick="participatePoll()" class="button yellow medium ani rounder" style="height:7px;margin-top:0px;padding-top:7px;">참여한 폴</a>
							<a href="#" onclick="makedPoll()" class="button yellow medium ani rounder" style="height:7px;margin-top: 0px;padding-top: 7px;">만든 폴</a>
							<a href="#" onclick="participateSurvey()" class="button yellow medium ani rounder" style="height:7px;margin-top: 0px;padding-top: 7px;">참여한 서베이</a>
							<a href="#" onclick="makedSurvey()" class="button yellow medium ani rounder" style="height:7px;margin-top: 0px;padding-top: 7px;">만든 서베이</a>
						</div>
						<div id="participateView"></div>
					</li>
					<li id="invite">
						<img alt="" src="/LIP_Research/images/common/chat.png" width="80" height="100">
						<h3>친구초대하기</h3>
						
						<p style="">※ 친구들에게 메일을 보내세요. 메일을 수신한 친구가 회원가입 시 추천인 등록을 하면 1000포인트를 적립해드립니다.</p>
						<br><br><br><br><br><br>
						<form name="myform">
				        <table>
				            <tr valign="middle">
				                <td width="60" align="center"  style="margin:8px;padding: 15px;" > From</td>
				                <td align="left"><input type="text" name="fromEmail" id="estyle" size="60" value="<s:property value="#session.lipMember.memberEmail"/>"/></td>
				            </tr>
				            <tr valign="middle">
				                <td align="center"  style="margin:8px;padding: 15px;" > T o </td>
				                <td align="left"><input type="text" name="userEmail" size="60" id="estyle" value="${userEmail}" placeholder=" 친구 이메일을 입력하세요."/></td>
				            </tr>
				            <tr valign="middle">
				                <td align="center"  style="margin:8px;padding: 15px;" > 제 목</td>
				                <td align="left"><input type="text" name="title" size="60" id="estyle" value="LIP Reseach 회원으로 친구분이 초대하셨습니다." /></td>
				            </tr>
				            <tr valign="middle">
				                <td align="center"  style="margin:8px;padding: 15px;vertical-align: top;" > 내 용</td>
				                <td align="left">
				                <textarea name="content" cols="55" rows="10" >
 추천인 아이디 : <s:property value="#session.lipMember.memberId"/>입니다. 
 회원가입시 추천인 아이디에 입력해주세요.
 
 
				                </textarea></td>
				            </tr>
				            <tr valign="top">
				                <td>&nbsp;</td>
				                <td align="right"><input type="button" value="메일보내기" size="20" height="20" onclick="successMail()"/></td>
				            </tr>
				        </table>
				        
				        </form>
					</li>
				</ul>
			</div><!-- tab_contents -->
		</div><!-- tab_design -->
	</div><!-- page-wrap -->
</div>
<%-- <jsp:include page="/jsp/common/banner/banner.jsp" /> --%>
<jsp:include page="/jsp/common/footer/footer.jsp" />
</body>
</html>