<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
*{
    margin:0;
    padding:0;
}
#container{
    width:800px;
    margin:50px auto;
}
#tab1, #tab2, #tab3, #tab4{
    overflow: scroll;
    height:400px;
    background-color: white;
    overflow-x:hidden;
}
ul.tab{
    padding:0;
   
}
ul.tab li{
    list-style-type:none;
    width:200px;
    height:40px;
    float:left;
}
ul.tab li a{
    outline:none;
    background-color:gray;
    /* background:url("http://cfile25.uf.tistory.com/image/17710F454FEE42C1326F65"); */ 
    display:block;
    color:blue;
    line-height:40px;
    text-align:center;
}
ul.tab li a.selected{
    background-color:yellow;
    /* background:url("http://cfile7.uf.tistory.com/image/18710F454FEE42C133F20E"); */
    text-decoration:none;
    color:#333;
    cursor:default;
}
ul.panel{
    clear:both;
    border:1px solid #9FB7D4;
    border-top:none;
    padding:0;
}
ul.panel li{
    list-style-type:none;
    padding:10px;
    text-indent:1em;
    color:#333;
}
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

function changeCon(num)
{
    document.myform.action="/LIP_Research/master/survey/SearchSurvey.action?con="+num;
    document.myform.submit();
}
window.agreeChange=function (){
	var checkVal = document.getElementById('mailAgree');
    if(checkVal.value == 'T')  
        checkVal.checked=true;
}
function postFind(){
    window.open("/LIP_Research/jsp/user/join/postSearch.jsp", "postSearchPage", "width=420, height=600, All=no");
    return false;
}
function backGo()
{
	history.back();
}
function sendAllMail()
{
    document.myform4.action="/LIP_Research/master/member/SendEmail.action?usage=2";
    document.myform4.submit();
}
window.onload=function(){
	 window.agreeChange();
	}
