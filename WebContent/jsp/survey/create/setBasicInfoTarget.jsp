<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<script type="text/javascript">
function changeVal(){
	var peopleField = document.getElementById('selectPeople');
	var legendCreate = document.createElement('legend');
	peopleField.innerHTML = "";
	legendCreate.innerHTML = "인원을 선택하세요.";
	legendCreate.setAttribute("class", "legendCss");
	peopleField.appendChild(legendCreate);
	var ageText = new Array();
	var ageNumber = new Array();
	var ageConut = 0;
	var regionText = new Array();
	var regionNumber = new Array();
	var regionCount = 0;
	var genderText = new Array();
	var genderNumber = new Array();
	var genderCount = 0;
	
	var ageVal = document.getElementsByName('ageList');
	for(var i=0; i<ageVal.length; i++){
		if(ageVal[i].checked==true){
			ageText[ageConut] = ageVal.item(i).value;
			ageNumber[ageConut] = i+1;
			ageConut++;
		}
	}
	var regionVal = document.getElementsByName('regionList');
	for(var i=0; i<regionVal.length; i++){
		if(regionVal[i].checked==true){
			regionText[regionCount] = regionVal.item(i).value;
			regionNumber[regionCount] = i+1;
			regionCount++;
		}
	}
	var genderVal = document.getElementsByName('genderList');
	for(var i=0; i<genderVal.length; i++){
		if(genderVal[i].checked==true){
			genderText[genderCount] = genderVal.item(i).value;
			genderNumber[genderCount] = i+1;
			genderCount++;
		}
	}
	
	//나이 데이터 베이스 넘버 값으로 배열 초기화
	ageNumber = new Array();
	<s:iterator value='ageList' status='ageSet'>
		ageNumber["${ageSet.index}"] = "<s:property value='setConstraintNumber'/>";
	</s:iterator>
	//지역 데이터 베이스 넘버 값으로 배열 초기화
	regionNumber = new Array();
	<s:iterator value='regionList' status='regionSet'>
		regionNumber["${regionSet.index}"] = "<s:property value='setConstraintNumber'/>";
	</s:iterator>	
	//성별 데이터 베이스 넘버 값으로 배열 초기화
	genderNumber = new Array();
	<s:iterator value='genderList' status='genderSet'>
		genderNumber["${genderSet.index}"] = "<s:property value='setConstraintNumber'/>";
	</s:iterator>	
	
	var hiddenSetBasicCntVal = document.getElementById('hiddenSetBasicCntVal');
	//권역 3개에 대한 텍스트 만들기
	if(ageText.length > 0 && regionText.length == 0 && genderText.length == 0){
		//Age만 있을 경우
		hiddenSetBasicCntVal.value = 1;
		var resultAge = new Array();
		for(var i = 0; i<ageText.length; i++){
			resultAge[i] = ageText[i];
			var divCreate = document.createElement('span');
			divCreate.setAttribute("class", "nameSpan");
			var labelCreate = document.createElement('label');
			var textCreate = document.createElement('input');
			var hiddenCreate = document.createElement('input');
			
			textCreate.type = "text";
			textCreate.id = "textBox";
			textCreate.name = "textBox";
			textCreate.value = 0;
			textCreate.setAttribute("onchange","textChange(this)");
			textCreate.setAttribute("size","10px");
			hiddenCreate.type = "hidden";
			hiddenCreate.id = "hiddenBox";
			hiddenCreate.name = "hiddenBox";
			hiddenCreate.value = ageNumber[i];
			labelCreate.setAttribute("class","labelCons");
			var nameText = document.createElement('input');
			nameText.type = "hidden";
			nameText.id = "textName";
			nameText.name = "textName";
			nameText.value = resultAge[i];
			divCreate.appendChild(nameText);
			labelCreate.innerHTML = resultAge[i];
			divCreate.appendChild(labelCreate);
			divCreate.appendChild(textCreate);
			divCreate.appendChild(hiddenCreate);
			peopleField.appendChild(divCreate);
		}
		
		
		
	}else if(ageText.length > 0 && regionText.length > 0 && genderText.length == 0){
		//Age, Region 만 있을 경우
		
		hiddenSetBasicCntVal.value = 2;
		var resultAge = new Array();
		var rCnt = 0;
		for(var i = 0; i<ageText.length; i++){
			for(var j = 0; j<regionText.length; j++){
				resultAge[rCnt] = ageText[i] + " / " + regionText[j];
				var divCreate = document.createElement('span');
				divCreate.setAttribute("class", "nameSpan");
				var labelCreate = document.createElement('label');
				var textCreate = document.createElement('input');
				var hiddenCreate = document.createElement('input');
				textCreate.type = "text";
				textCreate.id = "textBox";
				textCreate.name = "textBox";
				textCreate.value = 0;
				textCreate.setAttribute("onchange","textChange(this)");
				textCreate.setAttribute("size","10px");
				hiddenCreate.type = "hidden";
				hiddenCreate.id = "hiddenBox";
				hiddenCreate.name = "hiddenBox";
				hiddenCreate.value = ageNumber[i] + "/" + regionNumber[j];
				labelCreate.setAttribute("class","labelCons");
				var nameText = document.createElement('input');
				nameText.type = "hidden";
				nameText.id = "textName";
				nameText.name = "textName";
				nameText.value = resultAge[rCnt];
				divCreate.appendChild(nameText);
				labelCreate.innerHTML = resultAge[rCnt];
				divCreate.appendChild(labelCreate);
				divCreate.appendChild(textCreate);
				divCreate.appendChild(hiddenCreate);
				peopleField.appendChild(divCreate);
			}
		}
		
		
	}else if(ageText.length > 0 && regionText.length > 0 && genderText.length > 0){
		//전부 존재할 경우
		
		hiddenSetBasicCntVal.value = 3;
		var resultAge = new Array();
		var rCnt = 0;
		for(var i = 0; i<ageText.length; i++){
			for(var j = 0; j<regionText.length; j++){
				for(var k=0; k<genderText.length; k++){
					resultAge[rCnt] = ageText[i] + " / " + regionText[j] + " / " + genderText[k];
					var divCreate = document.createElement('span');
					divCreate.setAttribute("class", "nameSpan");
					var labelCreate = document.createElement('label');
					var textCreate = document.createElement('input');
					var hiddenCreate = document.createElement('input');
					textCreate.type = "text";
					textCreate.id = "textBox";
					textCreate.name = "textBox";
					textCreate.value = 0;
					textCreate.setAttribute("onchange","textChange(this)");
					textCreate.setAttribute("size","10px");
					hiddenCreate.type = "hidden";
					hiddenCreate.id = "hiddenBox";
					hiddenCreate.name = "hiddenBox";
					hiddenCreate.value = ageNumber[i] + "/" + regionNumber[j] + "/" + genderNumber[k];
					labelCreate.setAttribute("class","labelCons");
					var nameText = document.createElement('input');
					nameText.type = "hidden";
					nameText.id = "textName";
					nameText.name = "textName";
					nameText.value = resultAge[rCnt];
					divCreate.appendChild(nameText);
					labelCreate.innerHTML = resultAge[rCnt];
					divCreate.appendChild(labelCreate);
					divCreate.appendChild(textCreate);
					divCreate.appendChild(hiddenCreate);
					peopleField.appendChild(divCreate);
				}
			}
		}
		
		
	}else if(ageText.length == 0 && regionText.length > 0 && genderText.length == 0){
		//Region만 존재할 경우
		
		hiddenSetBasicCntVal.value = 1;
		var resultRegion = new Array();
		for(var j = 0; j<regionText.length; j++){
			resultRegion[j] = regionText[j];
			var divCreate = document.createElement('span');
			divCreate.setAttribute("class", "nameSpan");
			var labelCreate = document.createElement('label');
			var textCreate = document.createElement('input');
			var hiddenCreate = document.createElement('input');
			textCreate.type = "text";
			textCreate.id = "textBox";
			textCreate.name = "textBox";
			textCreate.value = 0;
			textCreate.setAttribute("onchange","textChange(this)");
			textCreate.setAttribute("size","10px");
			hiddenCreate.type = "hidden";
			hiddenCreate.id = "hiddenBox";
			hiddenCreate.name = "hiddenBox";
			hiddenCreate.value = regionNumber[j];
			labelCreate.setAttribute("class","labelCons");
			var nameText = document.createElement('input');
			nameText.type = "hidden";
			nameText.id = "textName";
			nameText.name = "textName";
			nameText.value = resultRegion[j];
			divCreate.appendChild(nameText);
			labelCreate.innerHTML = resultRegion[j];
			divCreate.appendChild(labelCreate);
			divCreate.appendChild(textCreate);
			divCreate.appendChild(hiddenCreate);
			peopleField.appendChild(divCreate);
		}
		
		
		
	}else if(ageText.length == 0 && regionText.length > 0 && genderText.length > 0){
		//Region, Gender만 존재할 경우
		
		hiddenSetBasicCntVal.value = 2;
		var resultAge = new Array();
		var rCnt = 0;
		for(var j = 0; j<regionText.length; j++){
			for(var k=0; k<genderText.length; k++){
				resultAge[rCnt] = regionText[j] + " / " + genderText[k];
				var divCreate = document.createElement('span');
				divCreate.setAttribute("class", "nameSpan");
				var labelCreate = document.createElement('label');
				var textCreate = document.createElement('input');
				var hiddenCreate = document.createElement('input');
				textCreate.type = "text";
				textCreate.id = "textBox";
				textCreate.name = "textBox";
				textCreate.value = 0;
				textCreate.setAttribute("onchange","textChange(this)");
				textCreate.setAttribute("size","10px");
				hiddenCreate.type = "hidden";
				hiddenCreate.id = "hiddenBox";
				hiddenCreate.name = "hiddenBox";
				hiddenCreate.value = regionNumber[j] + "/" + genderNumber[k];
				labelCreate.setAttribute("class","labelCons");
				var nameText = document.createElement('input');
				nameText.type = "hidden";
				nameText.id = "textName";
				nameText.name = "textName";
				nameText.value = resultAge[rCnt];
				divCreate.appendChild(nameText);
				labelCreate.innerHTML = resultAge[rCnt];
				divCreate.appendChild(labelCreate);
				divCreate.appendChild(textCreate);
				divCreate.appendChild(hiddenCreate);
				peopleField.appendChild(divCreate);
			}
		}
		
		
	}else if(ageText.length == 0 && regionText.length == 0 && genderText.length > 0){
		//Gender만 있을 경우
		
		hiddenSetBasicCntVal.value = 1;
		var resultGender = new Array();
		for(var k=0; k<genderText.length; k++){
			resultGender[k] = genderText[k];
			var divCreate = document.createElement('span');
			divCreate.setAttribute("class", "nameSpan");
			var labelCreate = document.createElement('label');
			var textCreate = document.createElement('input');
			var hiddenCreate = document.createElement('input');
			textCreate.type = "text";
			textCreate.id = "textBox";
			textCreate.name = "textBox";
			textCreate.value = 0;
			textCreate.setAttribute("onchange","textChange(this)");
			textCreate.setAttribute("size","10px");
			hiddenCreate.type = "hidden";
			hiddenCreate.id = "hiddenBox";
			hiddenCreate.name = "hiddenBox";
			hiddenCreate.value = genderNumber[k];
			labelCreate.setAttribute("class","labelCons");
			var nameText = document.createElement('input');
			nameText.type = "hidden";
			nameText.id = "textName";
			nameText.name = "textName";
			nameText.value = resultGender[k];
			divCreate.appendChild(nameText);
			labelCreate.innerHTML = resultGender[k];
			divCreate.appendChild(labelCreate);
			divCreate.appendChild(textCreate);
			divCreate.appendChild(hiddenCreate);
			peopleField.appendChild(divCreate);
		}
		
		
		
	}else if(ageText.length > 0 && regionText.length == 0 && genderText.length > 0){
		//Age, Gender만 있을 경우
		
		hiddenSetBasicCntVal.value = 2;
		var resultAge = new Array();
		var rCnt = 0;
		for(var i = 0; i<ageText.length; i++){
			for(var k=0; k<genderText.length; k++){
				resultAge[rCnt] = ageText[i] + " / " + genderText[k];
				var divCreate = document.createElement('span');
				divCreate.setAttribute("class", "nameSpan");
				var labelCreate = document.createElement('label');
				var textCreate = document.createElement('input');
				var hiddenCreate = document.createElement('input');
				textCreate.type = "text";
				textCreate.id = "textBox";
				textCreate.name = "textBox";
				textCreate.value = 0;
				textCreate.setAttribute("onchange","textChange(this)");
				textCreate.setAttribute("size","10px");
				hiddenCreate.type = "hidden";
				hiddenCreate.id = "hiddenBox";
				hiddenCreate.name = "hiddenBox";
				hiddenCreate.value = ageNumber[i] + "/" +  genderNumber[k];
				labelCreate.setAttribute("class","labelCons");
				var nameText = document.createElement('input');
				nameText.type = "hidden";
				nameText.id = "textName";
				nameText.name = "textName";
				nameText.value = resultAge[rCnt];
				divCreate.appendChild(nameText);
				labelCreate.innerHTML = resultAge[rCnt];
				divCreate.appendChild(labelCreate);
				divCreate.appendChild(textCreate);
				divCreate.appendChild(hiddenCreate);
				peopleField.appendChild(divCreate);
			}
		}
		
		
	}else if(ageText.length == 0 && regionText.length == 0 && genderText.length == 0){
		alert("모든 조건을 해제하셨습니다.");
		hiddenSetBasicCntVal.value = 0;
	}
	var setNum = document.getElementById('setLimitNumber');
	setNum.value = 0;
	return false;
}

