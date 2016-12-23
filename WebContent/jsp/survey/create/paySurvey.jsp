<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<meta charset="utf-8">
<title></title>
</head>

<body>
 <jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
  <div id="body-section">
  	<div align="center">
			<h1>설문조사를 만들었습니다.</h1>
			<h4>LIP_Research를 이용해주셔서 감사합니다.</h4>
		</div>
		<div align="center"><h3>광고를 원하시면 LIP@lip.com으로 연락주세요.</h3></div>
		<div align="center">
			<s:if test='%{message == 1}'>
				<img width="400" height="300" src="/LIP_Research/images/join/1.jpg"/>
			</s:if>
			<s:elseif test='%{message == 2}'>
				<img width="400" height="300" src="/LIP_Research/images/join/2.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 3}'>
				<img width="400" height="300" src="/LIP_Research/images/join/3.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 4}'>
				<img width="400" height="300" src="/LIP_Research/images/join/4.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 5}'>
				<img width="400" height="300" src="/LIP_Research/images/join/5.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 6}'>
				<img width="400" height="300" src="/LIP_Research/images/join/1.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 7}'>
				<img width="400" height="300" src="/LIP_Research/images/join/2.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 8}'>
				<img width="400" height="300" src="/LIP_Research/images/join/3.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 9}'>
				<img width="400" height="300" src="/LIP_Research/images/join/4.jpg"/>
			</s:elseif>
			<s:elseif test='%{message == 0}'>
				<img width="400" height="300" src="/LIP_Research/images/join/5.jpg"/>
			</s:elseif>
		</div>
  
  </div>
 <jsp:include page="/jsp/common/banner/banner.jsp" />
 <jsp:include page="/jsp/common/footer/footer.jsp" />

</body>
</html>