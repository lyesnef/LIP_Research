<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/bootstrap/css/bootstrap.css" />
<style type="text/css">
body {
color: #777;
font-size: 13px;
font-family: 'Nanum',nanumgothic,'돋움',Dotum,AppleGothic,Helvetica,sans-serif;
}
</style>

</head>
<body>
<form id="myForm" onsubmit="return check();"  action="ChangeImage.action" method="post" enctype="multipart/form-data">
<div style="margin: 36px;">
	파일업로드<input type="file" name="image" />
</div>
<div style="margin: 30px 31px 42px 200px;">
	<input type="submit"  value="변경" id="cc" class="btn btn-success"/>
	<input type="button" value="닫기" onclick="window.close();" class="btn btn-danger" />
	</div>
</form>	
    
	<script type="text/javascript"
		src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
	<script type="text/javascript"
		src="/LIP_Research/js/common/bootstrap-fileupload.js"></script>
		
		<script type="text/javascript">
			function check(){
				if($('input[name="image"]').val()==''){
					alert('이미지 파일을 입력해 주세요.');
					return false;
					}
				return true;
			}
		</script>
</body>
</html>