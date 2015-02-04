<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
table {
       width: 400px;
       border-collapse: collapse;
       text-align: center;
       font-family: 'Trebuchet MS';
}
td, th {
       font-size: 10pt;
       border: 1px solid #BFCAFC;
       height: 30px;
}
th {
       background-color: #BFCAFC;
       color: #ffffff;
       font-family: Georgia;
}
tr.alt td {
       color: #000000;
       background-color: #EAF2D3;
}
a{
	text-decoration: underline;
}
a:link{
	color:red; font-size:15px; text-decoration:none
}
a:visited{
	color:green; font-style:italic; text-decoration:line-through; 
}
a:active{
	color:blue;
}
a:hover{
	color:red; text-decoration:underline;
}
</style>
<script type="text/javascript">
function sendPost(val1,val2,val3,val4){
	opener.formElem.postcodeVal.value= val2;
	opener.formElem.postNumber.value = val1;
	opener.formElem.postcode1.value = val2;
	opener.formElem.postcode2.value = val3;
	opener.formElem.postBasic.value = val4;
	window.close();
}
</script>
</head>
<body>
<form name="postResultPage">
<table>
	<tr>
		<th>우편주소</th>
		<th>주소</th>		
	</tr>
	<s:iterator value="list">
	<tr>
		<td><a onclick="sendPost(<s:property value="postcodeNumber"/>,'<s:property value="postcode1st"/>','<s:property value="postcode2nd"/>','<s:property value="postcodeAddress"/>');"><s:property value="postcode1st"/>-<s:property value="postcode2nd"/></a></td>
		<td><a onclick="sendPost(<s:property value="postcodeNumber"/>,'<s:property value="postcode1st"/>','<s:property value="postcode2nd"/>','<s:property value="postcodeAddress"/>');"><s:property value="postcodeAddress"/></a></td>		
	</tr>
	</s:iterator>
</table>
</form>
</body>
</html>