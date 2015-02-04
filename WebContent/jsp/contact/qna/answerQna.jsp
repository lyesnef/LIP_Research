<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Q&amp;A게시판 - <s:property value="qna.qnaTitle" />의 내용</title>
<link rel="stylesheet" href="/LIP_Research/css/qna_style.css">
<style type="text/css">
#qnaContant{
	margin-top:10px;
	padding:6px;
		width:573px;
		height:200px;
		resize:none;
	}
</style>
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />

	<div id="body-section"> 
<div id="table_list_11">
	  <table class="table_list_11" summary="선택한 Q&A에 대한 상세 정보 입니다.">
	<colgroup>
		<col width="100">
		<col width="230">
		<col width="100">
		<col width="360">
	</colgroup>
	<thead>
	      <tr>
	        <th scope="row" class="headline">제목</th>
	        <td colspan="7" class="headline"><s:property value="qna.qnaTitle" /></td>
          </tr>
        </thead>
		<tbody>
	

		<tr>
			<th scope="row">작성자</th>
			<td colspan="3"><s:property value="qna.member.memberId" /></td>
		</tr>

		<tr>
			<th scope="row">이메일</th>
			<td colspan="3"><s:property value="qna.member.memberEmail"/> </td>
		</tr>

		<tr>
			<th scope="row">등록일</th>
			<td><s:property value="qna.qnaDate"/></td>			
		</tr>
	
		<tr>
			<td colspan="3" class="subject"><s:property value="qna.qnaContant"/></td>
		</tr>
		
		
			
			
			
		
		</tbody>
	</table>
	<s:if test="qna.qnaAnswer==null&&#session.lipMember.memberId=='admin'">			
	<form name="myForm" action="AnswerQna.action" method="post">
	<input type="hidden" name="qna.qnaNumber" value="<s:property value="qna.qnaNumber" />" />
				<textarea id="qnaContant" name="qna.qnaAnswer"  placeholder="답변을 등록해주세요"></textarea>
	</form>			
			</s:if>
	<s:if test="qna.qnaAnswer!=null">
	
	<div id="table_list_11">
		<table class="table_list_11" summary="질문에 대한 관리자의 답변입니다.">
		<colgroup>
		<col width="100">
		<col width="230">
		<col width="100">
		<col width="360">
	</colgroup>
	
	<thead>
	      <tr>
	        <th scope="row" class="headline"  style="border-bottom-style: none;">관리자답변</th>
	        <td colspan="7" class="headline"  style="border-bottom-style: none;"><s:property value="qna.qnaAnswer" /></td>
          </tr>
        </thead>
		</table>
	</div>
	</s:if>

<!-- 게시판 하단 버튼 -->
	<div class="btn_area_r01">
		<s:if test="qna.member.memberId==#session.lipMember.memberId">
			<a class="btn_m10" href="/LIP_Research/ModifyQnaForm.action?qnaNumber=<s:property value="qna.qnaNumber"/>">수정</a>
			<a class="btn_m10" onclick="sendDelete();">삭제</a>
			
		</s:if>
			<s:if test="qna.qnaAnswer==null&&#session.lipMember.memberId=='admin'">			
				<a class="btn_m10" onclick="javascript:document.myForm.submit(); ">답변등록</a>
			</s:if>		  
			<a class="btn_m10" href="/LIP_Research/Qna.action">목록</a>
	</div>
	
</div>
</div>
	<jsp:include page="/jsp/common/banner/banner.jsp" />
	
	<jsp:include page="/jsp/common/footer/footer.jsp" />
	
	<script type="text/javascript">
		function sendDelete(){
			if(window.confirm('정말로 삭제 합니까?')){
				location.href="/LIP_Research/DeleteQna.action?qnaNumber=<s:property value="qna.qnaNumber"/>";
			}
			
		}
		
	</script>
</body>
</html>