<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  // Handler for .ready() called.
	$('#pollStart').click(function() {
		var answer = confirm("폴을 등록하시겠습니까?")
		if(answer) {
			var hidden = document.getElementById('result');
			hidden.value = 2;
			$('#myform').submit();
		}
		
	});
	$('#pollStop').click(function() {
		var answer = confirm("중단 시키겠습니까?")
		if(answer) {
			var hidden = document.getElementById('result');
			hidden.value = 4;
			$('#myform').submit();
		}
		
	});	 
});
function selectMember()
{
    document.myform.action="/LIP_Research/master/Member.action";
    document.myform.submit();
}  

</script>

<style type="text/css">
fieldset
{ 
	
    width:800px;
    padding: 15px;
    margin: 15px auto;
    border: 1px solid #ccc;
    -moz-border-radius: 5px;
    -webkit-border-radius: 50px;
    border-radius: 5px;
    -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
}
</style>

</head>
<body>
<jsp:include page="../../common/menu_bar/user_menu.jsp" />
	<c:forEach var="poll" items="${poll }">
	<fieldset title="PollInfo" >
      <legend>상세정보</legend>
		
		<table border="1">
			<tr>
				<td>폴번호</td>
				<td>${poll.pollNumber }</td>
				<td>폴시작시간</td>
				<td><fmt:formatDate value="${poll.pollStartDate}" pattern="yyyy-MM-dd"   /></td>
				<td>폴종료시간</td>
				<td><fmt:formatDate value="${poll.pollEndDate}" pattern="yyyy-MM-dd"   /></td>
			</tr>
			<tr>
				<td>폴주제</td>
				<td colspan="5">${poll.pollQuestion }</td>

			</tr>
			<tr>
				<td>폴 부가설명</td>
				<td colspan="5">${poll.pollExplain }</td>
			</tr>
			<tr>
				<td>폴포인트</td>
				<td>${poll.pollBalancePoint }</td>
				<td>폴 카테고리</td>
				<td>${poll.categoryName }</td>
				<td>폴 작성자</td>
				<td>${poll.memberId }</td>
			</tr>
			<tr>
				<td>폴 제목 부가 설명 </td>
				<td>
				 <c:if test="${poll.pollViewType == 1 }">
				   텍스트형 설명
				 </c:if>
				 <c:if test="${poll.pollViewType == 2 }">
				   사진형 첨부
				 </c:if>
				 <c:if test="${poll.pollViewType == 3 }">
				   동영상 첨부
				 </c:if>
				</td>
				<td>폴 보기 종류</td>
				<td>
				 <c:if test="${poll.pollQuestionType == 1 }">
				   단답형
				 </c:if>
				 <c:if test="${poll.pollQuestionType == 2 }">
				  다답형
				 </c:if>
				 <c:if test="${poll.pollQuestionType == 3 }">
				   좋아요 싫어요
				 </c:if>
				 <c:if test="${poll.pollQuestionType == 4 }">
				   별점주기
				 </c:if>
 					
				</td>
				<td>보기 사진첨부 유무</td>
				<td>
				  <c:if test="${poll.exampleType == 1 }">
				   없음
				 </c:if>
				 <c:if test="${poll.exampleType == 2 }">
				  있음
				 </c:if>
				
				</td>
			</tr>
			
		</table>
	</fieldset>

		<c:if test="${(poll.pollQuestionType == 1) || (poll.pollQuestionType == 2) }">
			<fieldset title="example">
				<legend>보기상세정보</legend>
				<c:forEach var="example" items="${poll.exampleList }">
				 	
				 	${example.exampleOrder }: ${example.exampleContant } <br />
				 	<img src="${example.exampleLink }" width="100px" height="100px"/><br />

				</c:forEach>
			</fieldset>
		</c:if>

	</c:forEach>
	<fieldset title="update" >
      <legend>상태변경하기</legend>
    	<form id="myform" action="/LIP_Research/master/MaintainPoll.action" method="post">
	     <input type="hidden" id="result" name="result" value="">
	     <input type="hidden" id="result" name="pollNumber" value="${poll[0].pollNumber }">    	 
    	 <input type="button" value="등록하기" id="pollStart" > <input type="button" value="중단하기" id="pollStop"> <input type="submit" value="돌아가기">
    	</form>
    </fieldset>
 <jsp:include page="../../common/footer/footer1.jsp" />
</body>
</html>