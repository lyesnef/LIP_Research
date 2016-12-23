<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>LIP Research - 공지사항</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<link rel="stylesheet" href="/LIP_Research/css/jquery-ui-1.8.24.custom.css">
<style type="text/css">
.sub_body{
	border: 0;
	vertical-align: baseline;
	font-family: NanumGothic, NanumGothicWeb, Verdana, "굴림", Gulim, Dotum, "돋움", sans-serif;
	color: #F00;
	font-size: 24px;
	font-weight: bold;
	text-shadow: 1px 1px 0px rgba(51,51,51,0.3);
	padding: 10px;
}
.button_area{
	padding:1px;	
	margin:5px;
	text-align: right;
}

.writeForm{	
	margin-top: 10px;
	padding:10px 5px 10px 5px; 
	display: block;
	border: 2px solid #CCC;
	-moz-border-radius: 6px;
	-khtml-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	overflow: hidden;
}
.waveTime {
color: #999;
float: right;
font-size: 10px;
}
.content{
	padding:10px;
}
textarea{width: 97%; height: 30px; resize:none; width="80%"]}
</style>
</head>

<body>
<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" /> 
<div id="body-section"> 
<div class="sub_body">
	공지사항
</div>
<div id="accordion">
 <s:if test="noticeList.size()<1">
    	<h3>등록된 공지사항이 없습니다.<a href="#"></a></h3>
    <div>아직 공지사항이 등록되지 않았습니다.</div>
    </s:if>
    <s:else>
<s:iterator value="noticeList">
    <h3><s:property value="noticeTitle"/><a href="#"></a>
    </h3>
    <div><s:if test="#session.lipMember.memberId=='admin'">
    	<p align="right"><button onclick="modifyNotice(<s:property value='noticeNumber' /> )">수정</button>
    	<button onclick="deleteNotice(<s:property value='noticeNumber' />)">삭제</button></p>
    </s:if>
     <p class="waveTime"><s:property value="noticeDate" /></p><br />
    <div class="content">
   	<s:property value="noticeContant"/>
    </div>
    </div>
    </s:iterator>
    </s:else>
</div>
<s:if test="#session.lipMember.memberId=='admin'">
	<div class="button_area">
	<button onclick="javascript:$('.writeForm').show()">글쓰기</button>
	</div>
</s:if>

	<div class="writeForm">
	<form name="myForm" action="WriteNotice.action" method="post">
	<input type="hidden" id="noticeNumber" name="notice.noticeNumber" />
	<label>제목</label>
	<input type="text" id="noticeTitle" name="notice.noticeTitle" size="40" placeholder="제목을 입력하세요"/>
	<br />
	<label>내용</label>
	<textarea id="noticeContant" name="notice.noticeContant" placeholder="내용을 입력하세요"></textarea>
	<div class="button_area">
	<input id="process" type="submit" value="등록" />
	</div>
	</form>
	</div>

</div>
	<jsp:include page="/jsp/common/banner/banner.jsp" />
	
	<jsp:include page="/jsp/common/footer/footer.jsp" />
	

<script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/jquery-ui-1.8.24.custom.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function(e) {
            $( "#accordion" ).accordion();
            $( "input:submit, button" ).button();
    		$( "a", ".demo" ).click(function() { return false; });
    	
    		$('input:text, input:password, textarea')
    		.button()
    		  .css({
    		          'font' : 'inherit',
    		         'color' : 'inherit',
    		    'text-align' : 'left',
    		       'outline' : 'none',
    		        'cursor' : 'text'
    		  });
    		$('.writeForm').hide();
    		$('#process').onclick(function(){
    			if($(this).val()=='등록'){
    				document.myForm.action="WriteNotice.action";
    				document.myForm.submit();
    			}else if($(this.val()=='수정')){
    				document.myForm.action="ModifyNotice.action";
    				document.myForm.submit();
    				$(this).val('등록');
    			}
    		});
    		
 
        });
		
		function modifyNotice(notice_num){		
			
			jQuery.ajax({
			    type: 'POST',
			    dataType: 'html',
			    url: 'GetSingleNotice.action',
			    data:'process=modify&noticeNumber=' +notice_num,
			    success: function(data){
			        var arr	=	data.split('/');
					$('#noticeTitle').val(arr[0]);
					$('#noticeContant').val(arr[1]);
					$('#process').val('수정');
					$('#noticeNumber').val(notice_num);
					document.myForm.action='ModifyNotice.action';
			       
			    },
			    error:function(){
			    	alert('잘못됨');
			    }
			
});
			$('.writeForm').show();
						
		};
		
		function deleteNotice(notice_num){
			if(window.confirm("정말로 삭제하시겠습니까?")){
				document.myForm.action='DeleteNotice.action?noticeNumber='+notice_num;
				document.myForm.submit();
			}
		};

	</script>
</body>
</html>