<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
	<c:if test="${session.lipMember.memberId == null}" >
	  <c:redirect url="/jsp/user/access/login.jsp"></c:redirect>
	</c:if>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
 <script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script> 
<script type="text/javascript" src="/LIP_Research/js/common/ik/quickpager2.jquery.js"></script>
<script type="text/javascript">
/* <![CDATA[ */



$(document).ready(function() {
	  // Handler for .ready() called.
	
	 	$(".pageme tbody").quickPager( {
			pageSize: 10,
			naviSize: 5,
			currentPage: 1,
			holder: ".pager"
		});
	  
	  
	  $("#changePoint").click(function() {
		 
		     var id = document.getElementById('ejoid').value;
		     var pwd = document.getElementById('ejopw').value;
		     var point = document.getElementById('lip_point').value;
		     if(!(id && pwd)){
		      	alert('회원정보를 입력해주세요');
		     }
		     
		     if(id && pwd){
		        
		    	  if(point==="0" ){
		        	alert('포인트를 지정해 주세요');
		        	return;	
		        }
		    	    $.ajax({
		    		  type: "POST",
		    		  url: "/LIP_Research/point/ExchangePoint.action",
		    		  data: { 'id': id, 'pwd': pwd, 'point': point }
		    		}).done(function( msg ) {
		    		  	
		    			alert(msg);
		 				location.href= "/LIP_Research/point/MyPointInfo.action";
		    			
		    		}); 
		     }
		     
		});
	$("#lip_point").click(function() {
		var lip_point =  this.value;
		  var tiles_Point = document.getElementById("tiles_Point");
		  tiles_Point.innerHTML = lip_point/100;	  
		});
	});
/* ]]> */
</script>

<style type="text/css">

.tailsform {
font-size: 30;
font-family: inherit;
}
.change li span {
display: block;
color: #444;
font-size: 16px;
font-weight: bold;
}

.change li {
margin: 0 60px;
float: left;
}

.change ul {
background: url(/LIP_Research/images/point/icon_arrow.gif) no-repeat 50% 35%;
overflow: hidden;
width: 360px;
margin: 0 auto;
}

p {
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

}


</style>



</head>
 <body>
  <jsp:include page="../../common/menu_bar/user_menu.jsp" />


	<c:if test="${session.lipMember.memberId != null}" >
	<div id="body-section"> 
	   <div style="border: 1px solid #E4E4E4;padding: 20px;margin-bottom: 19px;min-height: 345px;position: relative;border-radius: 10;}">
	   <div style="width: 100%;">
	    <div style="position: relative;background: white;border: 1px solid #398AA7;padding: 17px 11px;height: 19px;margin-bottom: 13px;font-size: 26;border-radius: 10;"> 현재 보유하신 클립</div><br/>
		<img src="/LIP_Research/images/point/clip.png" style="margin-left: 220;"> <font style="font-size: 75;color: #D1726E;font-family: fantasy;">${session.lipMember.memberPoint }</font><font style="font-size: 30;">개</font>
	   </div >
	  <font>* 싸****의 아이디를 보유하신 회원님은 클립을 도토리로 교환하실 수 있습니다.</font> 
  <a href="http://203.233.196.169:8070/restful/Rest">http://203.233.196.169:8070/restful/Rest</a> 확인하러 가기
	   <div style="width: 100%;border-radius: 10; ">
	     <div style="border: 1px solid #E8E8E8;background: #F8F8F8;padding: 15px 0;text-align: center; margin: 0 30px 13px 30px;">
	     	<div class="change" >
	     		<ul>
					<li><img src="/LIP_Research/images/point/clip.png" alt="클립" width="58" height="58"> <span>100개</span></li>
					<li><img src="/LIP_Research/images/point/dotori.png" alt="도토리" width="58" height="58"> <span>1개</span></li>
				</ul>
			 </div>
			   <input type="hidden" id="nowPoint" value="${session.lipMember.memberPoint }" /><span class="presentMemberPoint"></span> <br/>
			 
			    <input type="number" id="lip_point" step="100" min="0"  max="${session.lipMember.memberPoint }" value="0">클립
			    <span id="tiles_Point" style="margin-left: 50; padding-left: 50;">0</span>도토리 <br/>
			    <font class="tailsform">ID </font><input type="text" id="ejoid" style="width: 120;height: 39px;border: none;font-size: 14px;font-weight: bold;color: white;background: #C9C9C9;">
			    <font class="tailsform">PW </font><input type="password" id="ejopw" style="width: 120;height: 39px;border: none;font-size: 14px;font-weight: bold;color: white;background: #C9C9C9;">
			    <input type="button" value="바꾸기" id="changePoint" style="width: 194px;height: 39px;border: none;font-size: 14px;font-weight: bold;color: white;background: #0A3842;padding: 12px 0; cursor: pointer;"><br />
				
	    </div> 
	   </div>
	  </div>
	   <div >
		<table border="1"  class="pageme">
		 <tbody>
		 <c:set var="i" value="1"/>
		 <c:forEach  var="pointIncome" items="${pointIncomeList }">
		  <c:if test="${ i % 9 == 1}">
		   	
		  <tr>
			<th width="40">번호</th>
			<th width="500">내역</th>
			<th width="40">적립클립</th>
			<th width="40">사용클립</th>
			<th width="80">날짜</th>
		  </tr>
		  </c:if>
		  <tr>
		    <th>${i }</th>
			<td>&nbsp;${pointIncome.pointIncomeDetail }</td>
			<td>${pointIncome.pointIncomePoint }</td>
			<td>${pointIncome.pointOutcomePoint}</td>
			<td><fmt:formatDate value="${pointIncome.pointIncomeDate }" pattern="yyyy-MM-dd"   /></td>
		  </tr>
		  <c:set var="i" value="${ i+1}"></c:set>	
		 </c:forEach>
		 </tbody>
		</table>
		<div class="pager" style="margin-left: 250;"></div>	
	   </div>
	
	</div>
	</c:if>
	
  <jsp:include page="../../common/banner/banner1.jsp" /> 
  <jsp:include page="../../common/footer/footer1.jsp" /> 
 </body>
</html>

			     