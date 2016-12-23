<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
fieldset
{
    width:800px;
    padding: 15px;
    margin: 15px;
    border: 1px solid #ccc;
    -moz-border-radius: 5px;
    -webkit-border-radius: 50px;
    border-radius: 5px;
    -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
}
</style>
<script type="text/javascript">
function selectMember()
{
    document.myform.action="/LIP_Research/master/Member.action";
    document.myform.submit();
}
</script>
</head>

<body>

    <jsp:include page="/jsp/common/menu_bar/master_menu.jsp" />

    <div id="master-body-section">
       <p align="center">
        <form name="myform" method="post">
            <fieldset title="검색" >
                <legend>검색</legend>
                <b>서베이 검색 &nbsp;&nbsp; </b>
                <input id="conValue" name="conValue" type="text" width="350" placeholder="  ID를 입력해 주세요" size="30">&nbsp;&nbsp;    
                <select name="condition">
                    <option value="id">&nbsp;&nbsp;&nbsp;아이디&nbsp;&nbsp;&nbsp;</option>
                </select>&nbsp;&nbsp; 
                <input type="button" value="검색" onclick="selectMember()">
                <label>&nbsp;&nbsp;&nbsp;[전체검색을 하려면 검색조건을 넣지 마세요]</label> 
            </fieldset>
            <fieldset>
            <legend>서베이 리스트</legend>
            <table border=1>
                <tr>
                    <th width=50  >번호</th>
                    <th width=150 >아이디</th>
                    <th width=150>카테고리</th>
                    <th width=250 >폴이름</th>
                    
                    <th width=100>변경</th>
                    <th width=50>상태</th>
                </tr>
               <%--  <s:iterator value="lipmemberList">
                    <tr>
                        <td  align="center"><a href="/LIP_Research/master/MemberDetail.action?memberNumber=<s:property value="memberNumber" />"><s:property value="memberNumber" /></a></td>
                        <td  align="center"><a href="/LIP_Research/master/MemberDetail.action?memberNumber=<s:property value="memberNumber" />"><s:property value="memberId" /></a></td>
                        <td  align="center">20<s:property value="memberBirth" /></td>
                        <td  align="center"><s:property value="memberCellphoneNumber" /></td>
                        <td  align="center"><s:property value="memberEmail" /></td>
                        <td  align="center"><s:property value="memberEmailRecieve" /></td>
                    </tr>
                    </s:iterator> --%>
            </table>
            </fieldset>
        </form>
    
    </div>
    <jsp:include page="/jsp/common/footer/footer.jsp" />
</body>
</html>