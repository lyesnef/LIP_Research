<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">

<style type="text/css">
.finishedPoll {
margin: 10px 0;
padding: 8px 8px 0;
background: #E6F1F6;
border: 1px solid #C5D5DD;
border-radius: 4px;
}

</style>

</head>

<body>

	<jsp:include page="../common/menu_bar/user_menu.jsp" />

	<div id="body-section"> 
	 
	 <div class="finishedPoll">
	 지난폴리스트
	 </div>
	<c:forEach var="poll" items="${polls }">
	
	<div class="finishedPoll" id="${poll.pollNumber}poll" onclick="alert('d'); location.href='/LIP_Research/poll/ResultPoll.action?pollNumber=${poll.pollNumber }'">
	 폴넘버 ${poll.pollNumber }
	   폴질문${poll.pollQuestion }

	    ${poll.pollExplain }
	     폴시작${poll.pollStartDate }
	    폴끝  ${poll.pollEndDate }
	 
	  </div>     
	
	</c:forEach>
	
	</div>
	<jsp:include page="../common/banner/banner.jsp" />
	
	<jsp:include page="../common/footer/footer.jsp" />
</body>
</html>