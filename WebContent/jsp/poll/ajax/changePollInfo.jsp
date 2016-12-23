<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fieldset>
	<legend>${message }</legend>
	<table class="pageme">
		<tbody>
		<tr>
			<th>번호</th>
			<th>폴제목</th>
			<th>카테고리</th>
			<th>상태</th>
			<th>아이디</th>
			<th>폴포인트</th>
			<th>시작시간</th>
			<th>종료시간</th>
		</tr>
		<c:forEach var="poll" items="${polls }">
			<tr>
				<td align="center">${poll.pollNumber }</td>
				<td align="center"><a
					href="/LIP_Research/master/SearchPoll.action?pollNumber=${poll.pollNumber }">${poll.pollQuestion
						}</a></td>
				<td align="center">${poll.categoryName }</td>
				<td align="center">${poll.pollCondition }</td>
				<td align="center">${poll.memberId }</td>
				<td align="center">${poll.pollBalancePoint }</td>
				<td align="center"><fmt:formatDate
						value="${poll.pollStartDate}" pattern="yyyy-MM-dd" /></td>
				<td align="center"><fmt:formatDate value="${poll.pollEndDate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pager"></div>
</fieldset>