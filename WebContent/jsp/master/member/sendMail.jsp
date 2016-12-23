<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
body {
    font: 12px Verdana, Arial, Helvetica, sans-serif;
    /* background-color: #FFFFFF; */
}

/* FORM STYLES */
form {
    width: 450px;
    margin-left: 40px; 
}

fieldset{
    padding:10px;
    border:1px solid #003366;
    margin-bottom:25px;
    width: 830px;
    background-color: #FFFFFF;
}
table{
    margin-left: 20px;
}
tr{
    padding: 10px;
    margin: 10px;
}
textarea{
    padding: 10px;
}

.textarea2{
background-color:#F0F0FF;
background-image: none;
border: 1px solid #006666;
margin: 4px;
padding: 6px;
}

input,textarea{
background-color:#CCCCFF;
background-image:url(tutorial_pics/shadeform.jpg);
border: 1px solid #006666;
margin: 4px;
padding: 4px;
font: 14px Verdana,Geneva,Arial,Helvetica,sans-serif;
}
/*styles the input fields*/
/*styles the form fields*/
label{
    color:#000033;
    font-weight: bold;
}
legend{
padding:10px;/*gives a bit of padding between the border and the test*/
color:#000066;
font:26px bold Verdana,Geneva,Arial,Helvetica,sans-serif;
}
.submitbutton {
    border: 1px solid #003366;
    background-color:#CCCCFF;
}
#estyle{
    height: 30px;
}
.tablestyles { 
padding-left: 10px;
padding-right: 10px;
padding-top: 10px;
text-align: left;
}
</style>
<script type="text/javascript">

</script>
</head>

<body>
    <jsp:include page="/jsp/common/menu_bar/master_menu.jsp" />
    <jsp:include page="/jsp/master/member/sendMailForm.jsp" />
    <jsp:include page="/jsp/common/footer/footer.jsp" />
</body>
</html>