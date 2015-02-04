/**
 * Function Name : sendCon()
 * Description  	 : 1.  Ajax를 사용해서 서버에 선택한 제약사항번호를 전송한다.
 * 						   2. callBack 함수 : resultBack. 
 */
/*function sendCon()
{
	// 사용자가 선택한 제약사항 번호
	var no = document.myform.sel.value;
	
	// ResultData.action으로 전송한다.
	sendRequest("ResultData.action?conNum="+no, "", "", resultBack);   
}
*/
/**
 * Function Name : resultBack(data)
 * Parameter        : data - Ajax로 전송받은 데이터
 * Description  	 : 1.  CallBack함수 
 * 						   2.  response 된 데이터를 resultSee Div에 쓴다.
 *                            3. drawDiagonal() 호출한다. - 캔버스에 받은 정보로 그래프를 그린다.  
 */
function resultBack(data) 
{	
	document.getElementById("resultSee").innerHTML= data;
	drawDiagonal();
}

/**
 * Function Name  : getXMLHTTPRequest 
 * Description        : XMLHttpRequest 생성한다.
 */
function getXMLHTTPRequest(){
	var xRequest = null;
	if(window.XMLHttpRequest){
		xRequest = new XMLHttpRequest();		
	}else if(typeof ActiveXObject !="undefined"){
		xRequest = new ActiveXObject("Micrsoft.XMLHTTP");
	}
	return xRequest;
}

/**
 * READY_STATE_OPEN = 1;
 * READY_STATE_HEADER = 2;
 * READY_STATE_LOADING = 3;
 * READY_STATE_DONE = 4;
 * 
 */
var READY_STATE_OPEN=1;
var READY_STATE_HEADER=2;
var READY_STATE_LOADING=3;
var READY_STATE_DONE=4;
var req;
var resultMethod;

/**
 *  Function Name   : sendRequest
 * Param url 
 * Param params 
 * Param HttpMethod HttpMethod 
 * Param onReadyMethod
 * Description : 
 */
function sendRequest(url, params, HttpMethod, onReadyMethod){
	if(!HttpMethod){
		HttpMethod="POST";//GET POST PUT DELETE OPTION HEAD
	}
	req = getXMLHTTPRequest();
	if(req){
		resultMethod = onReadyMethod;
		req.onreadystatechange = onReadStateChange;
		req.open(HttpMethod, url, true);
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.send(params);
	}
}

/**
 * Method : onReadStateChange
 * Description : requeson readystatechange
 */
function onReadStateChange(){
	var ready=req.readyState;
	var data=null;
	if(ready == READY_STATE_DONE){
		data=req.responseText;
		resultMethod(data);
	}else{}
}