<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
.titleArea {
position: relative;
background-image: linear-gradient(bottom, rgb(128,128,128) 26%, rgb(145,146,148) 63%, rgb(181,179,181) 84%);
background-image: -o-linear-gradient(bottom, rgb(128,128,128) 26%, rgb(145,146,148) 63%, rgb(181,179,181) 84%);
background-image: -moz-linear-gradient(bottom, rgb(128,128,128) 26%, rgb(145,146,148) 63%, rgb(181,179,181) 84%);
background-image: -webkit-linear-gradient(bottom, rgb(128,128,128) 26%, rgb(145,146,148) 63%, rgb(181,179,181) 84%);
background-image: -ms-linear-gradient(bottom, rgb(128,128,128) 26%, rgb(145,146,148) 63%, rgb(181,179,181) 84%);

background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0.26, rgb(128,128,128)),
	color-stop(0.63, rgb(145,146,148)),
	color-stop(0.84, rgb(181,179,181))
);
border: 1px solid rgb(250,250,250);
padding: 4 14 21px 24px;
height: 19px;
margin-bottom: 13px;
border-radius:6px;
-moz-border-radius:6px;
-ms-border-radius:6px;
-webkit-border-radius:6px;
color:white;
}

.body-section,	input, textarea, select, button, table {
font-family: 'Nanum',nanumgothic,'돋움',Dotum,AppleGothic,Helvetica,sans-serif;
font-size: 13px;
color: #777;
}
.contentArea {
margin-top: 20px;
position: relative;
border: 1px solid #C5D5DD;

border-radius:6px;
-moz-border-radius:6px;
-ms-border-radius:6px;
-webkit-border-radius:6px;
}

.mgb {
margin-bottom: 13px;
}

.contentArea .cont2 {
margin: 10px 0;
padding: 8px 8px 0;

}

h2{
margin: 0;
padding: 0;
border: 0;
font-size: 30px;
vertical-align: baseline;	
}

div {
display: block;
}

.openPoll {
position: relative;
border: 1px solid #D1D4DC;
padding: 0 0 0 0;

}

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
display: block;
}

.setPoll .question .saving, .openPoll .question .saving, .resultPoll .question .saving {
display: inline-block;
float: left;
width: 50px;
height: 52px;
font-size: 14px;
font-weight: bold;
color: red;
margin: 22 5px 0 17;
padding-top: 10px;
padding-bottom: 20px;
}

.openPoll .choice {
padding: 0 20px 20px 17px;
margin-bottom: 0px;
}

.choice {

margin-bottom: 25px;
}

.choice p {
margin-left: -8px;
width: 100%;
padding: 8px;
background: white;

}
.choice .imgbox {
margin-bottom: 20px;
}

.pollType1 {
width: 100%;
zoom: 1;
}

input {
vertical-align: middle;
}

ul, ol {
margin: 0;
padding: 0;
}
.pollType1 li {
padding: 6px 0 8px 5px;
margin: 0 0 5px 0;
}
ul li, ol li {
list-style: none;
padding-bottom: 15;
}

input[type="radio"], input[type="checkbox"] {
position: relative;
margin: -4px 4px 0 0;
width: 15px;
height: 15px;
}

input[type="radio"] {
vertical-align: text-bottom;
}

.pollType1 li label {
display: inline-block;
width: 90%;
cursor: pointer;
}

.btnC {
clear: both;
text-align: center;
padding: 0;
margin-bottom: 10px;
margin-top: 10px;
}

.pollType1 button.btnTypeASize, .pollType2_1 button.btnTypeASize, .pollType2_2 button.btnTypeASize, .pollType3 button.btnTypeASize, .pollType4 button.btnTypeASize, .pollType5 button.btnTypeASize, .pollType6 button.btnTypeASize, .pollType7 button.btnTypeASize, .pollType8 button.btnTypeASize, .pollType9 button.btnTypeASize, .pollType10 button.btnTypeASize, .openPoll button.btnTypeASize, .setPoll button.btnTypeASize {
padding-right: 3px;
}

.btnC input, .btnC button, .btnC span.button, .btnC img {
margin-right: 16px;
}

button.btnTypeASize, input[type="button"].btnTypeASize, input[type="submit"].btnTypeASize {
width: 194px;
height: 39px;
border: none;
font-size: 14px;
font-weight: bold;
color: white;
background: #00BCE4;
padding: 12px 0;
text-align: center;
}

input[type="button"], input[type="submit"], input[type="image"], button {
cursor: pointer;
}

