<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<link rel="stylesheet" href="/LIP_Research/css/survey/anythingslider.css"/>
<style type="text/css">
div#header2{ 
    padding : 20px;
    margin:auto;    
    text-align:center;
    width: 80%;
    font-size: 20px;
    font-weight: bold;
    color: black;   
}

#resultSee{
  /*  background-image:url(../images/survey/backresult.jpg) ; */
   background-repeat:no-repeat;
   background-size:840px;
   background-position:65px 36px;
    padding: 20px;
    margin: 30px;
    margin-top:-25px;
    width: 940px;
    height: 450px;
}
#slider{
    width: 720px;
    height: 570px;
    padding: 10px;
    left: auto;
}
</style>
<script type="text/javascript" src="/LIP_Research/js/model.js"></script>
<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.anythingslider.js"></script>
<script type="text/javascript">
function sendCon(){
	
	var no = document.myform.sel.value;
    var surveyNum = document.myform.surveyNum.value;
    
    sendRequest("ResultSurveyData.action?conNum="+no+"&surveyNum="+surveyNum, '', "", resultBack);    
}

function drawDiagonal(){
	   var index=0;    
	    var color = ["#0066CC", "#FF0000", "#006600", "#996633", "#CCFF00", "#9900FF", "#00FFFF"];
	    var form = document.form1;
	    
	    // 카운트 맥스
	    var countMax = form.countMax.value;
	    var length = 240/countMax;
	    // 문제 갯수
	    var qitems = form.qitems.value;
	    
	    // 문제 내용
	    var quiz=form.quiz.value;
	    quiz = quiz.slice(1, quiz.length-1);
	    quiz = quiz.split(",");
	    
	    var createDiv = new Array();
	    var createHeadDiv = new Array();
	    var createLi = new Array();
	    var createUl=document.createElement("ul");
	    createUl.id="slider";
	    
	     for(var i=0; i < qitems ; i++) {
	    	createLi[i] = document.createElement("li");
         }
	     for(var i=0; i < qitems ; i++) {
	            createDiv[i] = document.createElement("div");
	     }
	     for(var i=0; i < qitems ; i++) {
	    	 createHeadDiv[i] = document.createElement("div");
	    	 createHeadDiv[i].id="header2";
      }
	     
	    
	    // 답안 갯수 리스트
	    var anitems = form.anitems.value;
	    anitems = anitems.slice(1, anitems.length-1);
	    anitems = anitems.split(",");
	    
	    //답안 내용
	    var answer = form.answer.value;
	    answer = answer.slice(1, answer.length-1);
	    answer = answer.split(",");
	    
	    // 권역 갯수
	    var conpiece = form.conpiece.value;
	    conpiece = conpiece.slice(1, conpiece.length-1);
	    conpiece = conpiece.split(",");
	       
	    // 카운트 값
	    var count = form.count.value;
	    count = count.slice(1, count.length-1);
	    count = count.split(",");
	    
	    // 권역 이름
	    var cons = form.cons.value;
	    cons = cons.slice(1, cons.length-1);
	    cons = cons.split(",");
	    
	     /* var result = document.getElementById("resultSee"); */ 
	     
	     var i=0;
	     var x=0;
	     var aindex=0;
	     for(var q=0; q < qitems; q++)
	        {
	    	var result1=createLi[q];
	    	var result =createDiv[q];
	    	var result2 =createHeadDiv[q];
	    	
	        var canvas = document.createElement("canvas");
	        canvas.width="940";
	        canvas.height="330";
	        
	        var context = canvas.getContext('2d');
	        
	        context.save();
	        context.translate(10, 330);
	        
	        context.textAlign='center';
	        context.font="15px Arial";
	        /* context.fillText((q+1)+".  "+quiz[q], 100, -300);                                                      // 문제 내용 표시 */
	        result2.innerHTML = q+1+". "+ quiz[q];
	        
	        
	        if(q != 0)
	            i = parseInt(i + conpiece[q-1]);
	        for(var a=0; a<anitems[q]; a++ ,aindex++)
	            {
	            context.fillStyle = "#000000";
	            context.font="12px Arial";
	            context.fillText("*  "+answer[aindex], 700/(anitems[q])*(a)+40, -280);             // 답안표시
	            
	            for(var c=0; c < conpiece[q] ; c++, index++)
	            {     
	                  context.fillStyle = color[c%conpiece[q]];         
	                  context.fill(); 
	                  x=x+22;
	                  context.fillRect(0+x , 0, 20, -count[index]*length);
	                  context.font="12px Arial";
	                  context.fillText(cons[c%conpiece[q]+i], 0+x+10, -count[index]*length-20);              // 제한 항목 넣기
	                  context.fillText(count[index], 0+10+x, -count[index]*length-5);                                        // 숫자 넣기
	                  
	            }
	                x=x+(680/anitems[q]-conpiece[q]*22);
	        }
	        x=0;
	    context.restore();
	    /* result.appendChild(canvas); */
	    result.appendChild(canvas);
	    result1.appendChild(result2);
	    result1.appendChild(result);
	    createUl.appendChild(result1);
	    
	    }
	     
	     document.getElementById("resultSee").appendChild(createUl);
	     
	            $('#slider').anythingSlider({
	                buildNavigation     : false,
	                buildStartStop      : false
	                /* navigationFormatter : function(index, panel){
	                    return ['추가권역설정', '추가권역설정', '복합폴생성', '문제만들기'][index - 1];
	                } */
	            });
	     
}
</script>
</head>

<body>
    <jsp:include page="../common/menu_bar/user_menu.jsp" />
            <form name="myform">
                <br/>
               <center><b style="font-size: 15px;">&nbsp;&nbsp;보고 싶은 항목을 선택해주세요</b>&nbsp;&nbsp;
                <s:select  name="sel" headerValue='선택해주세요' headerKey='' list='surveyConstraintList' listValue='constraintName' listKey='constraintNumber' >
                </s:select>
                <input type="hidden" name="surveyNum" value="${surveyNum}">
               <input type="button" value="결과보기" onclick="sendCon()"/>
               </center>
               </form>
                <div id="resultSee">
                </div>
     <jsp:include page="../common/footer/footer1.jsp" />
</body>
</html>