function cntNumPlus(){
	var cnt = document.getElementById('cntNumber');
	var textBox = document.getElementsByName('textBox');
	var limitNum = document.getElementById('limitParticipateNumber').value;
	var setNum = document.getElementById('setLimitNumber');
	var totalNum;
	var checkNum;
	if(textBox == null){
		alert("조건을 먼저 생성해주세요.");
	}else if(cnt.value == "" || cnt.value == null){
		alert("인원 수를 설정해주세요.");
	}else{
		for(var i=0; i<textBox.length; i++){
			totalNum = 0;
			for(var j=0; j<textBox.length; j++ ){
				totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
				checkNum = totalNum;
				if(parseInt(checkNum) + parseInt(cnt.value) >= parseInt(limitNum)){
					totalNum = 0;
					for(var j=0; j<textBox.length; j++ ){
						totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
					}
					setNum.value = totalNum;
					alert("선택하신 인원을 초과합니다.");
					return false;
				}
			}
			if(textBox[i].value == null || textBox[i].value == ""){
				textBox[i].value = parseInt(cnt.value);
			}else{
				textBox[i].value = parseInt(textBox[i].value) + parseInt(cnt.value);
			}			
		}
		totalNum = 0;
		for(var j=0; j<textBox.length; j++ ){
			totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
		}
		setNum.value = totalNum;
	}
}
function cntNumMinus(){
	var cnt = document.getElementById('cntNumber');
	var textBox = document.getElementsByName('textBox');
	var setNum = document.getElementById('setLimitNumber');
	var totalNum;
	if(textBox.length == 0){
		alert("조건을 먼저 생성해주세요.");
	}else if(cnt.value == "" || cnt.value == null){
		alert("인원 수를 설정해주세요.");
	}else{
		for(var i=0; i<textBox.length; i++){
			if(textBox[i].value == null || textBox[i].value == "" || textBox[i].value <= 0){
				totalNum = 0;
				for(var j=0; j<textBox.length; j++ ){
					totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
				}
				setNum.value = totalNum;
				alert("인원은 음수가 될 수 없습니다.");
				return false;
			}else{
				textBox[i].value = parseInt(textBox[i].value) - parseInt(cnt.value);
			}
		}
	}
	totalNum = 0;
	for(var j=0; j<textBox.length; j++ ){
		totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
	}
	setNum.value = totalNum;
}
function textChange(thisVal){
	var textBox = document.getElementsByName('textBox');
	var limitNum = document.getElementById('limitParticipateNumber').value;
	var setNum = document.getElementById('setLimitNumber');
	var totalNum = 0;
	for(var j=0; j<textBox.length; j++ ){
		totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
	}
	if(totalNum > limitNum){
		alert("인원 수 초과 입니다.");
		thisVal.value = limitNum - (totalNum - thisVal.value);
		totalNum = 0
		for(var j=0; j<textBox.length; j++ ){
			totalNum = parseInt(totalNum) + parseInt(textBox[j].value);
		}
		setNum.value = totalNum;
	}else{
		setNum.value = totalNum;
	}
	
}

