<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>

<body>
	 <s:if test="pollParticipateList.size > 0 ">
                <table >
                    <tr>
                        <th width=100 >일시</th>
                        <th width=100 >카테고리</th>
                        <th width=300>폴 제목</th>
                    </tr>
                    <s:iterator value="pollParticipateList">
                        <tr>
                            <td  align="center">20<s:property value="pollParticipateDate" /></td>
                            <td  align="center"><s:property value="categoryName" /></td>
                            <td  align="center"><s:property value="pollQuestion" /></td>
                        </tr>
                        </s:iterator>
                   </table>
                </s:if>
                <s:else>
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="430" style="margin: 30px"></center>
               </s:else>
</body>
</html>