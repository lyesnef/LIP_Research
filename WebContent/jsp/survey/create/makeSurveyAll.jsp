<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>설문 생성하기</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">

<style type="text/css">
div#head22{ 
	margin:auto;	
	text-align:center;
	width: 80%;
	font-size: 20px;
}
span#version{ 
	color: #777; 
	font: 15px verdana; 
}
div.title{
	font: bold 17px verdana;
	color: black;
	letter-spacing: .7px;
	margin-bottom: 20px;
	text-align: center;
}

html{
	overflow: hidden;
}
.setBasicTarget{
	overflow: scroll;
	overflow-y: auto;
	overflow-x: hidden;
}

.errorSet{
	background:transparent url(/LIP_Research/images/join/error.png) no-repeat top left;
    position:relative;
    top:0px;
    left:1px;
    width:20px;
    height:20px;
}
.completeSet{
	background:transparent url(/LIP_Research/images/join/checked.png) no-repeat top left;
    position:relative;
    top:0px;
    left:1px;
    width:20px;
    height:20px;
}
.ui-datepicker-week-end{color:red;}
.ui-datepicker-week-end .ui-state-default{color:red;}
</style>
<link rel="stylesheet" href="/LIP_Research/css/survey/anythingslider.css"/>
<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.anythingslider.js"></script>
<!-- calendar -->
<link type="text/css" href="/LIP_Research/images/join/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.core.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker.js"></script>
<script type="text/javascript" src="/LIP_Research/images/join/ui/ui.datepicker-ko.js"></script>
<script type="text/javascript" src="/LIP_Research/js/user/survey/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css" href="/LIP_Research/css/survey/jquery.lightbox-0.5.css" media="screen" />
<link href="/LIP_Research/css/survey/core.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/core-ui-select.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/jquery.scrollpane.css" media="screen" rel="stylesheet" type="text/css">
<!-- SCRIPT -->
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.mousewheel.js"></script>
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.scrollpane.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.core-ui-select.js"></script>
<script type="text/javascript">
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
	
	$(function(){
		$('#slider').anythingSlider({
			buildNavigation     : true,
			buildStartStop      : false,
			navigationFormatter : function(index, panel){
				return ['기본인원설정', '추가권역설정', '복합폴생성', '문제만들기', '설문만들기'][index - 1];
			}
		});
	});
	
});

	//제출하기
$(document).ready(function(){
	$('#submitSurveyBt').click(function(){
		//기본 페이지 설정	
		var limitNum = $('#limitParticipateNumber').val();
		var setNum = $('#setLimitNumber').val();
		var queVal = $('#questionCount').val();
		var queCnt = document.getElementsByName('queCnt');
		if(limitNum != setNum && setNum!=0){
			if(!confirm("기본 설정 인원과 대상인원이 같지 않습니다. 계속 하시겠습니까?")){
				alert("인원을 다시 설정해주세요.");
				for(var i=0; i<5; i++){
					var $link = $('#panelSpan'+(i+1));
		 			$link.removeClass();
		 			$link.addClass('errorSet');
				}
				return false;
			}else{
				jQuery.ajax({
					type:"POST",
					url:"CompleteQuestion.action",
					data: "limitParticipateNumber="+limitNum + "&setLimitNumber="+setNum+ "&questionCount="+queCnt.length,
					success:function(msg){
						$('#divPayment').empty().append(msg);
					}, error: function(xhr,status,error){
						alert(error);
					}
				});
				for(var i=0; i<5; i++){
					var $link = $('#panelSpan'+(i+1));
		 			$link.removeClass();
		 			$link.addClass('completeSet');
				}
				return false;
			}
		}else if(setNum==0){
			if(confirm("기본 인원 설정을 하지 않으셨습니다. 계속 하시겠습니까?")){
				jQuery.ajax({
					type:"POST",
					url:"CompleteQuestion.action",
					data: "limitParticipateNumber="+limitNum + "&setLimitNumber="+setNum+ "&questionCount="+queCnt.length,
					success:function(msg){
						$('#divPayment').empty().append(msg);
					}, error: function(xhr,status,error){
						alert(error);
					}
				});
				for(var i=0; i<5; i++){
					var $link = $('#panelSpan'+(i+1));
		 			$link.removeClass();
		 			$link.addClass('completeSet');
				}
			}else{
				alert("기본 설정을 해주세요.");
				for(var i=0; i<5; i++){
					var $link = $('#panelSpan'+(i+1));
		 			$link.removeClass();
		 			$link.addClass('errorSet');
				}
				return false;
			}
		}else{
			jQuery.ajax({
				type:"POST",
				url:"CompleteQuestion.action",
				data: "limitParticipateNumber="+limitNum + "&setLimitNumber="+setNum+ "&questionCount="+queVal,
				success:function(msg){
					$('#divPayment').empty().append(msg);
				}, error: function(xhr,status,error){
					alert(error);
				}
			});
			for(var i=0; i<5; i++){
				var $link = $('#panelSpan'+(i+1));
	 			$link.removeClass();
	 			$link.addClass('completeSet');
			}
			return false;
		}
	});
});

</script>
</head>
<body>

	<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
	
	<form method="POST" id="formSurvey" name="formSurvey" enctype="multipart/form-data">
	
		<div id="head22">
			<div class="title">Like It Perfectly<span id="version">( Make Survey )</span></div>
			<div align="center"><font color="red">${fieldErrors.paymentError}</font></div>
		</div>
	
		<ul id="slider">
	
			<li><div class="setBasicTarget"><jsp:include page="/jsp/survey/create/setBasicInfoTarget.jsp"/></div></li>
	
			<li><div class="setBasicTarget"><jsp:include page="/jsp/survey/create/setConstraint.jsp"/></div></li>
	
			<li><div class="setBasicTarget"><jsp:include page="/jsp/survey/create/makeMultiPollAll.jsp"/></div></li>
	
			<li><div class="setBasicTarget"><jsp:include page="/jsp/survey/create/makeQuestionAll.jsp"/></div></li>
	
			<li><div class="setBasicTarget">
				<div align="center" style="margin-top: 30px">
					<h2 >설문 작성 완료</h2>
    				<h3>모든 내용을 작성하시면 결제 페이지로 갑니다.</h3>
   				 </div>
   				 <br/><br/>
   				 <div align="center" id="divDateSelect">
   				 	<label>기간설정</label>
        			<input type="text" id="start_date" name="start_date" placeholder="시작일자"/> ~
        			<input type="text" id="end_date" name="end_date" placeholder="종료일자"/>
   				 </div>					
				<div class="b-row" style="width: 60%">
			        <label for="category" class="labelAddCons">카테고리 선택</label>
			        <select id="category" name="category">
					<s:iterator value="category">
						<option value="${categoryNumber}">
							<s:property value="categoryName" />
						</option>
					</s:iterator>
					</select>
   				 </div>		
				<div align="center">
   				 	<input type="button" id="submitSurveyBt" value=" 설문 가격 확인 "/>
   				 </div>
   				 <br/><br/>
				<script type="text/javascript">
					$(document).ready(function(){
						$('#category').coreUISelect();
					});
				
				
				</script>
   				<div align="center" id="divPayment"></div>
			</div>
		</ul>
	</form>		
	<jsp:include page="/jsp/common/footer/footer1.jsp" />

</body>
</html>