<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Q&amp;A 게시판</title>
<link rel="stylesheet" href="/LIP_Research/css/qna_style.css">
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />

	<div id="body-section"> 
	<table class="table_list_10">

<caption>Q&amp;A게시판</caption>

	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">분류</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">등록일</th>
		</tr>
	</thead>
	<tbody>
	<s:if test="qnaList.size()<1">
		<tr><td colspan="5">등록된 Q&amp;A가 없습니다</td></tr>
	</s:if>
	<s:iterator value="qnaList">
		<!-- 글내용이 있는 경우 -->
		<tr>
			<td class="no"><s:property value="qnaNumber"/></td>
			<td class="category"><s:property value="qnaCategory"/></td>
			<td class="headline">
				     <a href="/LIP_Research/DetailQna.action?qnaNumber=<s:property value="qnaNumber" />">
				     <s:property value="qnaTitle" /></a>
				     <s:if test="qnaAnswer!=null">
				     	<img src="/LIP_Research/images/etc/check.jpg" alt="답변완료"/>
				     </s:if>
			</td>

                <td><s:property value="member.memberId"/></td>

			
			<td><s:property value="qnaDate"/></td>
		</tr>
</s:iterator>
	</tbody>
	</table>
    <ul class="table_page_navi">
	 <s:property value="pagingHtml" escape="false"/> 
	</ul>
    <div class="pagefind">
	<form name="search_form" method="post" action="SearchQna.action">
		<img alt="검색" src="/LIP_Research/images/etc/search.jpg">
		<select name="SearchColumn" id="scol">
			<option value="qna_title">제목</option>
			<option value="qna_contant">내용</option>
			<option value="member_id" >작성자</option>
		</select>
		
		<input type="text" name="SearchWord" id="sword" title="검색어입력">
		<a class="btn_m10" onclick="javascript:document.search_form.submit();">검색</a>
		
					<div class="btn_area_r01">
					<s:if test="#session.lipMember!=null">
					    <a href="/LIP_Research/WriteQnaForm.action">글쓰기</a>
					   </s:if>
					    <a href="/LIP_Research/Qna.action">전체목록</a>
						</div>
				
	</form>
	</div>
	
	
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