$(function(){
    $("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide();
    $("ul.tab li a").click(function(){
        $("ul.tab li a").removeClass("selected");
        $(this).addClass("selected");
        $("ul.panel li").slideUp("fast");
        $($(this).attr("href")).slideDown("fast");
        return false;
    });
});
</script>
</head>

<body>

    <jsp:include page="/jsp/common/menu_bar/master_menu.jsp" />
    <div id="master-body-section">
    <fieldset  style="background: white;">
        <legend>기본정보</legend>
        <form name="myform" method="post" >
            <table>
            
            <tr height="40">
            <td width="300">
            <label class="infolabel">제목&nbsp;&nbsp;&nbsp;</label>
            <input type="hidden" name="surveyNum" value="<s:property value="survey.surveyNumber"/>">
            <input type="text" id="survey.surveyTitle" name="survey.surveyTitle"  readonly="readonly" value="<s:property value="survey.surveyTitle"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            <td width="350">
            <label class="infolabel">현재상태</label>
            <input type="text" id="surveyCondition" name="surveyCondition" readonly="readonly" 
            value="<s:if test='survey.surveyCondition==1'>진행전</s:if><s:elseif test='survey.surveyCondition==2'>진행중</s:elseif><s:elseif test='survey.surveyCondition==3'>진행종료</s:elseif><s:elseif test='survey.surveyCondition==4'>강제종료</s:elseif>"            
            style="width:200px;padding: 6px;" class="inputBox"/>
            
            </td>
            <td width="150"><input type="button" value="서베이진행" style="padding: 6px" onclick="changeCon(2)"></td>            
            </tr>

            <tr height="40">
            <td>
            <label class="infolabel">카테고리</label>
            <input type="text" id="categoryName" name="categoryName" readonly="readonly" value="<s:property value="survey.categoryName"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            
            <td>
            <label class="infolabel">포&nbsp;인&nbsp;트&nbsp;</label>
            <input type="text" id="surveyPoint" name="surveyPoint" readonly="readonly" value="<s:property value="survey.surveyPoint"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
           
            <td> 
            <s:if test='survey.surveyCondition==1'><input type="button" value="강제종료" style="padding: 6px" onclick="changeCon(4)"></s:if>
            <s:if test='survey.surveyCondition==2'><input type="button" value="강제종료" style="padding: 6px" onclick="changeCon(4)"></s:if>
            </td>
            </tr>
            
            <tr height="40">
            <td>
            <label class="infolabel">시작일</label>
            <input type="text" id="surveyStartDate" name="surveyStartDate" readonly="readonly" value="20<s:property value="survey.surveyStartDate"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            
            <td>
            <label class="infolabel">종&nbsp;료&nbsp;일&nbsp;</label>
            <input type="text" id="surveyEndDate" name="surveyEndDate" readonly="readonly" value="20<s:property value="survey.surveyEndDate"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
           
            <td> </td>
            </tr>
            
             <tr height="40">
            <td>
            <label class="infolabel">제작자</label>
            <input type="text" id="memberId" name="memberId" readonly="readonly" value="<s:property value="survey.memberId"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            
            <td>
            <label class="infolabel">제&nbsp;작&nbsp;일&nbsp;</label>
            <input type="text" id="surveyDate" name="surveyDate" readonly="readonly" value="20<s:property value="survey.surveyDate"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
           
            <td> <input type="button" value="  뒤로가기  "  style="padding: 6px" onclick="backGo()"></td>
            </tr>
           
           
         
            </table>
        </form>
        
    </fieldset>
    </div>
    <div id="container">
            <ul class="tab">
                <li><a href="#tab1" class="selected">문제</a></li>
                <li><a href="#tab2">포인트</a></li>
                <li><a href="#tab3">참여 인원</a></li>
                <li><a href="#tab4">참가 가능인원</a></li>
            </ul>
            <ul class="panel">
                <li id="tab1">
                
               <s:if test='questionList.size > 0 '>
               <table>
	               <% int i=0; %>
	            <s:iterator value="questionList">
	               <tr><td>
	               <% i=i+1; %>
	                <!-- 문제 질문 -->
	                
	                <!-- 텍스트 -->
	                <s:if test="questionViewType==1">
	                    <s:property value="questionOrder" />. <s:property value="questionContant" /><br/>
	                </s:if>
	                <!-- 그림 -->
	                <s:if test="questionViewType==2">
	                    <center>
	                    <img src="/LIP_Research/images/common/<s:property value="questionImage" />"  title="문제사진" width="400px"  style="margin-top: 20px;" align="top">
	                    </center>
	                    <br/>
	                    <s:property value="questionOrder" />. <s:property value="questionContant" /><br/>
	                </s:if>
	                <!-- 동영상 -->
	                <s:if test="questionViewType==3">
	                   <s:property value="questionOrder" />.  <s:property value="questionContant" />
	                </s:if>
	                </td></tr>
	                
	                <!-- 단답형 -->
	                <s:if test="questionType==1">
                        
	                    <div  id="solve">
	                    <s:iterator value="exampleList">
	                        <tr><td>
	                        <!-- 보기단답형 -->
	                        <s:if test="exampleType==1">
	                        <input type="radio" name="no<s:property value="questionNumber" />"
	                         value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                         <s:property value="exampleOrder" />. <s:property value="exampleContant" />
	                        </s:if>
	                        
	                        <!-- 보기그림형 -->
	                        <s:if test="exampleType==2">
	                        <img src="/LIP_Research/images/common/<s:property value="exampleLink" />"  title="문제사진" width="200px"  style="margin-top: 20px;">
	                        <br/>
	                        <input type="radio" name="no<s:property value="questionNumber" />"
	                        value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                        <s:property value="exampleOrder" />. <s:property value="exampleContant" />
	                        </s:if>
	                        
	                        <!-- 보기동영상형 -->
	                        <s:if test="exampleType==3">
	                        <img src="/LIP_Research/images/common/<s:property value="exampleLink" />"  title="문제사진" width="200px"  style="margin-top: 20px;">
	                        <br/>
	                        <input type="radio" name="no<s:property value="questionNumber" />" 
	                        value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                        <s:property value="exampleOrder" />. <s:property value="exampleContant" />
	                        </s:if>
	                        </td></tr>
	                    </s:iterator>
	                    </div>
	                </s:if>
	                    
	                    <!-- 다답형 -->
	                <s:if test="questionType==2">
	                    <s:iterator value="exampleList">
	                       <tr><td>
	                        <!-- 보기단답형 -->
	                        <s:if test="exampleType==1">
	                        <input type="checkbox" name="no<s:property value="questionNumber" />" 
	                        value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                        <s:property value="exampleContant" />
	                        </s:if>
	                        
	                        <!-- 보기그림형 -->
	                        <s:if test="exampleType==2">
	                        <img src="/LIP_Research/images/common/<s:property value="exampleLink" />"  title="문제사진" width="200px"  style="margin-top: 20px;">
	                        <br/>
	                        <input type="checkbox" name="no<s:property value="questionNumber" />" 
	                        value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                        <s:property value="exampleContant" />
	                        </s:if>
	                        
	                        <!-- 보기동영상형 -->
	                        <s:if test="exampleType==3">
	                        <img src="/LIP_Research/images/common/<s:property value="exampleLink" />"  title="문제사진" width="200px"  style="margin-top: 20px;">
	                        <br/>
	                        <input type="checkbox" name="no<s:property value="questionNumber" />" 
	                        value="<s:property value="exampleType" />,<s:property value="questionNumber" />,<s:property value="exampleNumber" />,<s:property value="exampleOrder" />">
	                        <s:property value="exampleContant" />
	                        </s:if>
	                        <br/>
	                        <tr><td>
	                    </s:iterator>
	                </s:if>
	            </s:iterator>
	            </table>
	         </s:if>
	      <s:else>
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
           </s:else>
                
                </li>
                <li id="tab2">
                <s:if test="pointIncomeList.size > 0 ">
                <table border=1>
                <tr>
                    <th width=100  >일시</th>
                    <th width=130 >내용</th>
                    <th width=80>수입</th>
                    <th width=80 >지출</th>
                    <th width=350>상세내역</th>
                </tr>
                <s:iterator value="pointIncomeList">
                    <tr>
                        <td  align="center">20<s:property value="pointIncomeDate" /></td>
                        <td  align="center"><s:property value="pointIncomeList" /></td>
                        <td  align="center"><s:property value="pointIncomePoint" /></td>
                        <td  align="center"><s:property value="pointOutcomePoint" /></td>
                        <td  align="center"><s:property value="pointIncomeDetail" /></td>
                    </tr>
                    </s:iterator>
            </table>
            </s:if>
            <s:else>
              <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
            </s:else>
                </li>
                <li id="tab3">
                <s:if test="pollParticipateList.size > 0 ">
	                <table border=1>
	                <tr>
	                    <th width=150  >일시</th>
	                    <th width=250 >카테고리</th>
	                    <th width=350>폴 제목</th>
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
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
               </s:else>
                
                </li>
                <li id="tab4">
               <form name="myform4" method="post">
                <s:if test="mailSendList.size > 0 ">
                    <table border=1>
                    <tr>
                        <th width=150  >아이디</th>
                        <th width=250 >이메일</th>
                        <th width=100>성별</th>
                        <th width=100>생년월일</th>
                        <th width=100>지역</th>
                    </tr>
                    <s:iterator value="mailSendList">
                        <tr>
                            <td  align="center"><s:property value="memberId" /></td>
                            <td  align="center"><s:property value="memberEmail" /></td>
                            <td  align="center"><s:property value="genderNumber" /></td>
                            <td  align="center"><s:property value="memberBirth" /></td>
                            <td  align="center">
                                <s:property value="regionNumber" />
                                <input type="hidden" name="userEmail" value="<s:property value="memberEmail" />">
                            </td>
                        </tr>
                        </s:iterator>
                   </table>
                   <br/>
                   <input type="button" value="전체메일보내기" style="padding: 6px" onclick="sendAllMail();">
                </s:if>
                <s:else>
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
               </s:else>
               </form>
                
                </li>
                <li id="tab5">
                </li>
            </ul>
        </div>

    <jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>