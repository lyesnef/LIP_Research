<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function successMail()
{
   document.myform.action="/LIP_Research/master/member/SuccessEmail.action";
   document.myform.mehtod="post";
	document.myform.submit(); 
}
</script>
</head>
    <body>
    <form name="myform" method="post">
        <p align="center">
		<fieldset>
		<legend>메일보내기</legend>
		<table>
			<tr valign="middle">
				<td align="left"><label for="txtsurname">From : </label></td>
				<td align="left"><input type="text" name="fromEmail" id="estyle" size="90" value="${fromEmail}"/></td>
			</tr>
			<tr valign="middle">
				<td align="left"><label for="txtfirstname">To &nbsp;&nbsp;&nbsp; : </label></td>
				<td align="left"><input type="text" name="userEmail" size="90" id="estyle" value="${userEmail}" /></td>
			</tr>
			<tr valign="middle">
				<td align="left"><label for="txtcompany">제목 &nbsp;&nbsp;: </label></td>
				<td align="left"><input type="text" name="title" size="90" id="estyle" value="${title}" /></td>
			</tr>
			<tr valign="middle">
				<td align="left"><label for="txtcomments">내용&nbsp;&nbsp; :</label></td>
				<td align="left"><textarea name="content" cols="90" rows="15" >${content}</textarea></td>
			</tr>
			<tr valign="top">
				<td>&nbsp;</td>
				<td align="right"><input type="button" value="메일보내기" size="20" height="20" onclick="successMail()"/></td>
			</tr>
		</table>
		<p>&nbsp;</p>
		</fieldset>
		</form>
</body>
</html>