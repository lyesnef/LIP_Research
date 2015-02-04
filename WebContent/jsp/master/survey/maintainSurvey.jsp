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
#surveyClass
{
    overflow: scroll;
    height:500px;
    width:800px;
    background-color: white;
    overflow-x:hidden;
}
</style>
<script type="text/javascript">
function selectMember(num)
{
    if(num==0)
    	   document.myform.action="/LIP_Research/master/MaintainSurvey.action";
    else 
    	   document.myform.action="/LIP_Research/master/MaintainSurvey.action?param="+num;
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
                <input type="button" value="검색" onclick="selectMember(0)">
                <label>&nbsp;&nbsp;&nbsp;[전체검색을 하려면 검색조건을 넣지 마세요]</label> 
                <br/><br/>
                
                <table>
                    <tr>
                        <td width="300">&nbsp;</td>
                        <td width="100"><input type="button" value="진행전 서베이" onclick="selectMember(1)"></td>
                        <td width="100"><input type="button" value="진행중 서베이" onclick="selectMember(2)"></td>
                        <td width="100"><input type="button" value="종료 서베이" onclick="selectMember(3)"></td>
                        <td width="100"><input type="button" value="강제종료 서베이" onclick="selectMember(4)"></td>
                </table>
                
            </fieldset>
            <fieldset>
            
            <legend >서베이 리스트</legend>
            <div id="surveyClass">
            <s:if test='surveyList.size > 0 '>
            <table border=1 >
                <tr>
                    <th width=50  >번호</th>
                    <th width=150 >아이디</th>
                    <th width=150>카테고리</th>
                    <th width=300 >서베이 이름</th>
                    <th width=100 >포인트잔액</th>
                    <th width=80>상태</th>
                </tr>
                <s:iterator value="surveyList">
                    <tr>
                        <td  align="center"><a href="/LIP_Research/master/SearchSurvey.action?surveyNum=<s:property value="surveyNumber" />"><s:property value="surveyNumber" /></a></td>
                        <td  align="center"><a href="/LIP_Research/master/SearchSurvey.action?surveyNum=<s:property value="surveyNumber" />"><s:property value="memberId" /></a></td>
                        <td  align="center"><s:property value="categoryName" /></td>
                        <td  align="center"><s:property value="surveyTitle" /></td>
                        <td  align="center"><s:property value="surveyPoint" /></td>
                        <td  align="center"><s:property value='surveyCondition' /></td>   
                    </tr>
                    </s:iterator>
            </table>
            </s:if>
             <s:else>
              <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
            </s:else>
            </div>
            </fieldset>
        </form>
    
    </div>
    <jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>