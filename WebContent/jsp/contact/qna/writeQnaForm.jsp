<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Q&amp;A  작성</title>
<link rel="stylesheet" href="/LIP_Research/css/qna_style.css">
<link rel="stylesheet"  href="/LIP_Research/css/poll.css" />
<style type="text/css">
	.body-section div{
		padding:10px;
	}
	#qnaCategory{
		width:100px;
	}
	#qnaContant{
	margin-top:10px;
	padding:6px;
		width:553px;
		height:200px;
		resize:none;
	}
</style>
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />

	<div id="body-section"> 
	<form action="WriteQna.action" method="post" name="myForm">
		<div>
			<select id="qnaCategory" name="qna.qnaCategory">
				<option value="회원">회원</option>
				<option value="폴">폴</option>
				<option value="서베이">서베이</option>
				<option value="기사">기사</option>
				<option value="포인트">포인트</option>
				<option value="기타">기타</option>
			</select>
		<input type="text" size="84" placeholder="Q&A 제목을 입력하세요" name="qna.qnaTitle">
		</div>
		<div>
			<textarea id="qnaContant" placeholder="Q&A 내용을 입력하세요" name="qna.qnaContant"></textarea>
		</div>
		<div class="pagefind">
		<div  class="btn_area_r01">
			<a href="#Reg" onclick="javascript:document.myForm.submit()">등록</a>
			<a href="/LIP_Research/Qna.action">전체목록</a>
		</div>
		</div>
		</form>
	</div>
	<jsp:include page="/jsp/common/banner/banner.jsp" />
	
	<jsp:include page="/jsp/common/footer/footer.jsp" />
	
	<script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(e){
	
	}); 
	
	
		
		
	</script>
</body>
</html>