<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
fieldset
{
    width:600px;
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
#answer{
     margin:10px;
     margin-left: 30px
}
</style>

<script type="text/javascript">
function goSurvey()
{
	document.myform.action="/LIP_Research/survey/ParticipateSurvey.action";
	 if(checkField())
	        document.myform.submit();
}
function checkField(){
    // 태그 네임이 input인 element를 받아온다.
    var arr = document.getElementsByTagName("input");
 // 결과 값이 저장된 변수 저장
    var result=document.myform.result.value;
    
    // 문제 갯수  
    var aNum = document.myform.aNum.value;
    var checkR=0;
    
    for(var i=0; i < arr.length; i++)
    {
        // 체크된 값들을 result에 넣어준다.   
          if(arr[i].checked)
              {
               result += arr[i].value+",";
               checkR++;
              }
    }
    // 체크된 값이 설문 조사 문항 갯수와 같을경우 True
    if(checkR != aNum)
    {
        alert("조건을 입력하세요");
        return false;
    }
    else
    {
        document.myform.result.value=result;
        return true;
    }
}
</script>
<title></title>
</head>

<body>
    <jsp:include page="../common/menu_bar/user_menu.jsp" />
    <div id="body-section">
    <fieldset  style="background: white;">
        <legend>설문조사 참가 방법</legend>
        설문 조사는 한번만 참가 할 수 있으며, 설문 조사 중도에 그만둔 경우에도 다시 참가하실수가 없습니다.<br/>
        설문 조사 완료후에 포인트를 받으실 수 있습니다.<br/>
        설문 조사는 작성을 전부 했지만, 제한 인원이 임박할 경우에는 제출을 하시지 못할 경우도 있습니다.
    </fieldset>
    
    <fieldset  style="background: white;">
        <legend>해당사항에 체크해주세요</legend>
        <form name="myform" method="post" >
	       <% int i=1; %>
	        <s:iterator value="surveyConstraintList">
	            <div class="quest" id="quest" >
	                <!-- 권역문제 -->
	                 <b>&nbsp;&nbsp;&nbsp; <%=i %>. <s:property value="constraintName" /></b>

	                   <!-- 권역보기 -->
	                   <s:iterator value="setConstraintList">
	                   <div class="quest" id="answer" >
		                   <input type="radio" name="no<%=i %>" value="<s:property value="setConstraintNumber" />">&nbsp;<s:property value="setConstraintName" />
	                   </div>
	                </s:iterator>
	            </div>
	            <% i=i+1; %>
	        </s:iterator>
	        <br/><br/>
	       <input type="hidden" name="aNum" value="<%=i-1%>">
	        <input type="hidden" name="surveyNum" value="${surveyNum}" />
	        <input type="hidden" name="memberNum" value="${memberNum}" />
            <input type="hidden" name="result" value="${result}">
           
	        <input type="button" value="다음단계" onclick="goSurvey()">
        </form>
        </fieldset>
    </div>
    <jsp:include page="/jsp/common/banner/banner.jsp" />
    <jsp:include page="../common/footer/footer.jsp" />
</body>
</html>