input, textarea, keygen, select, button, isindex {
margin: 0em;
font: -webkit-small-control;
color: initial;
letter-spacing: normal;
word-spacing: normal;
text-transform: none;
text-indent: 0px;
text-shadow: none;
display: inline-block;
text-align: -webkit-auto;
}

.eventDate {
position: relative;
margin: 20px 18px 15px 18px;
z-index: 10;
zoom: 1;
}

.eventDate::after {
clear: both;
display: block;
content: "";
}

.frame2 {
position: relative;
width: 52px;
height: 52px;
z-index: 1;
}

.frame2 .fameCover {
position: absolute;
left: 0;
top: 0;
background: url(/images/front/sub/frame2.png) no-repeat left top;
width: 52px;
height: 52px;
}

.eventDate li {
float: left;
display: block;
font-size: 14px;
line-height: 3.2;
padding: 0 10px 0 0;
}

button.btnTypeBSize, input[type="button"].btnTypeBSize, input[type="submit"].btnTypeBSize {
width: 194px;
height: 39px;
border: none;
font-size: 14px;
font-weight: bold;
color: white;
background: #828282;
padding: 12px 0;
text-align: center;
}

.question p {
display: inline-block;
width: 350px;
color: #4A4A4A;
font-size: 16px;
font-weight: bold;
line-height: 1.6;
vertical-align: top;
}

.question .category {
display: inline-block;
float: left;
margin: 21 12px 0 21;
}

.cont3 header .saving{
display: inline-block;
float: left;
width: 50px;
height: 52px;
font-size: 14px;
font-weight: bold;
color: red;

margin: 3 5px 0 17;
padding: 0;
}

.cont3{
padding: 10px 10px;
min-height: 50px;
border: 1px solid #D1D4DC;
background: #E6F1F6;
}
</style>
<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />  
<div id="body-section"> 
	<div class="titleArea">
        <!--폴 종류 타이틀-->
		<h2>이벤트 폴</h2>
	</div>
	
  <s:iterator value="multiList">
  <!-- 멀티폴 열기 -->
   <form name="fm<s:property value="surveyNumber" />"  method="post" action="EventPollReg.action">
        <div class="contentArea">
        
        <div class="cont3">
        <s:if test="isParticipated==2">
					<img src="/LIP_Research/images/poll/ribbon1.png" style="position: absolute;
left: 634px;
top: -1;" width="80" height="80" alt="참여가능" id="ribbon">
				</s:if>
				<s:else>
				<img src="/LIP_Research/images/poll/ribbon2.png" style="position: absolute;
