<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>LIP Research - 개인폴만들기</title>
<link rel="stylesheet" href="../../css/poll.css" />
<link rel="stylesheet"  href="/LIP_Research/css/poll.css" />
<link rel="stylesheet" href="/LIP_Research/css/style.css" />
<link type="text/css" href="/LIP_Research/images/join/themes/base/ui.all.css" rel="stylesheet" />
</head>

<body >

<jsp:include page="../common/menu_bar/user_menu.jsp" /> 

<div id="body-section">
<form name="fm" method="post" enctype="multipart/form-data" 
       action="RegPoll.action" onSubmit="return checkForm(this);">

<div class="section">

	<div class="title"> 개인 폴 만들기</div>
    
</div>


<div class="section">

	<div class="sub1">
  
    	<div class="question">
              <input type="hidden" id="multi_answer_value" name="multi_answer_value" value="1" />
  <input type="hidden" id="question_type" name="question_type" value="1" />
  <input type="hidden" id="answer_type" name="answer_type" value="1" />
    <input type="hidden" id="message" name="message" value='<s:property value="message"/>' />
  <textarea name="question" rows="1"  id="question" placeholder="질문을 입력하세요.">${fieldErrors.question }</textarea>
  <div class="question_source">
    <ul class="tabmenu_poll">
            	
                <li>
                <a href="#" id="normalEx" name="question_rule"  class="active">
<span class="tab1">텍스트 설명 추가</span>
</a>
                </li>
                
                <li>
                <a href="#" id="picEx" name="question_rule">
<span class="tab1">사진 설명 추가</span>
</a>
</li>
                
                <li>
                <a href="#" id="movieEx" name="question_rule">
<span class="tab1">동영상 설명 추가</span></a></li>
            </ul>	
            </div>
            <div id="explain_detail1">
            		<textarea rows="3" placeholder="설명을 입력하세요." 
            		id="question_detail" name="question_detail">${fieldErrors.question_detail }</textarea>
            </div>
            
            <div style="display:none" id="explain_detail2">
            		<ul>
                    <li><a id="img_upload" href="#">이미지 업로드</a></li>
                    <li><a id="URL_upload" href="#">이미지 URL등록</a></li>
                    </ul>
                    
                    <div id="image_ex">
                    <input type="file" name="question_img_file" value="찾아보기" />
                    	<p>파일형식 : jpg, gif, png</p>
                        <p>최대 업로드 용량 : 100kbyte</p>
                    </div>
                    <div id="image_url" style="display:none">
                    <s:if test="fieldErrors.img_url">
                    	<input type="text" value="http://" name="img_url" />
                    	</s:if>
                    	<s:else>
                    	<input type="text" value="${fieldErrors.img_url}" name="img_url" />
                    	</s:else>
                    </div>
            </div>
            
            <div style="display:none" id="explain_detail3">
            		<label>유튜브</label><input type="text" placeholder="유튜브 동영상 경로" value="${fieldErrors.youtubefileURL}" name="youtubefileURL" />
            </div>
        </div>
    </div>
</div>

<div class="section">
	<div>
    	<label>답변 등록하기</label>
    </div>
	<div>
    	<ul class="tabmenu_answer">
        	<li>
            	<a href="#" onclick="insertAnswerType(1)" name="a-display-kind" class="active">
            <span>기본형</span>
            	</a>
            </li>
            <li><a href="#" onclick="insertAnswerType(2)" name="a-display-kind">
            <span>사진형</span>
            </a>
            </li>
            <li><a href="#" onclick="insertAnswerType(3)" name="a-display-kind" display-kind="TextOnly">
            <span>좋아요?싫어요?</span>
            </a>
            <li><a href="#" onclick="insertAnswerType(4)" name="a-display-kind" display-kind="TextOnly">
            <span>별점주기</span>
            </a>
            </li>
        </ul>
    </div>
    
    <div id="answerOption1">
    <table id="answer_list">
    	<tr id="answer1">
        	<td>답1</td>
            <td><input type="text" name="answer" id="answer_1" value="${fieldErrors.answer}"/></td>
            </tr>
            <tr id="answer2">
            	<td>답2</td>
                <td id="answer2"><input type="text" id="answer_2" name="answer" value="${fieldErrors.answer}"/></td>
           </tr>
     </table>
     <input type="button" id="insert_answer" value="답추가"/>
     <input type="button" id="delete_answer" value="답삭제" />
    </div>
    
    <div style="display:none" id="answerOption2">
    	<table id="pic_answer_tab">
        	<tr id="pic_answer_1">
            	<td rowspan="2">답1</td>
                <td><input type="text" name="picAnswer" value="${fieldErrors.picAnswer}" placeholder="답변1 설명" /></td>
            </tr>
            <tr>
            <td>
            <input type="file" name="picAnswerFile" /><p>${fieldErrors.picAnswerFile}</p>
            </td>
            </tr>
            
            <tr id="pic_answer_2">
            	<td rowspan="2">답2</td>
                <td><input type="text" name="picAnswer" value="${fieldErrors.picAnswer}" placeholder="답변2 설명" /></td>
            </tr>
            <tr>
            <td>
            <input type="file" name="picAnswerFile" /><p>${fieldErrors.picAnswerFile}</p>
            </td>
            </tr>
        	
        </table>
        <input type="button" id="insert_pic_answer" value="답추가" />
        <input type="button" id="delete_pic_answer" value="답삭제" />
        
    </div>
    
    <div style="display:none" id="answerOption3">
   	
      <img src="/LIP_Research/images/poll/facebook-like-buton.png" width="500" height="250" alt="좋아요?싫어요?"></div>
    
    <div style="display:none" id="answerOption4">
    
      <img src="/LIP_Research/images/poll/star_yes.png" width="100" height="100" alt="포인트있음">
      <img src="/LIP_Research/images/poll/star_yes.png" width="100" height="100" alt="포인트있음">
      <img src="/LIP_Research/images/poll/star_yes.png" width="100" height="100" alt="포인트있음">
 
      <img src="/LIP_Research/images/poll/star_no.png" width="100" height="100" alt="포인트없음">
      <img src="/LIP_Research/images/poll/star_no.png" width="100" height="100" alt="포인트없음"> </div>
    
    

	<div style="float:left">
    	폴 답변 중복선택 
        <span id="multi_answer">한 개만 선택하기</span>
    </div><br>
	<div style="display:block">
    	<select id="category" name="category">
    		<s:iterator value="category ">
        	<option value="${ categoryNumber}"><s:property value="categoryName" /></option>
        	</s:iterator>
        </select>
        <label>기간설정</label>
        
        <input type="text" id="start_date" name="start_date" style="width:100px"/> ~
        <input type="text" id="end_date" name="end_date" style="width:100px"/><p>${fieldErrors.start_date}${fieldErrors.end_date}</p>
    </div>
    <div class="pointOption">
    	<label>포인트를 제공합니까?</label>
        <label>예</label>
        <input type="radio" class="radiobox" id="point_yes" value="1" name="point_bet" />
        <label>아니오</label>
        <input type="radio" class="radiobox" id="point_no" value="2" name="point_bet" />
        <div id="point_detail" style="display:none">
        	<label>제공할 포인트</label>
            <input type="number" id="bettingPoint" name="bettingPoint" value="${fieldErrors.bettingPoint}"/>
            /현재포인트 :<s:property value="%{point_left}" />
        </div>
    </div>
    <div class="poll_comfirm">
    	<input type="submit" name="submit" value="폴등록" />
        <input type="button" name="toList" value="목록으로" />
   
    </div>
