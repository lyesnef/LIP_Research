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
fieldset
{
    width:800px;
    padding: 15px;
    margin: 15px;
    border: 1px solid #ccc;
    -moz-border-radius: 5px;
    -webkit-border-radius: 50px;
    border-radius: 5px;
    -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script> -->
<script type="text/javascript" src="/LIP_Research/js/common/ik/quickpager2.jquery.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	  // Handler for .ready() called.

	 $(".pageme tbody").quickPager( {
		pageSize: 11,
		naviSize: 5,
		currentPage: 1,
		holder: ".pager"
	});
	  
	  $('input[name$="con_button"]').click(function() {
		
	    /* alert(this.value);
	    alert(parseInt(this.name)); */
		document.getElementById('search').value = parseInt(this.name);
		
		var myform = document.getElementById('myform');
		  myform.submit();
	    /* 
		$.post("/LIP_Research/master/ChangePollsCondition.action", { "message" : this.value, "result": parseInt(this.name) },
				   function(data) {
				     //alert("Data Loaded: " + data);
				  $('#poll_info').html(data);   
		   }); */
	});
});
</script>
<style type="text/css">

p {
	background: #e5e5e5;
	margin-bottom:1px;
	margin-top:0px;
}

ul.paging li {
    padding: 10px;
    background: #83bd63;
    font-family: georgia;
    font-size: 24px;
    color: #fff;
    line-height: 1;
    width: 180px;
    margin-bottom: 1px;
}

ul.pageNav li{
    display:block;
    floaT: left;
    padding: 3px;
    font-family: georgia;
}

ul.pageNav li a{
    color: #333;
    text-decoration: none;
}

li.currentPage {
	background: red;
        background: #83bd63;	
}

ul.pageNav li.currentPage a {
	color: #fff;	
}

table.pageme {
    border-collapse: collapse;
    border: 1px solid #ccc;
}  

table.pageme td {
    border-collapse: collapse;
    border: 1px solid #ccc;
}      

table, div {
	display:block;
	clear: both
}
</style>
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/master_menu.jsp" />
<div id="master-body-section">
   <p align="center">
    
   <fieldset title="검색" >
     <legend>검색</legend>
       <form id="myform" method="get" action="/LIP_Research/master/ChangePollsCondition.action">
       	<input type="button" value="대기중인 폴 보기" name="1con_button" />
       	<input type="button" value="진행중인 폴 보기" name="2con_button" />
       	<input type="button" value="종료된 폴 보기" name="3con_button" />
       	<input type="button" value="중단된 폴 보기" name="4con_button" />
       	<input type="hidden" value="0" name="search" id="search">
       </form>
   </fieldset>
  <div id="poll_info"> 
     <fieldset>
        <legend>대기 중인 폴 리스트</legend>
          <table class="pageme">
           <tbody>
			<c:set var="i" value="1"/>
			<c:forEach var="poll" items="${polls }">
              <c:if test="${ i % 10 == 1}">
              <tr>
                <th width="40" >번호</th>
                <th width="300" >폴제목</th>
                <th width="80" >카테고리</th>
                <th width="30" >상태</th>
                <th width="50" >아이디</th>
                <th width="" >폴포인트</th>
                <th width="40" >시작시간</th>
                <th width="" >종료시간</th>
              </tr>
              </c:if>
               <tr>
               	<th align="center">${poll.pollNumber }</th>
               	<td align="center"><a href="/LIP_Research/master/SearchPoll.action?pollNumber=${poll.pollNumber }">${poll.pollQuestion }</a></td>
               	<td align="center">${poll.categoryName }</td>
               	<td align="center">${poll.pollCondition }</td>
               	<td align="center">${poll.memberId }</td>
               	<td align="center">${poll.pollBalancePoint }</td>
               	<td align="center"><fmt:formatDate value="${poll.pollStartDate}" pattern="yyyy-MM-dd"   /></td>
               	<td align="center"><fmt:formatDate value="${poll.pollEndDate}" pattern="yyyy-MM-dd"   /></td>
               </tr>
			 <c:set var="i" value="${ i+1}"></c:set>
			</c:forEach>
           </tbody>
           </table>
        <div class="pager"></div>
      </fieldset>
    </div>
   </div>
   <jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>