left: 634px;
top: -1;" width="80" height="80" alt="참여완료" id="ribbon">
				</s:else>
   			<header>
        			<span class="saving">
        				<!-- 복합폴에 배정된 포인트 -->
        				
							   <img src="/LIP_Research/images/etc/1349615017_money_gold.png" width="25px" height="25px" alt="point" style="display: block;">
							   <label >10P</label>
						
        			</span>
     		</header> 	
        </div>
        
        
        <div id="multiArea<s:property value="surveyNumber" />" class="multiArea" >
         
       
        <!-- 폴 리스트 열기 -->
        <input type="hidden" id="<s:property value="surveyNumber" />" value="
        <s:iterator value="pollList">
             <s:property value="pollNumber" />,
        </s:iterator>
   " />
       <input type="hidden" name="surveyNumber" value="<s:property value="surveyNumber" />" />
         <s:iterator value="pollList">	
        	<div class="cont2">
        	<!-- 문제들 반복적으로 뿌려준다 -->
        		<section class="openPoll">
        			<div class="question" style="background: #E6F1F6;
 padding-bottom: 15px;">
        				<span class="category">
        					<!-- 폴 카테고리 -->
        					<span style="padding-left: 15;display: block; float: left; ">
							  
							 </span>
							 <span>
							  <s:if test="categoryNumber == 1">
							    <img src="/LIP_Research/images/category/Love.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 2">
							    <img src="/LIP_Research/images/category/Car.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 3">
							     <img src="/LIP_Research/images/category/Movie.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 4">
							     <img src="/LIP_Research/images/category/IT.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 5">
							    <img src="/LIP_Research/images/category/Fashion.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 6">
							    <img src="/LIP_Research/images/category/Maternity.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 7">
							    <img src="/LIP_Research/images/category/Interior.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 8">
							    <img src="/LIP_Research/images/category/Tv.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 9">
							    <img src="/LIP_Research/images/category/Food.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 10">
							    <img src="/LIP_Research/images/category/Economy.gif" width="35px" height="35px" alt="point">  
							  </s:if>
							  <s:if test="categoryNumber == 11">
							    <img src="/LIP_Research/images/category/Finance.gif" width="35px" height="35px" alt="point">
							  </s:if>
							  <s:if test="categoryNumber == 12">
							    <img src="/LIP_Research/images/category/Etc.gif" width="35px" height="35px" alt="point">
							  </s:if>
							 </span>
        				</span>
        				<!-- 폴 질문 -->
        				<p style="cursor:pointer"><strong>[<s:property value="memberId" />] </strong><s:property value="pollQuestion"/> </p>
        				
        			</div>
        			<div class="choiceArea" style="display:block;">
        				<div class="choice">
        					<p><!-- 폴 상세질문 --><s:property value="pollExplain" /></p>
        					
        			<s:if test="pollViewType==2">
        				<!-- 사진형 문제 -->
        				<div class="imgbox">
        					<img alt='<s:property value="pollQuestion"/>' src="D://upload/question/<s:property value="questionLink" />" />
        				</div>
        				</s:if>
        				<s:if test="pollViewType==3">
        				<div class="moviebox">
        				        				<iframe width="560" height="315" src="http://www.youtube.com/embed/<s:property value="questionLink" />"  frameborder="0" allowfullscreen></iframe>
        				</div>
        				</s:if>
        					<div class="pollType<s:property value="pollQuestionType" />">
        					
        					
        						<ul>
        						<s:iterator value="exampleList">
        							<li>
        							<s:if test="pollQuestionType==1">
        								<!-- 단답형 보기 radio -->
        							<input name="answer[<s:property value="pollNumber" />]"  value="<s:property value="pollExampleNumber" />"  type="radio">
        							</s:if>
        							<s:elseif test="pollQuestionType==2">
        							<!-- 다답형 보기 checkbox -->
        							<input name="answer[<s:property value="pollNumber" />]"  value="<s:property value="pollExampleNumber" />" type="radio">
        							</s:elseif>
        							<label><s:property value="exampleContant" /></label>
        							</li>
        							</s:iterator>
        						</ul>
        				
        					</div>
        					
        				</div>			
						<ul>
						
						</ul>
        			</div>
        			
        		</section>
        	</div>
        	
        	
        	
        	</s:iterator>
        	</div>
        	 <div class="btnC" id="">
				<s:if test="isParticipated==2">
					<button type="button"  name="connect-btn"  id="subm"  class="btnTypeASize" value="<s:property value="surveyNumber" />">
						참여하기
					</button>
				</s:if>
				<s:else>
					<button  type="button"  id="" class="btnTypeASize">
							참여해주셔서 감사합니다													
					</button>
				</s:else>
			</div>
        </div>
       	
       	</form>
       	
       	<s:if test="isParticipated==1"> 
		  <script type="text/javascript">
			
			var exampleBoxDiv = $('#multiArea'+<s:property value="surveyNumber" />);
			
		    exampleBoxDiv.hide();
		  </script>
		  </s:if> 
        </s:iterator>
		
	</div>
	  
	<jsp:include page="/jsp/common/banner/banner.jsp" />
	
	<jsp:include page="/jsp/common/footer/footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(e) {
             $('div.cont3').click(function(){
	        
	  	  var body$ = $(this).siblings(".multiArea");
	  	 
	        if (body$.is(':hidden')) {
	          body$.show();
	        }else {
	          body$.hide();
	        }
	      });
             
             $('button.btnTypeASize').click(function(){
            	 
            	var surveyNumber	=	$(this).val();
            	var pollNumber		=$('#'+surveyNumber).val().split(",");
            	
            	var pollNum	=	new Array();
            	
            	 for(var i=0; i<pollNumber.length-1; i++){
            		pollNum.push(parseInt(pollNumber[i]));
            	} 
            	
            	 for(var i=0; i<pollNum.length; i++){
            		 value	=	'answer['+pollNum[i]+']';
            		
            		 var answers	=	$('input[name="'+value+'"]:checked');
            		 
            		
            		 if(answers.length==0){
            			 alert('항목을 선택해주세요.\n이벤트폴은 모든 항목을 선택하셔야 합니다');
            			 return false;
            		 }else{
            			 
            			
            			  var form = 'fm'+surveyNumber;
            			
            			  $('form[name="'+form+'"]').submit();
             			  
            		 }
                  }
             });
        });
		
	</script>
</body>
</html>