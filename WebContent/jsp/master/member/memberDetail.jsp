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
function modifyForm(){
    var pwVal = document.getElementById('userPW');
    var repwVal = document.getElementById('userRepw');
    if (pwVal.value.length > 7 && pwVal.value.length < 13) {
        var strPW = pwVal.value;
        var splitPW = strPW.split('');
        var cntPW = 0;
        for ( var i = 0; i < pwVal.value.length; i++) {
            if (isNaN(splitPW[i])) {
                cntPW++;
            }
        }
        if (cntPW == pwVal.value.length || cntPW == 0) {
            alert('비밀번호는 영문, 숫자 혼합으로만 만들 수 있습니다.');
            return false;
        }
    }else if (pwVal.value.length>0 && pwVal.value.length < 8 || pwVal.value.length > 12) {
        
        alert('비밀번호는 8~12자 입니다.');
        return false;
    }
    if (pwVal.value != repwVal.value) {
        alert('비밀번호가 일치하지 않습니다.');
        return false;
    }
    alert("정보수정");
    var myform = document.formElem;
    myform.action = "MyInfoModify.action";
    myform.submit();
}
function sendMail()
{
    document.myform.action="/LIP_Research/master/member/SendEmail.action?usage=1";
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
            <label class="infolabel">아이디&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="userid" name="userid"  readonly="readonly" value="<s:property value="lipMember.memberId"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            <td width="350">
            <label class="infolabel">이&nbsp;메&nbsp;일&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="userEmail" name="userEmail" readonly="readonly" value="<s:property value="lipMember.memberEmail"/>" style="width:200px;padding: 6px;" class="inputBox"/>
            </td>
            <td width="150"><input type="button" value="     Email    " style="padding: 6px" onclick="sendMail();"></td>            
            </tr>

            <tr height="40">
            <td>
            <label class="infolabel">성&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="userGender" name="userGender" disabled="disabled" value="<s:if test='lipMember.genderNumber==1'>남성</s:if><s:else>여성</s:else>" style="width:200px;padding: 6px;" class="inputBox"/></td>
            
            <td>
            <label class="infolabel">생년월일&nbsp;&nbsp;</label>
            <input type="text" id="userBirth" name="userBirth" disabled="disabled" value="<s:property value="lipMember.memberBirth"/>" style="width:200px;padding: 6px;" class="inputBox"/></td>
           
            <td> </td>
           
           <tr height="40">
           <td>
           <label class="infolabel">휴대폰&nbsp;&nbsp;</label>
           <select id="userCellCo" name="userCellCo">
                <option value="">통신사</option>
                <option <s:if test="lipMember.memberCellphoneCo=='SKT'">selected</s:if> value="SKT">SKT</option>
                <option <s:if test="lipMember.memberCellphoneCo=='KTF'">selected</s:if> value="KTF">KTF</option>
                <option <s:if test="lipMember.memberCellphoneCo=='LGT'">selected</s:if> value="LGT">LGT</option>
            </select>
            <input type="text" style="width:145px;padding: 6px;" id="userCell" name="userCell"  value="<s:property value="lipMember.memberCellphoneNumber"/>"/></td>
            
           <td   colspan="2">
            <label class="infolabel">우편번호&nbsp;&nbsp;</label>
            <input type="text" style="width:80px;padding: 6px;" id="postcode1" name="postcode1" class="inputBox" value='<s:property value="pc.postcode1st"/>'/>
            &nbsp;-&nbsp;
            <input type="text" style="width:80px;padding: 6px;" id="postcode2" name="postcode2" value='<s:property value="pc.postcode2nd"/>'/>
           <!--  &nbsp;&nbsp;<input type="button" value="검색" style="padding: 6px" onclick="postFind()"> -->
            <input type="hidden" id="postNumber" name="postNumber" value='<s:property value="pc.postcodeNumber"/>'/>
            <input type="hidden" id="postcodeVal" name="postcodeVal" value='<s:property value="pc.postcode1st"/>' /></td></tr>
            
            <tr height="40">
            <td>
            <label class="infolabel">주&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</label>
            <input type="text" style="width:200px;padding: 6px;" id="postBasic" name="postBasic" class="inputBox" value='<s:property value="pc.postcodeAddress"/>'/></td>
            
            <td>
            <label class="infolabel">상세주소&nbsp;&nbsp;&nbsp;</label>
            <input type="text" style="width:200px;padding: 6px;" id="userDetailpost" name="userDetailpost" class="inputBox" value="<s:property value="lipMember.memberDetailAddress"/>"/></td>
            
            <td><input type="button" value="  뒤로가기  "  style="padding: 6px" onclick="backGo()"></td>
            </tr>
            
            <tr>
            <td colspan="2">
            <label class="infolabel" style="display:inline;">메일수신&nbsp;&nbsp;&nbsp;</label>
            <input type="checkbox" id="mailAgree" name="memberEmailRecieve1" value="<s:property value="lipMember.memberEmailRecieve"/>" />&nbsp;&nbsp;메일 수신에 동의합니다.
           <%--  <input type="text" id="memberEmailRecieve" name="memberEmailRecieve" value="<s:property value="lipMember.memberEmailRecieve"/>"/> --%>
            </td>
            <td><!-- <input type="button" value="  정보수정  "  style="padding: 6px" onclick="modifyForm"> --> </td>
            </tr>
         
            </table>
        </form>
        
    </fieldset>
    </div>
    <div id="container">
            <ul class="tab">
                <li><a href="#tab1" class="selected">로그</a></li>
                <li><a href="#tab2">포인트</a></li>
                <li><a href="#tab3">폴 참여</a></li>
                <li><a href="#tab4">서베이 참여</a></li>
            </ul>
            <ul class="panel">
                <li id="tab1">
                
               <s:if test='memberLogList.size > 0 '>
               <s:property value="memberLogIp" />
	                 <table border=1>
		                <tr>
		                    <th width=150  >일시</th>
		                    <th width=150 >접속IP</th>
		                    <th width=150>접속경로</th>
		                    <th width=300>로그내역</th>
		                </tr>
		                <s:iterator value="memberLogList">
		                    <tr>
		                        <td  align="center">20<s:property value="memberLogDate" /></td>
		                        <td  align="center"><s:property value="memberLogIp" /></td>
		                        <td  align="center"><s:property value="memberLogFrom" /></td>
		                        <td  align="center"><s:property value="memberLogContant" /></td>
		                    </tr>
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
                <s:if test="surveyParticipateList.size > 0 ">
                    <table border=1>
                    <tr>
                        <th width=150  >일시</th>
                        <th width=250 >카테고리</th>
                        <th width=350>서베이 제목</th>
                    </tr>
                    <s:iterator value="surveyParticipateList">
                        <tr>
                            <td  align="center">20<s:property value="surveyParticipateDate" /></td>
                            <td  align="center"><s:property value="categoryName" /></td>
                            <td  align="center"><s:property value="surveyTitle" /></td>
                        </tr>
                        </s:iterator>
                   </table>
                </s:if>
                <s:else>
                   <center> <img alt="" src="/LIP_Research/images/etc/noresult.jpg" title="NoResult" align="middle" height="380"></center>
               </s:else>
                
                </li>
                <li id="tab5">
                </li>
            </ul>
        </div>

    <jsp:include page="/jsp/common/footer/footer1.jsp" />
</body>
</html>