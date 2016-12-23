<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="makepoll">
<s:if test="pollList.size > 0 ">
	<table>	
		<tr class="makepoll">
			<th width=50  class="makepoll">진행기간</th>
			<th width=300 class="makepoll">서베이 제목</th>
			<th width=50 class="makepoll"><label>결과<br>받기</label></th>
		</tr>
		<s:iterator value="pollList">
			<tr class="makepoll">
				<td align="center" class="makepoll">
				<s:property value="pollStartDate" />~
				<s:property value="pollEndDate" />
				</td >
		<%-- 		<td align="center"><s:property value="categoryName" /></td> --%>
				<td align="center" class="makepoll"><s:property value="pollExplain" /></td>
				<td align="center" class="makepoll"><a 	href='/LIP_Research/DownloadExcel.action?pollNumber=<s:property value="pollNumber" />'><img
						src="/LIP_Research/images/etc/white_excel.png" /></a></td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<s:else>
	<center>
		<img alt="" src="/LIP_Research/images/etc/noresult.jpg"
			title="NoResult" align="middle" height="430" style="margin: 30px">
	</center>
</s:else>
</div>