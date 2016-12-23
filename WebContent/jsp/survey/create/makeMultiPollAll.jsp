<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>폴 설정하기</title>
<!-- <link rel="stylesheet" href="/LIP_Research/css/style.css"> -->
<!-- CSS -->
<link href="/LIP_Research/css/survey/core.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/core-ui-select.css" media="screen" rel="stylesheet" type="text/css">
<link href="/LIP_Research/css/survey/jquery.scrollpane.css" media="screen" rel="stylesheet" type="text/css">
<!-- SCRIPT -->
<!-- <script src="/LIP_Research/js/common/jquery-1.8.1.js"></script> -->
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.mousewheel.js"></script>
<script src="/LIP_Research/js/user/survey/lib/jquery/plugins/jquery.scrollpane.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.core-ui-select.js"></script>
<!-- <script src="/LIP_Research/js/user/survey/jquery.progressbar.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.progressbar.min.js"></script> -->
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
var multiPollNum = 1;
    $(window).load(function () {
    	
    	
        $('#addPoll').coreUISelect(); 
    	$('#addPoll').change(function(){
    		var divPolls = document.getElementById('divAddPoll');
    		divPolls.innerHTML = "";
    		createPoll(this.value); 
    		$(function(){
    			$("dd:not(:first)").css("display","none");
    			$("dl dt").click(function(){
    				if($("+dd",this).css("display")=="none"){
    					$("dd").slideUp("slow");
    					$("+dd",this).slideDown("slow");
    					multiPollNum = this.title;
    				}
    			});
    			
    		});
    		
    		
    	});
    }); 
    
   
    function createPoll(val){
    	var cnt = 1;
    	$('#divAddPoll').append($("<dl id='dlAddPoll'/>"));
    	for(var i = 0; i<val; i++){
    		$('#dlAddPoll').append($("<dt title='" + cnt +"' id='dtAddPoll" + cnt +"'>Step " + cnt + "번 (Click!)</dt>"));
    		$('#dtAddPoll'+cnt).append($("<input style='float:right' type='button' id='dtAddPollBt"+ cnt +"' name='dtAddPollBt"+ cnt +"' onclick='dtAddPollBt("+ cnt +")' value=' 삭제하기 '/>"));
        	$('#dlAddPoll').append($("<dd id='ddAddPoll" + cnt +"'><p id='pAddPoll" + cnt + "'>복합 폴 " + cnt + "번</p></dd>"));
        	$('#pAddPoll' + cnt).append($("<input type='button' onclick='btPoll("+cnt+")' value=' 폴추가 '/>"));
        	    	
        	cnt++;
    	}
    }
    
    function dtAddPollBt(val){
    	$('#dtAddPoll' + val).remove();
    	$('#ddAddPoll' + val).remove();    	
    }
    
    function btPoll(val){
    	
   		$('#ddAddPoll' + val + '').append($("<div style='margin-right:10px' id='divPoll" + val + "'></div>"));
       	
       	jQuery.ajax({
   			type:"POST",
   			data : "pollCnt="+val,
   			url:"MakeMultiPoll.action",
   			success:function(msg){
   				$('#divPoll' + val + '').empty().append(msg);
   				
   				init(val);
   				
   			}, error: function(xhr,status,error){
   				alert("error");
   			}
   		}); 
       	
       	
       	$(function() {
       		
       	});
    	
    }
    
</script>
</head>
<body>
	<div align="center" style="margin-top: 30px">
		<h2 >이벤트 폴 설정</h2>
    	<h3>폴의 갯수를 선택해주세요.</h3>
    </div>
    <div class="b-row" style="width: 60%">
        <label for="addPoll" class="labelAddCons">이벤트 폴 수</label>
        <select class="b-core-ui-select__select" id="addPoll" name="addPoll">
            <option disabled="disabled" selected value="">선택해주세요.(이벤트 폴은 0~3개 입니다.)</option>
            <option value="0">Zero</option>
            <option value="1">One Complex Poll</option>
            <option value="2">Two Complex Polls</option>
            <option value="3">Three Complex Polls</option>
            
        </select>
    </div>
    <div id="divAddPoll">
    	
    </div>
</body>
</html>