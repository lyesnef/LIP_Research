<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<style>
/* Main */
#menu {
	width: 97%;
	margin: 0px 0px 10px 0px;
	padding: 10px 0px 0 0;
	list-style: none;
	background: #111;
	background: -moz-linear-gradient(#444, #111);
	background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #111),
		color-stop(1, #444) );
	background: -webkit-linear-gradient(#444, #111);
	background: -o-linear-gradient(#444, #111);
	background: -ms-linear-gradient(#444, #111);
	background: linear-gradient(#444, #111);
	-moz-border-radius: 50px;
	border-radius: 50px;
	-moz-box-shadow: 0 2px 1px #9c9c9c;
	-webkit-box-shadow: 0 2px 1px #9c9c9c;
	box-shadow: 0 2px 1px #9c9c9c;
}

#menu li {
	float: left;
	padding: 0 0 10px 0;
	position: relative;
}

#menu a {
	float: left;
	height: 25px;
	padding: 0 25px;
	color: #999;
	text-transform: uppercase;
	font: bold 12px/25px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}

#menu li:hover>a {
	color: #fafafa;
}

* html #menu li a:hover { /* IE6 */
	color: #fafafa;
}

#menu li:hover>ul {
	display: block;
}

/* Sub-menu */
#menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: none;
	position: absolute;
	top: 35px;
	left: 0;
	z-index: 99999;
	background: #444;
	background: -moz-linear-gradient(#444, #111);
	background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #111),
		color-stop(1, #444) );
	background: -webkit-linear-gradient(#444, #111);
	background: -o-linear-gradient(#444, #111);
	background: -ms-linear-gradient(#444, #111);
	background: linear-gradient(#444, #111);
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#menu ul li {
	float: none;
	margin: 0;
	padding: 0;
	display: block;
	-moz-box-shadow: 0 1px 0 #111111, 0 2px 0 #777777;
	-webkit-box-shadow: 0 1px 0 #111111, 0 2px 0 #777777;
	box-shadow: 0 1px 0 #111111, 0 2px 0 #777777;
}

#menu ul li:last-child {
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}

#menu ul a {
	padding: 10px;
	height: auto;
	line-height: 1;
	display: block;
	white-space: nowrap;
	float: none;
	text-transform: none;
}

*:first-child+html #menu ul a { /* IE7 */
	height: 10px;
	width: 150px;
}

#menu ul a:hover {
	background: #0186ba;
	background: -moz-linear-gradient(#04acec, #0186ba);
	background: -webkit-gradient(linear, left top, left bottom, from(#04acec),
		to(#0186ba) );
	background: -webkit-linear-gradient(#04acec, #0186ba);
	background: -o-linear-gradient(#04acec, #0186ba);
	background: -ms-linear-gradient(#04acec, #0186ba);
	background: linear-gradient(#04acec, #0186ba);
}

#menu ul li:first-child a {
	-moz-border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0;
}

#menu ul li:first-child a:after {
	content: '';
	position: absolute;
	left: 30px;
	top: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 8px solid #444;
}

#menu ul li:first-child a:hover:after {
	border-bottom-color: #04acec;
}

#menu ul li:last-child a {
	-moz-border-radius: 0 0 5px 5px;
	-webkit-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;
}

/* Clear floated elements */
#menu:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

* html #menu {
	zoom: 1;
} /* IE6 */
*:first-child+html #menu {
	zoom: 1;
} /* IE7 */
#menu ul li:first-child a:after {
	content: '';
	position: absolute;
	left: 30px;
	top: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 8px solid #444;
}

#menu ul li:first-child a:hover:after {
	border-bottom-color: #04acec;
}

#header {
	height: 122px;
	width: 900px;
	margin-left: 23px;
	margin-top: 18px;
}

.header-link {
	float: right;
margin-left: 7px;
margin-top: 51px;
}
</style>

<div id="header">
	<a href="/LIP_Research" title="메인으로"><img src="/LIP_Research/images/common/titleimg.png" /></a>
	<a href="" class="header-link"><img alt="" src="/LIP_Research/images/common/lip.png" title="LIP소개" width="50" height="65"></a>
	 
    <!-- 로그인전 상태면 회원가입 / 로그인 출력 -->
    <s:if test="#session.lipMember == null">
	<a href="/LIP_Research/jsp/user/access/login.jsp" class="header-link" ><img alt="" src="/LIP_Research/images/common/login.png" title="로그인" width="50" height="66"></a>
	<a href="JoinAction.action" class="header-link"><img alt="" src="/LIP_Research/images/common/join.png" title="회원가입" width="50" height="55"></a>
	</s:if>
	 
	 <!-- 로그인된 상태면 내정보 / 로그아웃 출력 -->
	<s:if test="#session.lipMember != null">
    <a href="LogoutAction.action" class="header-link"><img alt="" src="/LIP_Research/images/common/logout.png" title="로그아웃" width="50" height="65"></a>
    <a href="MyInfo.action" class="header-link"><img alt="" src="/LIP_Research/images/common/info.png" title="나의정보" width="50" height="65"></a>
    </s:if>
	
</div>
<ul id="menu">
	<li><a href="/LIP_Research">Home</a></li>
	<li><a href="#">Hot Poll</a>
		<ul>
			<li><a href="/LIP_Research/poll/OngoingPoll.action">진행중인 폴</a></li>
			<li><a href="/LIP_Research/EventPoll.action">이벤트 폴</a></li>
			<li><a href="/LIP_Research/poll/FinishedPoll.action">지난 폴</a></li>
		</ul></li>
	<li><a href="#">Hot Survey</a>
		<ul>
			<li><a href="/LIP_Research/survey/OnGoingSurvey.action">진행중인 서베이</a></li>
			<li><a href="/LIP_Research/survey/ResultSurveyList.action">서베이 결과</a></li>
		</ul></li>
	<li><a href="#">Hot Press</a>
		<ul>
			<li><a href="/LIP_Research/News.action">Hot New</a></li>
		</ul></li>
	<li><a href="#">My Point</a>
		<ul>
			<li><a href="/LIP_Research/point/MyPointInfo.action"> My Point </a></li>

		</ul></li>
	<li><a href="/LIP_Research/Notice.action">Contact</a>
    		<ul>
    			<li><a href="/LIP_Research/Notice.action">공지사항</a></li>
    			<li><a href="/LIP_Research/Faq.action">자주묻는질문</a></li>
    			<li><a href="/LIP_Research/Qna.action">Q&A</a></li>
    			<li><a href="#">LIP 소개</a></li>
    		</ul>
    </li>
</ul>
