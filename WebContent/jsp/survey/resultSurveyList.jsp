<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<script type="text/javascript">
function seeSurvey(num){
	var myform = document.myform;
	myform.surveyNum.value=num;
	
}
// 결과를 보기위한 액션을 호출한다.
function seeResult(num){
    var myform = document.myform;
    myform.surveyNum.value=num;
    myform.action="/LIP_Research/survey/SeeSurveyResult.action";
    myform.submit();
}
function downResult(num){
    var myform = document.myform;
    myform.surveyNum.value=num;
    myform.action="/LIP_Research/survey/DownSurveyResult.action";
    myform.submit();
}
function backGo()
{
    history.back();
}
</script>
</head>

<body>
    
    <jsp:include page="../common/menu_bar/user_menu.jsp" />
    <form name="myform" method="post">
        <s:if test="surveyList.size > 0 ">
                <table border="1" style="margin: 40px">
                    <tr height="50">
                        <th width=100 >시직일시</th>
                        <th width=100 >종료일시</th>
                        <th width=300>서베이 제목</th>
                        <th width=100 >포인트</th>
                        <th width=100 >상태</th>
                         <th width=100 >결과</th>
                         <th width=100 >결과다운</th>
                    </tr>
                    <s:iterator value="surveyList">
                        <tr height="50">
                            <td  align="center">20<s:property value="surveyStartDate" /></td>
                            <td  align="center">20<s:property value="surveyEndDate" /></td>
                            <td  align="center"><s:property value="surveyTitle" /></td>
                            <td  align="center"><s:property value="surveyPoint" /></td>
                            <s:if test="surveyCondition==1">
                                <td  align="center">진행전</td></s:if>
                            <s:if test="surveyCondition==2">
                                <td  align="center">진행중</td></s:if>
                           <s:if test="surveyCondition==3">
                                <td  align="center">진행완료</td></s:if>
                            <s:if test="surveyCondition==4">
                                <td  align="center">강제완료</td></s:if>    
                            <td  align="center"><input type="button" value="결과" onclick="seeResult(<s:property value="surveyNumber" />)"></td>
                            <td  align="center"><input type="button" value="결과다운" onclick="downResult(<s:property value="surveyNumber" />)"></td>
                        </tr>
                        </s:iterator>
                   </table>
                </s:if>
                <s:else>
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="430" style="margin: 30px"></center>
               </s:else>
               <input type="hidden" name="surveyNum" value="">
     </form>
     <center>   
     <input type="button" value="  뒤로가기  "  style="padding: 6px" onclick="backGo()"></center>
     <br/><br/>
     <jsp:include page="../common/footer/footer1.jsp" />
     
</body>
</html>