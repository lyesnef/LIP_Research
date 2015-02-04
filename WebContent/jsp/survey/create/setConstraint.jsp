<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!-- CSS -->
<script src="/LIP_Research/js/user/survey/jquery.progressbar.js"></script>
<script src="/LIP_Research/js/user/survey/jquery.progressbar.min.js"></script>
<style type="text/css">
.textCons{
	margin: 0px 0px 10px 20px; 
	width: 300px;
}
.textExam{
	margin: 0px 0px 10px 20px; 
	width: 200px;
}
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
        $('#addCons').coreUISelect();
    	$('#addCons').change(function(){
    		var divCons = document.getElementById('divAddCons');
    		divCons.innerHTML = "";
    		createDiv(this.value); 
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
    function createDiv(val){
    	var cnt = 1;
    	$('#divAddCons').append($("<dl id='dlAddCons'/>"));
    	for(var i = 0; i<val; i++){
    		$('#dlAddCons').append($("<dt id='dtAddCons" + cnt +"'>Step " + cnt + "번 (Click!)</dt>"));
    		$('#dtAddCons'+cnt).append($("<input style='float:right' type='button' id='dtAddConsBt"+ cnt +"' name='dtAddConsBt"+ cnt +"' onclick='dtAddConsBt("+ cnt +")' value=' 삭제하기 '/>"));
        	$('#dlAddCons').append($("<dd id='ddAddCons" + cnt +"'><p id='pAddCons" + cnt + "'>권역 설정" + cnt + "번</p></dd>"));
        	$('#ddAddCons' + cnt).append($("<label for='labelAddCons'>권역명</label>"));
        	$('#ddAddCons' + cnt).append($("<input class='textCons' id='textAddCons" + cnt + "' name='textAddCons" + cnt + "' type='text' />"));
    		$('#ddAddCons' + cnt).append($("<input type='button' onclick='btCons("+cnt+")' value=' 보기추가 '/>"));
        	/* $('#ddAddCons' + cnt).append($("<input type='hidden' value='0' id='hiddenCons"+ cnt + "'/>")); */
        	cnt++;
    	}
    }
   
    function dtAddConsBt(val){
    	$('#dtAddCons' + val).remove();
    	$('#ddAddCons' + val).remove();    	
    }
    
    function btCons(val){
    	var btCntDel = document.getElementsByName('example' + val);
    	
    	var spanVal = btCntDel.length;
    	btCntDel = btCntDel.length + 1;
    	if(btCntDel > 5){
    		alert("권역설정명은 5개 이상 만들수 없습니다.");
    		return false;
    	}else{
    		var delVal = val + "-" + btCntDel;
    		$('#ddAddCons' + val).append($("<div style='margin-right:10px' id='divExam" + delVal + "'></div>"));
        	$('#divExam' + val + "-" + btCntDel + '').append($("<label id='labelExam" + val +"' style='margin-left:20px'>권역설정명</label>"));
        	$('#divExam' + val + "-" + btCntDel + '').append($("<input type='text' class='textExam' id='example" + val +"' name='example" + val +"' />"));
        	$('#divExam' + val + "-" + btCntDel +'').append($("<span id='spanBar" + delVal + "' name='spanBar[" + parseInt(spanVal) + "]'>0</span>"));
        	$('#divExam' + val + "-" + btCntDel +'').append($("<a id='minusBar" + delVal + "'><img src='/LIP_Research/images/survey/previous.png' /></a>"));
        	$('#divExam' + val + "-" + btCntDel +'').append($("<a id='plusBar" + delVal + "'><img src='/LIP_Research/images/survey/next.png'/></a>"));
        	$('#divExam' + val + "-" + btCntDel +'').append($("<input type='button' id='" + delVal + "' onclick='delExam(this)' value=' 보기삭제 '/>"));
        	$('#divExam' + val + "-" + btCntDel +'').append($("<input type='hidden' id='hiddenBar" + delVal + "' name='hiddenBar" + delVal + "' value='0'/>"));
        	
        	var imageBarVal = 0;
        	$(function() {
        		
    	    	$('#spanBar' + delVal).progressBar({barImage:'/LIP_Research/images/common/progressbg_green.gif'});
    	    	$('#plusBar' + delVal + '').click(function(){
    	    		var total = 0;
    	    		for(var i=0;i<5; i++){
    	    			var thisVal = $('#hiddenBar'+val+'-'+(i+1)).val();
    	    			if(thisVal != null){
    	    				total += parseInt(thisVal);
    	    			}    	    			
    	    		}
    	    		if((total)==parseInt(100)){
    	    			alert("권역 100%입니다.");
    	    		}else{
    	    			imageBarVal = parseInt(imageBarVal) + parseInt(10);
    	    			$('#hiddenBar'+delVal).val(imageBarVal);
    	    			$('#spanBar' + delVal + '').progressBar(imageBarVal);
    	    			barVal[val] = parseInt(barVal[val]) + parseInt(10);
    	    			var barRealVal = document.getElementById('spanBar' + delVal).value;
    	    			barRealVal = imageBarVal;
    	    		}
    	    		
    	    	});
    	    	$('#minusBar' + delVal + '').click(function(){
    	    		if(imageBarVal==0){
    	    			alert("권역설정 0%입니다.");
    	    		}else{
    	    			imageBarVal = parseInt(imageBarVal) - parseInt(10);
    	    			$('#hiddenBar'+delVal).val(imageBarVal);
    	    			$('#spanBar' + delVal + '').progressBar(imageBarVal);
    	    			barVal[val] = parseInt(barVal[val]) - parseInt(10);
    	    			var barRealVal = document.getElementById('spanBar' + delVal).value;
    	    			barRealVal = imageBarVal;
    	    		}
    	    	});
    	    });
    	} 	
    }
    
   
    function delExam(num){
    	var thisVal = $('#hiddenBar'+num.id).val();
    	var barRealVal = document.getElementById('spanBar' + num.id).value;
    	barRealVal -= thisVal;
    	$('#divExam' + num.id +'').remove();    	
    }
    
</script>
</head>
<body>
	<%-- <jsp:include page="/jsp/common/menu_bar/user_menu.jsp" /> --%>
	
	<div align="center" style="margin-top: 30px">
		<h2 >추가 권역 설정</h2>
    	<h3>추가 권역 갯수를 선택해주세요.</h3>
    </div>
    <form method="POST" id="setCons" name="setCons" action="MakeMultiPoll.action">
    <div class="b-row" style="width: 60%">
        <label for="addCons" class="labelAddCons">추가 조건 수</label>
        <select class="b-core-ui-select__select" id="addCons" name="addCons">
            <option disabled="disabled" selected value="">선택해주세요.(추가 조건은 0~9개 입니다.)</option>
            <option value="0">Zero</option>
            <option value="1">One Constraint Condition</option>
            <option value="2">Two Constraint Conditions</option>
            <option value="3">Three Constraint Conditions</option>
            <option value="4">Four Constraint Conditions</option>
            <option value="5">Five Constraint Conditions</option>
            <option value="6">Six Constraint Conditions</option>
            <option value="7">Seven Constraint Conditions</option>
            <option value="8">Eight Constraint Conditions</option>
            <option value="9">Nine Constraint Conditions</option>
        </select>
    </div>
    <div id="divAddCons">
    	
    </div>
   
	<!-- <div align="center"><input type="submit" value="다음"/></div> -->
	 
	<input type='hidden' value='0' id='hiddenCons1'/>
	<input type='hidden' value='0' id='hiddenCons2'/>
	<input type='hidden' value='0' id='hiddenCons3'/>
	<input type='hidden' value='0' id='hiddenCons4'/>
	<input type='hidden' value='0' id='hiddenCons5'/>
	<input type='hidden' value='0' id='hiddenCons6'/>
	<input type='hidden' value='0' id='hiddenCons7'/>
	<input type='hidden' value='0' id='hiddenCons8'/>
	<input type='hidden' value='0' id='hiddenCons9'/>
	<script type="text/javascript">
		var barVal = new Array();
		barVal[1] = document.getElementById('hiddenCons1').value;
		barVal[2] = document.getElementById('hiddenCons1').value;
		barVal[3] = document.getElementById('hiddenCons1').value;
		barVal[4] = document.getElementById('hiddenCons1').value;
		barVal[5] = document.getElementById('hiddenCons1').value;
		barVal[6] = document.getElementById('hiddenCons1').value;
		barVal[7] = document.getElementById('hiddenCons1').value;
		barVal[8] = document.getElementById('hiddenCons1').value;
		barVal[9] = document.getElementById('hiddenCons1').value;
	</script>
	</form>
	<%-- <jsp:include page="/jsp/common/footer/footer.jsp" /> --%>
</body>
</html>