<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>LIP Research - 공지사항</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<link rel="stylesheet" href="/LIP_Research/css/jquery.akordeon.css">

<style type="text/css">
.sub_body {
	border: 0;
	vertical-align: baseline;
	font-family: NanumGothic, NanumGothicWeb, Verdana, "굴림", Gulim, Dotum,
		"돋움", sans-serif;
	color: #F00;
	font-size: 24px;
	font-weight: bold;
	text-shadow: 1px 1px 0px rgba(51, 51, 51, 0.3);
	padding: 10px;
}

.button_area {
	padding: 1px;
	margin: 5px;
	text-align: right;
}

.writeForm {
	margin-top: 10px;
	padding: 10px 5px 10px 5px;
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

.content {
	padding: 10px;
}

textarea {
	width: 97%;
	height: 30px;
	resize: none;
	width
	="80%"]
}
</style>
</head>

<body>
	<jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
	<div id="body-section">
		<div class="sub_body">FAQ - 자주 묻는 질문</div>
		<div id="accordion">
			<s:if test="faqList.size()<1">
				<h3>
					등록된 FAQ가 없습니다.<a href="#"></a>
				</h3>
				<div>아직 FAQ가 등록되지 않았습니다.</div>
			</s:if>
			<s:else>
				<div class="akordeon">
					<s:iterator value="faqList">
						<div class="akordeon-item">
							<div class="akordeon-item-head">
								<div class="akordeon-item-head-container">
									<div class="akordeon-heading">
											<s:property value="faqTitle"/>
									</div>
								</div>
							</div>
							<div class="akordeon-item-body">
								<div class="akordeon-item-content">
									<s:if test="#session.lipMember.memberId=='admin'">
											<p align="right">
												<button
													onclick="modifyFaq(<s:property value='faqNumber' />)">수정</button>
												<button
													onclick="deleteFaq(<s:property value='faqNumber' />)">삭제</button>
											</p>
										</s:if>
										<s:property value="faqTitle" />

									<s:property value="faqAnswer" />


								</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</s:else>
		</div>
		

		<s:if test="#session.lipMember.memberId=='admin'">
			<div class="button_area">
				<button onclick="javascript:$('.writeForm').show()">FAQ등록</button>
			</div>
			<div class="writeForm">
			<form name="myForm" action="WriteFaq.action" method="post">
				<input type="hidden" id="faqNumber" name="faq.faqNumber" /> <label>제목</label>
				<input type="text" id="faqTitle" name="faq.faqTitle" size="40"
					placeholder="질문을 입력하세요" /> <br /> <label>내용</label>
				<textarea id="faqAnswer" name="faq.faqAnswer"
					placeholder="답변을 입력하세요"></textarea>
				<div class="button_area">
					<input id="process" type="submit" value="등록" />
				</div>
			</form>
		</div>
		</s:if>
</div>

		<jsp:include page="/jsp/common/banner/banner.jsp" />

		<jsp:include page="/jsp/common/footer/footer.jsp" />


		<script type="text/javascript"
			src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
		<script type="text/javascript"
			src="/LIP_Research/js/common/kw/jquery.akordeon.js"></script>
<script type="text/javascript"
			src="/LIP_Research/js/common/kw/jquery-ui-1.8.24.custom.min.js"></script>

		<script type="text/javascript">
		$(document).ready(function(e) {
			$('.akordeon').akordeon();
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
    				document.myForm.action="WriteFaq.action";
    				document.myForm.submit();
    			}else if($(this.val()=='수정')){
    				document.myForm.action="ModifyFaq.action";
    				document.myForm.submit();
    				$(this).val('등록');
    			}
    		});
    		
 
        });
		
		function modifyFaq(faq_num){		
			
			jQuery.ajax({
			    type: 'POST',
			    dataType: 'html',
			    url: 'SingleFaq.action',
			    data:'faqNumber=' +faq_num,
			    success: function(data){
			        var arr	=	data.split('/');
					$('#faqTitle').val(arr[0]);
					$('#faqAnswer').val(arr[1]);
					$('#process').val('수정');
					$('#faqNumber').val(faq_num);
					$('.writeForm').show();
					document.myForm.action='ModifyFaq.action';
			       
			    },
			    error:function(){
			    	alert('잘못됨');
			    }
			
});
			$('.writeForm').show();
						
		};
		
		function deleteFaq(faq_num){
			if(window.confirm("정말로 삭제하시겠습니까?")){
				document.myForm.action='DeleteFaq.action?faqNumber='+faq_num;
				document.myForm.submit();
			}
		};

	</script>
</body>
</html>