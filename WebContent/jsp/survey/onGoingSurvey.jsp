<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
	 <script type='text/javascript' src="http://widcraft.googlecode.com/svn/jquery.js"></script>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="/LIP_Research/css/style.css" />
<link type="text/css" rel="stylesheet" href="/LIP_Research/css/global.css" />
<style type="text/css">

span img {
float: left;
margin-top: 20px;
}
.saving{
display: inline-block;
float: left;
width: 50px;
height: 52px;
font-size: 14px;
font-weight: bold;
color: red;

margin: 3 5px 0 17;
padding: 0;
}
.slide p{
padding: 13px 0px 4px 62px;
}

.wrap {
background: url(/LIP_Research/images/survey/pemisah.png) center bottom no-repeat;
overflow: hidden;
cursor:pointer;
}

.box-serv {
float: right;
width: 355px;
height: auto;
}

.wrap h1 {
font-size: 23px;
margin-bottom: 0px;
}

.container_24 .grid_12 {
width: 470px;
}

.pad {
padding-top: 30px;
width: 471px;
margin-left: 110px;
}

.box-icon {
width: 85px;
height: auto;
float: left;
margin-right: 30px;

}

.box-serv {
float: right;
width: 355px;
height: auto;
}

.box-serv p{
margin-bottom: 20px;
}
</style>


<script type="text/javascript">

</script>
</head>