</div>
</form>
</div> 

 <jsp:include page="../common/banner/banner.jsp" />
<jsp:include page="../common/footer/footer.jsp" /> 

<script src="/LIP_Research/js/common/kw/makepoll.js"></script>
<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<!-- calendar -->

<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.core.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker-ko.js"></script>
<script type="text/javascript">
<!--
var memberPoint;

$(document).ready(function(){
	
	//날자선택
	$('#end_date').datepicker({
		changeMonth: true,	changeYear: true,
		beforeShow:function(){
			if($('#start_date').val()==null || $('#start_date').val()==""){
				$('#end_date').datepicker("disable");
				alert("시작일을 선택해주세요.");
				$('#end_date').datepicker("fold");
 			}
		},
		altField: '#datepicker', altFormat: 'yy-mm-dd',
		defaultDate: '+0m+0d', minDate: '+0d'
	});
	$('#start_date').datepicker({
		changeMonth: true,	changeYear: true,
		onSelect:function(selectedDate){
			$('#end_date').datepicker('option','minDate', $.datepicker.parseDate($.datepicker._defaults.dateFormat, selectedDate));
			$('#end_date').datepicker("enable");
		},
		altField: '#datepicker', altFormat: 'yy-mm-dd',
		defaultDate: '+0m+0d', minDate: '+0d'
 	});
	
	
	
});

$(document).ready(function(e) {
    init();
  /*   var message	=	$('#message').val();
    if(message){
    	
	alert(message);
} */
    memberPoint = <s:property value="#session.lipMember.memberPoint" />;
    
});

function checkForm(e){
	
	var form	=	document.fm;

	if($('#question').val()==null||$('#question').val()==""){
		alert('질문을 입력해주세요');
		return false;	
	}
	if($('#question_detail').val()==null||$('#question_detail').val()==""){
		alert('질문의 상세내용을 입력해주세요');
		return false;	
	}
	
	if($('#answer_type').val()==1){
		var arr	=	document.getElementsByName("answer");
		for(var i	=	0; i<arr.length; i++){
			if(arr[i].value==null||arr[i].value.length<1){
				alert('보기의 값을 입력해 주세요');
				return false;	
			}
		}
	}
	
	if($('#answer_type').val()==2){
		var picArr	=	document.getElementsByName("picAnswer");
		for(var i	=	0; i<picArr.length; i++){
		if(picArr[i].value==null||picArr[i].value.length<1){
			alert('사진보기의 값을 입력해 주세요');
			return false;	
			}
		}
	}
	
	if(form.start_date.value==null||form.start_date.value==''){
		alert('시작일을 입력해주세요');
		return false;	
	}
	
	if(form.end_date.value==null||form.end_date.value==''){
		alert('종료일을 입력해주세요');
		return false;	
	}
	var checkedRadio	=	$('.radiobox:checked').val();
	if(checkedRadio==1){
		var value	=	$('input[name="bettingPoint"]').val();
		if(value<10||value==""){
			alert('포인트는 10포인트 이상 부터 사용할 수 있습니다.');
			return false;	
		}else if(value>memberPoint){
			alert('배당 포인트가 회원 님이 보유한 포인트 잔액보다 큽니다.');
			return false;
		}
	}
	return true;
}

//-->
</script>

</body>
</html>