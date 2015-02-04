<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>설문 문제풀기</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">

<style type="text/css">

span#version{ 
    color: #777; 
    font: 12px verdana; 
}
div.title{
    font: bold 20px verdana;
    color: black;
    letter-spacing: .7px;
    margin-bottom: 20px;
    text-align: center;
}
.setBasicTarget{
    overflow: scroll;
    overflow-y: auto;
    overflow-x: hidden;
}
.monkeyBox1{line-height:300%;}
.monkeyBox1 .bt{background:url(/images/bar.png) no-repeat 100% -51px;margin:0 0 0 18px; height:10px;}
.monkeyBox1 .bt div.lbg{background:url(/images/bar.png) no-repeat 0 -51px;height:10px;width:18px;position:relative;left:-18px;}
.monkeyBox1 .bb{background:url(/images/bar.png) no-repeat 100% -65px;margin:0 0 0 12px; height:10px;}
.monkeyBox1 .bb div.lbg{background:url(/images/bar.png) no-repeat 0 -65px;height:10px;width:14px;position:relative;left:-12px;}
.monkeyBox1 .boxCt{border-left:1px solid #bec6c9;border-right:1px solid #bec6c9;background:#f6f7f9;padding:0 8px;}
</style>
<link rel="stylesheet" href="/LIP_Research/css/survey/anythingslider.css"/>
<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.anythingslider.js"></script>
<script type="text/javascript">
$(function () {

	 initContentsBox(''); 

	});

	function initContentsBox(cls) {
	 var $boxObj;
	 if (cls == "") {
	  $boxObj = $('div[class*=monkeyBox]');
	 } else {
	  $boxObj = $('.' + cls);
	 }

	 $boxObj.each(
	  function (index) {
	   var className = $(this).attr("class");
	   var $obj;
	   $obj = $(this).wrap("<div class='" + className + "' />").attr("class", "boxCt");
	   $($obj).parent().append("<div class='bb'><div class='lbg'></div></div>").prepend("<div class='bt'><div class='lbg'></div></div>");
	  }
	 );
	}

function regSurvey()
{
	var myform = document.myform;
    var questNumber="";
    var rightAnswer=false;
    myform.result.value="";
    var questNumberList = document.getElementsByName('questNumber');
    for(var i =0; i < questNumberList.length; i++)	{
    	var checkR = 0;
    	
    	if (typeof questNumberList[i] != 'undefined') {
    	        	questNumber = questNumberList[i].value;
    	}
    	 var arr = document.getElementsByName("no"+questNumber);
    	 
	    for(var j=0; j < arr.length; j++) {
	    	var type=0;	
	        // 체크된 값들을 result에 넣어준다.   
	        if(arr[j].checked) {
	        	
	           /* result += arr[i].value+","; */
                var result = arr[j].value;
                type=result.substring(0,1);
                myform.result.value += result+"/"; 
	            checkR++;
	           
		    	if(type==1){
		    		if(checkR==1){
		    			
		    			rightAnswer=true;
		    		}
		    		else{
		    			rightAnswer=false;
		    			alert("입력안한 문제가 있습니다.");
		    			return false;
		    		}
		    			
		    	}
		    	else if(type==2){
		    		if(checkR >= 1){
		    			rightAnswer=true;
		    		}
		    		else{
		    			rightAnswer=false;
		    			alert("입력안한 문제가 있습니다.");
	                    return false;
		    		}
		    	}
		    	else if(type==0){
		               rightAnswer=false;
		               alert("입력안한 문제가 있습니다.");
		               return false;
		        }
            }
	    }
	    if(checkR==0){
	           alert("입력안한 문제가 있습니다.");
               return false;
	    }
	    	
   }
    /* document.myform.action="/LIP_Research/survey/ParticipateSurvey.action"; */
       myform.action="/LIP_Research/survey/RegSurvey.action";
       myform.submit();
        return true;
    
   /*  if(checkField())
            document.myform.submit(); */
}

</script>
</head>

<body>

    <jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
    
    <form name="myform" method="post">
    
       
            <div class="title">Like It Perfectly<span id="version">설문조사를 진행해주세요.</span></div>
        
    <div class="monkeyBox1" align="center" style="width:80%;margin-left:8%">
    	
    			
    		
        <ul id="slider">
           <% int i=0; %>
            <s:iterator value="questionList" status="errorStatus">
            <% i=i+1; %>
            <li>
                <div class="setBasicTarget" style="font-size: 18px;font-weight:bold;">
                <br/><br/>
                <!-- 문제 질문 -->
                
                <!-- 텍스트 -->
                <s:if test="questionViewType==1">
                    <s:property value="questionOrder" />. <s:property value="questionContant" /><br/>
                </s:if>
                <!-- 그림 -->
                <s:if test="questionViewType==2">
                    <center>
                    <img src="/LIP_Research/ReadImage.action?imgName=<s:property value="questionImage" />"  title="문제사진" width="400px"  style="margin-top: 20px;" align="top">
                    </center>
                    <br/>
                    <s:property value="questionOrder" />. <s:property value="questionContant" /><br/>
                </s:if>
                <!-- 동영상 -->
                <s:if test="questionViewType==3">
                   <s:property value="questionOrder" />.  <s:property value="questionContant" />
                </s:if>
                
                <!-- 단답형 -->
                <s:if test="questionType==1">
                    <div  id="solve">
                    
                    <s:iterator value="exampleList">
                        
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
                        
                    </s:iterator>
                    </div>
                </s:if>
                    
                    <!-- 다답형 -->
                <s:if test="questionType==2">
                    <s:iterator value="exampleList">
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
                    </s:iterator>
                </s:if>
              
                <!-- 마지막에 서브밋버튼 -->
                <input type="hidden" name="questNumber" value="${questionNumber}">
                <s:if test="#errorStatus.isLast() == true">
	                <input type="hidden" name="piece1" value="<%=i%>">                
	                <input type="hidden" name="result" value="">
	                <input type="hidden" name="surveyNum" value="${surveyNum}">
	                <input type="hidden" name="limitNum" value="${limitNum}">
	                <input type="hidden" name="memberNum" value="${memberNum}">
	                <br/><input type="button" value="제출하기" onclick="regSurvey()">
               </s:if>
                </div>
            </li>
            </s:iterator>
            
        </ul>
       
    </div>    
    </form>     
    
    
    <script type="text/javascript">
        $(function(){
            $('#slider').anythingSlider({
                buildNavigation     : false,
                buildStartStop      : false
                /* navigationFormatter : function(index, panel){
                    return ['추가권역설정', '추가권역설정', '복합폴생성', '문제만들기'][index - 1];
                } */
            });
        });
    </script> 
    <jsp:include page="../common/footer/footer1.jsp" />
</body>
</html>