<body>
	<jsp:include page="../common/menu_bar/user_menu.jsp" />
	  
	  <div id="body-section">
	   	<div id="container">
		<div id="example">
			<div id="slides" style="
    height: 202px;
			">
				<div class="slides_container">
					<s:iterator value="surveyList">
					
					<div class="slide">
					<s:if test="participable==1">
					<img src="/LIP_Research/images/survey/ribbon.png" width="112" height="112" alt="New Ribbon" id="ribbon">
					</s:if>	
						<span class="saving">
        				<!-- 복합폴에 배정된 포인트 -->
 
							  <s:if test="categoryNumber == 1">
							    <img src="/LIP_Research/images/category/Love.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 2">
							    <img src="/LIP_Research/images/category/Car.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 3">
							     <img src="/LIP_Research/images/category/Movie.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 4">
							     <img src="/LIP_Research/images/category/IT.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 5">
							    <img src="/LIP_Research/images/category/Fashion.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 6">
							    <img src="/LIP_Research/images/category/Maternity.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 7">
							    <img src="/LIP_Research/images/category/Interior.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 8">
							    <img src="/LIP_Research/images/category/Tv.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 9">
							    <img src="/LIP_Research/images/category/Food.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 10">
							    <img src="/LIP_Research/images/category/Economy.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>  
							  </s:if>
							  <s:if test="categoryNumber == 11">
							    <img src="/LIP_Research/images/category/Finance.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 12">
							    <img src="/LIP_Research/images/category/Etc.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							 <label >&nbsp;10P</label>
						
        			</span>
						
						<h1><s:property value="surveyTitle" /></h1>
						<p>설문 조사 기간 <strong>[<s:property value="surveyStartDate" /> ~ <s:property value="surveyEndDate" />] </strong></p>
						
						<p align="right" style="padding-right:19px;">
						<s:if test="participable==1">
						<button class="bbutton" onclick="javascript:location.href='/LIP_Research/survey/PreviewSurvey.action?surveyNum=<s:property value="surveyNumber" />'">참여하러가기</button>
						</s:if>
						<s:else>
							<strong>참여해 주셔서 감사합니다</strong> 
						</s:else>
						 </p>
					</div>
					
					</s:iterator>
				</div>
				<a href="#" class="prev"><img src="/LIP_Research/images/survey/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
				<a href="#" class="next"><img src="/LIP_Research/images/survey/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
			</div>
			<img src="/LIP_Research/images/survey/example-frame.png" width="739" height="341" alt="Example Frame" id="frame">
		</div>
	</div>
	
	<div class="grid_12 pad">
	<s:iterator value="surveyList">
		<s:if test="participable==1">
		<div class="wrap" onclick="javascript:location.href='/LIP_Research/survey/PreviewSurvey.action?surveyNum=<s:property value="surveyNumber" />'" title="서베이 <s:property value="surveyNumber" />번 참여하기">
			<div class="box-icon">
				<span class="saving">
        				<!-- 복합폴에 배정된 포인트 -->
 
							  <s:if test="categoryNumber == 1">
							    <img src="/LIP_Research/images/category/Love.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 2">
							    <img src="/LIP_Research/images/category/Car.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 3">
							     <img src="/LIP_Research/images/category/Movie.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 4">
							     <img src="/LIP_Research/images/category/IT.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 5">
							    <img src="/LIP_Research/images/category/Fashion.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 6">
							    <img src="/LIP_Research/images/category/Maternity.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 7">
							    <img src="/LIP_Research/images/category/Interior.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 8">
							    <img src="/LIP_Research/images/category/Tv.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 9">
							    <img src="/LIP_Research/images/category/Food.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 10">
							    <img src="/LIP_Research/images/category/Economy.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>  
							  </s:if>
							  <s:if test="categoryNumber == 11">
							    <img src="/LIP_Research/images/category/Finance.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 12">
							    <img src="/LIP_Research/images/category/Etc.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							 <label >&nbsp;10P</label>
						
        			</span>
			</div>
			<div class="box-serv">
			<h1>서베이 <s:property value="surveyNumber" />번, <s:property value="surveyTitle" /></h1>
			<p>설문 조사 기간 <strong>[<s:property value="surveyStartDate" /> ~ <s:property value="surveyEndDate" />] </strong></p>
			</div>
		</div>
		</s:if>
		<s:else>
				<div class="wrap" onclick="message();" title="이미 참여하셨습니다">
			<div class="box-icon">
				<span class="saving">
        				<!-- 복합폴에 배정된 포인트 -->
 
							  <s:if test="categoryNumber == 1">
							    <img src="/LIP_Research/images/category/Love.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 2">
							    <img src="/LIP_Research/images/category/Car.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 3">
							     <img src="/LIP_Research/images/category/Movie.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 4">
							     <img src="/LIP_Research/images/category/IT.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 5">
							    <img src="/LIP_Research/images/category/Fashion.gif" width="40px" height="40px" title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 6">
							    <img src="/LIP_Research/images/category/Maternity.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 7">
							    <img src="/LIP_Research/images/category/Interior.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 8">
							    <img src="/LIP_Research/images/category/Tv.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 9">
							    <img src="/LIP_Research/images/category/Food.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 10">
							    <img src="/LIP_Research/images/category/Economy.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>  
							  </s:if>
							  <s:if test="categoryNumber == 11">
							    <img src="/LIP_Research/images/category/Finance.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							  <s:if test="categoryNumber == 12">
							    <img src="/LIP_Research/images/category/Etc.gif" width="40px" height="40px"  title='<s:property value="categoryName" />'>
							  </s:if>
							 <label >&nbsp;10P</label>
						
        			</span>
			</div>
			<div class="box-serv">
			<h1>서베이 <s:property value="surveyNumber" />번, <s:property value="surveyTitle" /></h1>
			<p>설문 조사 기간 <strong>[<s:property value="surveyStartDate" /> ~ <s:property value="surveyEndDate" />] </strong></p>
			</div>
		</div>
		</s:else>
	</s:iterator>
	</div>
</div>
	    
	<jsp:include page="../common/banner/banner.jsp" />
	 <jsp:include page="../common/footer/footer.jsp" />

 <script type="text/javascript" src="/LIP_Research/js/common/kw/slides.min.jquery.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/rcrousel/jquery.ui.core.js"></script>

<script type="text/javascript">
$(function(){
	// Set starting slide to 1
	var startSlide = 1;
	// Get slide number if it exists
	if (window.location.hash) {
		startSlide = window.location.hash.replace('#','');
	}
	// Initialize Slides
	$('#slides').slides({
		preload: true,
		preloadImage: '/LIP_Research/images/survey/loading.gif',
		generatePagination: true,
		play: 4000,
		pause: 2300,
		hoverPause: true,
		// Get the starting slide
		start: startSlide,
		animationComplete: function(current){
			//alert(current);
			// Set the slide number as a hash
		}
	});
});

function message(){
	alert('이미 참여한 서베이 입니다.\n다른 서베이를 선택해 주세요.');
}

</script>
</body>
</html>