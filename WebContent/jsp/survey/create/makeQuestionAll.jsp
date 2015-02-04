<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>문제 설정하기</title>

<link href="/LIP_Research/css/survey/core.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/core-ui-select.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/jquery.scrollpane.css" media="screen" rel="stylesheet" type="text/css">
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.mousewheel.js"></script>
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.scrollpane.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.core-ui-select.js"></script>

<style type="text/css">

dl{
	background:hsb(0%,0%,100%);
	width:90%;
	margin:50px auto;
}
dt{
	line-height:35px;
	font-size:large;
	text-indent:3em;
	font-weight:bold;
	font-family: '맑은 고딕', 'Malgun Gothic', verdana;
	color:white;
	height:35px;
	background:url("/LIP_Research/images/common/Black_Background.jpg");
}
dd{
	margin:0;
	height:auto;
	background:url("/LIP_Research/images/common/button_bg.png");
	color:hsl(0,0%,0%);
}
dd p{
	margin:0;
	text-indent:1em;
	padding:20px;
}
</style>
<script>

    $(window).load(function () {
    	
    	
        $('#addQue').coreUISelect(); 
    	$('#addQue').change(function(){
    		var divPolls = document.getElementById('divAddQue');
    		divPolls.innerHTML = "";
    		createQue(this.value); 
    		$(function(){
    			$("dd:not(:first)").css("display","none");
    			$("dl dt").click(function(){
    				if($("+dd",this).css("display")=="none"){
    					$("dd").slideUp("slow");
    					$("+dd",this).slideDown("slow");
    				}
    			});
    			
    		});
    		
    		
    	});
    }); 
    
   
    function createQue(val){
    	var cnt = 1;
    	$('#divAddQue').append($("<dl id='dlAddQue'/>"));
    	for(var i = 0; i<val; i++){
    		$('#dlAddQue').append($("<dt title='" + cnt +"' id='dtAddQue" + cnt +"'>Step " + cnt + "번 (Click!)</dt>"));
    		$('#dtAddQue'+cnt).append($("<input style='float:right' type='button' id='dtAddQueBt"+ cnt +"' name='dtAddQueBt"+ cnt +"' onclick='dtAddQueBt("+ cnt +")' value=' 삭제하기 '/>"));
    		$('#dlAddQue').append($("<dd id='ddAddQue" + cnt +"'><p id='pAddQue" + cnt + "'>문제 " + cnt + "번</p></dd>"));
        	$('#pAddQue' + cnt).append($("<input type='button' onclick='btQue("+cnt+")' value=' 문제추가 '/>"));
        	    	
        	cnt++;
    	}
    }
    
    function dtAddQueBt(val){
    	$('#dtAddQue' + val).remove();
    	$('#ddAddQue' + val).remove();    	
    }
    
    function btQue(val){
    	
   		$('#ddAddQue' + val + '').append($("<div style='margin-right:10px' id='divQue" + val + "'></div>"));
       	
       	jQuery.ajax({
   			type:"POST",
   			data : "queCnt="+val,
   			url:"MakeQuestion.action",
   			success:function(msg){
   				$('#divQue' + val + '').empty().append(msg);
   				init('Que'+val);
   			}, error: function(xhr,status,error){
   				alert("error");
   			}
   		}); 
    	
    }
    
</script>
</head>
<body>	
	<div align="center" style="margin-top: 30px">
		<h2 >문제 설정</h2>
    	<h3>문제의 갯수를 선택해주세요.</h3>
    </div>
    <div class="b-row" style="width: 60%">
        <label for="addQue" class="labelAddCons">설문 문제 수</label>
        <select class="b-core-ui-select__select" id="addQue" name="addQue">
            <option disabled="disabled" selected value="">선택해주세요.(문제는 0~20개 입니다.)</option>
            <option value="0">Zero</option>
            <option value="1">One Question</option>
            <option value="2">Two Questions</option>
            <option value="3">Three Questions</option>
            <option value="4">Four Questions</option>
            <option value="5">Five Questions</option>
            <option value="6">Six Questions</option>
            <option value="7">Seven Questions</option>
            <option value="8">Eight Questions</option>
            <option value="9">Nine Questions</option>
            <option value="10">Ten Questions</option>
            <option value="11">Eleven Questions</option>
            <option value="12">Twelve Questions</option>
            <option value="13">Thirteen Questions</option>
            <option value="14">Fourteen Questions</option>
            <option value="15">Fifteen Questions</option>
            <option value="16">Sixteen Questions</option>
            <option value="17">Seventeen Questions</option>
            <option value="18">Eighteen Questions</option>
            <option value="19">Nineteen Questions</option>
            <option value="20">Twenty Questions</option>
            
        </select>
    </div>
    <div id="divAddQue">
    	
    </div>
</body>
</html>