<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
<title>Post Search</title>
<style type="text/css">
h1 {
	color: #ccc;
	font-size: 36px;
	text-shadow: 1px 1px 1px #fff;
	padding: 20px;
}
label{
	width:300px;
    float:left;
    text-align:left;
    margin-right:15px;
    line-height:26px;
    color:#666;
    text-shadow:1px 1px 1px #fff;
    font-weight:bold;
}
button{
	border:none;
	outline:none;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    color: #ffffff;
    display: block;
    cursor:pointer;
    margin: 0px auto;
    clear:both;
    padding: 0px 25px;
    text-shadow: 0 1px 1px #777;
    font-weight:bold;
    font-family:"Century Gothic", Helvetica, sans-serif;
    font-size:12px;
    -moz-box-shadow:0px 0px 3px #aaa;
    -webkit-box-shadow:0px 0px 3px #aaa;
    box-shadow:0px 0px 3px #aaa;
    background:#4797ED;
}
button:hover {
    background:#d8d8d8;
    color:#666;
    text-shadow:1px 1px 1px #fff;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#postSearch').click(function() {
		var postcode = document.getElementById('codename').value;
		
		jQuery.ajax({
			type:"POST",
			url:"PostSearch.action",
			data: "codename="+postcode,
			success:function(msg){
				$("#result_show").empty().append(msg);
			}, error: function(xhr,status,error){
				alert(error);
			}
		}); 
		return false;
	});
});
</script>
</head>
<body>

<h1>Post Search</h1>
<span><label>우편번호 검색(동으로 검색해주세요)</label></span><br/>
<span><input type="text" size="50px" id="codename" name="codename"/></span><br/>
<span style="float: left;">
<button id="postSearch" name="postSearch" style="width:100px;height:20px;">검색</button>
</span><br/>
<p style="color: #666">
아래를 클릭하시면 입력됩니다.
</p>
<div id="result_show"></div>
</body>
</html>