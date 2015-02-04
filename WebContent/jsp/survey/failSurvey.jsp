<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
</head>

<body>
    <jsp:include page="../common/menu_bar/user_menu.jsp" />
      
      <div id="body-section">
        <center>
        <br/><br/>
        <img alt="" src="/LIP_Research/images/survey/sorry.jpg" title="서베이종료" width="600"><br/>
        ${message}
        <br/><br/><br/>
        <a href="/LIP_Research" id="back">메인으로 돌아가기</a>
        </center>
      </div> 
        
    <jsp:include page="../common/banner/banner.jsp" />
     <jsp:include page="../common/footer/footer.jsp" />
</body>
</html>