function distibution(){
	var limitNum = document.getElementById('limitParticipateNumber').value;
	var textBox = document.getElementsByName('textBox');
	var setNum = document.getElementById('setLimitNumber');
	var divisionNum;
	if(textBox.length == 0){
		alert("조건을 생성해주세요.");
	}else{
		divisionNum = parseInt(limitNum / textBox.length);
		alert("분배 인원은 " + divisionNum + "명 입니다.");
		for(var i=0; i<textBox.length; i++){
			textBox[i].value = divisionNum;
		}
		var totalNum = 0;
		for(var i = 0; i<textBox.length; i++){
			totalNum = parseInt(totalNum) + parseInt(textBox[i].value);
		}
		setNum.value = totalNum;
		alert("총 설정 인원은 " + totalNum + "명 입니다.");
	}
}
$(function() {
    $('#lightGall a').lightBox();
});
</script>
<style type="text/css">
.labelCss{
	position:relative;
    text-align:left;
    background-color:#f0f0f0;
    color:#666;
    font-size:15px;
    text-shadow:1px 1px 1px #fff;
    font-weight:bold;
    float:left;
    width:97%;
    padding:5px 0px 5px 10px;
    margin:2px 1px 5px 1px; 
    border-bottom:1px solid #fff;
    border-top:1px solid #d9d9d9;
}
.labelCons{
    background-color:#f0f0f0;
    color:#666;
    font-size:12px;
    font-weight:bold;
    width:30px;
    padding-right:5px;
}
.fieldsetCss{
	width:80%;
	margin: auto;
	
}
.peopleCss{
	width:80%;
	margin: auto;
}
.legendCss{
	font-size:18px;
}
hr{
	width: 82%;
}
.nameSpan{
	padding-left:45px;
	float: left;
}
#setBasic{
	overflow: scroll;
	overflow-y:auto;
	overflow-x:hidden; 
}
</style>
<%-- </head>
<body>
	<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
		<form name="formBasicSet" id="formBasicSet" method="POST"> --%>
<div id="setBasic">
			<br/>
			<div id="lightGall" align="center"><a href="/LIP_Research/images/survey/setBasic.jpg" rel="gallery" class="pirobox_gall">기본 인원 설정 메뉴얼</a></div>
			<h2 align="center">조사대상</h2>
			<fieldset id="checkCons" class="fieldsetCss">
				<legend class="legendCss">조건을 선택하세요.</legend>
				<p>
					<label for="ageList" class="labelCss">나이</label>
					<s:checkboxlist onchange="changeVal()" id="ageList" name="ageList" list="ageList" listKey="setConstraintName" listValue="setConstraintName"/><br/><br/>
				</p>
				<p>
					<label for="regionList" class="labelCss">지역</label>
					<s:checkboxlist onchange="changeVal()" id="regionList" name="regionList" list="regionList" listKey="setConstraintName" listValue="setConstraintName" /><br/><br/>
				</p>
				<p>
					<label for="genderList" class="labelCss">성별</label>
					<s:checkboxlist onchange="changeVal()" id="genderList" name="genderList" list="genderList" listKey="setConstraintName" listValue="setConstraintName"></s:checkboxlist><br/>
				</p>
			</fieldset><hr/>
			<fieldset id="selectLimit" class="fieldsetCss">
				<legend class="legendCss">기본설정</legend>
				<p>
					<!-- <label class="labelCss">제목</label> -->
					<input type="hidden" id="hiddenSetBasicCntVal" name="hiddenSetBasicCntVal" value="0"/>
					<input type="hidden" id="surveyTitle" name="surveyTitle" value="${surveyTitle}"/>
				</p>
				<p>
					<label class="labelCss">인원</label>
					대상인원 : <input type="text" id="limitParticipateNumber" style="width:100px;" name="limitParticipateNumber" value="${limitParticipateNumber}"/>명&nbsp;&nbsp;&nbsp;&nbsp;
					설정인원 : <input type="text" id="setLimitNumber" name="setLimitNumber" style="width:100px;" value="0" readonly="readonly"/>명
				</p>
				<br/><br/>
				<p>
					<!-- <label class="labelCss">문제</label> -->
					<input type="hidden" id="questionCount"  name="questionCount" value="${questionCount}"/>
				</p>
				<div style="float:right;"><label>인원수(분배할 인원을 입력하세요.)</label><input type="text" size="5px" id="cntNumber" name="cntNumber" />
				<input type="button" value="더하기" onclick="cntNumPlus()"/><input type="button" value=" 빼기 " onclick="cntNumMinus()"/>
				<input type="button" onclick="distibution()" value=" 전체균등분배 "/></div>
			</fieldset><hr/>
			<fieldset id="selectPeople" class="peopleCss">
				<legend class="legendCss">인원을 선택하세요.</legend>
			</fieldset>
</div>
			<!-- <div align="center"><input type="button" onclick="submitBasic()" value="  다음  "/></div> -->
		<%-- </form>
	<jsp:include page="/jsp/common/footer/footer.jsp" />
</body>
</html> --%>