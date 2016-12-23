<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>LIP Research - 폴 결과</title>
        <link rel="stylesheet" href="/LIP_Research/css/style.css">
		<link rel="stylesheet" href="/LIP_Research/css/chart.css">
        
	</head>
	<body>
	
    <jsp:include page="/jsp/common/menu_bar/user_menu.jsp" />
    <div id="body-section">
    <div class="headTitle">
    	<span><h1>결과보기</h1></span>
    </div>
    <div class="headTitle">
     <span>
							  <s:if test="pr.categoryNumber == 1">
							    <img src="/LIP_Research/images/category/Love.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 2">
							    <img src="/LIP_Research/images/category/Car.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 3">
							     <img src="/LIP_Research/images/category/Movie.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 4">
							     <img src="/LIP_Research/images/category/IT.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 5">
							    <img src="/LIP_Research/images/category/Fashion.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 6">
							    <img src="/LIP_Research/images/category/Maternity.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 7">
							    <img src="/LIP_Research/images/category/Interior.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 8">
							    <img src="/LIP_Research/images/category/Tv.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 9">
							    <img src="/LIP_Research/images/category/Food.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 10">
							    <img src="/LIP_Research/images/category/Economy.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">  
							  </s:if>
							  <s:if test="pr.categoryNumber == 11">
							    <img src="/LIP_Research/images/category/Finance.gif" width="50px" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							  <s:if test="pr.categoryNumber == 12">
							    <img src="/LIP_Research/images/category/Etc.gif" width="50px" style="float: left;
margin: 10px;" height="50px" style="float: left;margin: 40px 20px;" title="<s:property value="pr.categoryName" />">
							  </s:if>
							 </span>
    <p><s:property value="%{pr.member.memberId}"/>님이 게시한 폴입니다.</p>
    <p style="font-weight: bold; font-size: 20px;">질문내용</p>
    <p style="font-size: 18px;"><s:property value="%{pr.pollQuestion}"/></p>
   	<p style="float: right;">현재까지 <s:property value="%{totalParticipateNumber}"/>명의 회원 님이 참여해주셨습니다.</p>
   <p style="float: right;"> 기간 : [<s:property value="%{pr.pollStartDate}"/>~<s:property value="%{pr.pollEndDate}"/>]</p>
    </div>
    <div class="exampleResult"> 
   
   <canvas id="cvs1" width="550"  height="300">[지원하지 않는 브라우저 입니다]</canvas>
        
       		
    </div>
    <div class="etc">
	    
	     <canvas id="bar3" width="250" height="200">[지원하지 않는 브라우저 입니다]</canvas>
	  
	 
	     <canvas id="pie4" width="250" height="200" style="">[지원하지 않는 브라우저 입니다]</canvas>
	   
    </div>
    
        <form name="myForm" action="RegMessage.action" method="post">
        <input type="hidden" name="pc.pollNumber" value='<s:property value="%{pr.pollNumber}"/>'> 
        	<h1>
        		<span>의견 남기기</span>
        	</h1>	
        	<textarea rows="10" cols="10" name="pc.pollCommentContant" style="width:96%; resize:none;" maxlength="500" placeholder="의견 등록 시 주민번호, 전화번호 등의 개인정보가 노출되지 않도록 주의해주세요!" id="contents"></textarea>
        	<br/><button type="submit" class="button" id="addComment">생각더하기</button>
        	
        </form>
        	<div class="regPollComment" style="padding-top: 45px;">
        	<span>총 <s:property value="%{pr.getPollCommentList().size()}" />개의 의견</span>
        	<s:iterator value="pr.pollCommentList">
        			<div class="comment">
        				<div class="waveTime">
        					<s:property value="pollCommentDate"/>
        				</div>
        				<div class="commentAvatar">
        						<s:if
										test="#session.lipMember.memberImage!=null">

										<img style="width: 35px;" src='/LIP_Research/ReadImage?imgName=<s:property value="member.memberImage"/>' alt='<s:property value="member.memberId"/>님의 사진'/>


									</s:if> 
									<s:else>
										<s:if test="#session.lipMember.genderNumber==1">
											<img alt=""
												style="width: 35px;" src="/LIP_Research/images/common/member/default1.gif"
												title="등록된 사진이 없습니다" >
										</s:if>
										<s:elseif test="#session.lipMember.genderNumber==2">
											<img alt=""
												style="width: 35px;" src="/LIP_Research/images/common/member/default_woman.jpg"
												title="등록된 사진이 없습니다" >
										</s:elseif>
									</s:else>
							<img src='/LIP_Research/ReadImage?imgName=<s:property value="member.memberImage"/>' alt='<s:property value="member.memberId"/>님의 사진'/>
						</div>
						<div class="commentText">
							<span class="name"><s:property value="member.memberId"/> </span> <s:property value="pollCommentContant"/>
						</div>
        				
        			</div>
        	</s:iterator>
        	</div>
        
        
    </div>
    <jsp:include page="/jsp/common/banner/banner.jsp" />	
	<jsp:include page="/jsp/common/footer/footer.jsp" />
<script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.hbar.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.pie.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.common.core.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.bar.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.common.dynamic.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.common.tooltips.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.common.effects.js"></script>
<script type="text/javascript" src="/LIP_Research/js/common/kw/RGraph.common.key.js"></script>

<input type="hidden" id="answerList" value='<s:property value="%{answerList}"/>' /> 
<input type="hidden" id="answerListCount" value='<s:property value="%{answerListCount}"/>' />
<input type="hidden" id="genderList" value='<s:property value="%{genderList}"/>' />
<input type="hidden" id="genderListCount" value='<s:property value="%{genderListCount}"/>' />
<input type="hidden" id="ageList" value='<s:property value="%{ageList}"/>' />
<input type="hidden" id="ageListCount" value='<s:property value="%{ageListCount}"/>' />




<script type="text/javascript">

var answerList;
var answerListCount;
var genderList;
var genderListCount;
var ageList;
var ageListCount;
var answerListCount2;
$(document).ready(function() {
	
	answerList=	$('#answerList').val().split(',');
	answerListCount=	$('#answerListCount').val().split(', ');
	genderList=	$('#genderList').val().split(',');
	genderListCount	=	$('#genderListCount').val().split(', ');
	ageList	=	$('#ageList').val().split(',');
	ageListCount=	$('#ageListCount').val().split(', ');
	
	answerListCount2	=	new Array();
	 for(var i=0; i<answerListCount.length; i++){
		answerListCount2[i]	=	parseInt(answerListCount[i]);
	}  
	 answerListCount	=	answerListCount2;
	 
	 var genderListCount2	=	new Array();
	 for(var i=0; i<genderListCount.length; i++){
			genderListCount2[i]	=	parseInt(genderListCount[i]);
		} 
	 genderListCount	=	genderListCount2;
	 
	 var ageListCount2	=	new Array();
	 for(var i=0; i<ageListCount.length; i++){
			ageListCount2[i]	=	parseInt(ageListCount[i]);
		} 
	 ageListCount	=	ageListCount2;
	 
	buildHbar();
	buildBarChart();
    buildPieChart();
          
});

function buildHbar(){
	
	var hbar = new RGraph.HBar('cvs1', answerListCount);            
    hbar.Set('chart.colors', ['#98afff']);
    hbar.Set('chart.strokestyle', 'rgba(0,0,0,0)');
    hbar.Set('chart.labels.above', true);
    hbar.Set('chart.labels.above', true);
    hbar.Set('chart.vmargin', 15);
    hbar.Set('chart.background.grid', false);
    hbar.Set('chart.labels',answerList);
    
    if (!RGraph.isOld()) {
        hbar.Set('chart.tooltips', answerList);
        hbar.Set('chart.tooltips.event', 'onmousemove');
    }
    
    hbar.Set('chart.labels.above.decimals', 1);
    hbar.Set('chart.xlabels', false);
    hbar.Set('chart.gutter.left', 100);
    hbar.Set('chart.gutter.right', 50);
    hbar.Set('chart.gutter.top', 25);
    hbar.Set('chart.noxaxis', true);
    hbar.Set('chart.noxtickmarks', true);
    hbar.Set('chart.noytickmarks', true);
    RGraph.isOld() ? hbar.Draw() : RGraph.Effects.HBar.Grow(hbar);
}

function buildBarChart(){
	var bar3 = new RGraph.Bar('bar3', ageListCount);
     bar3.Set('chart.labels',ageList);
    bar3.Set('chart.tooltips',ageList); 
    bar3.Set('chart.tooltips.event', 'onmousemove');
    bar3.Set('chart.colors', [RGraph.LinearGradient(bar3, 0,0,0,200, 'skyblue', 'rgba(255,255,255,1)')]);
    bar3.Set('chart.shadow', true);
    bar3.Set('chart.shadow.offsetx', 3);
    bar3.Set('chart.shadow.offsety', -3);
    bar3.Set('chart.shadow.blur', 5);
    bar3.Set('chart.shadow.color', '#ccc');
    bar3.Set('chart.background.grid', false);
    bar3.Draw();

    
}

function buildPieChart(){
	
	var pie4 = new RGraph.Pie('pie4', genderListCount);
    pie4.Set('chart.labels',genderList);
    pie4.Set('chart.tooltips', genderList);
    pie4.Set('chart.tooltips.event', 'onmousemove');
    pie4.Set('chart.colors', ['#EC0033','#A0D300']);
    pie4.Set('chart.strokestyle', 'white');
    pie4.Set('chart.linewidth', 3);
    pie4.Set('chart.shadow', true);
    pie4.Set('chart.shadow.offsetx', 2);
    pie4.Set('chart.shadow.offsety', 2);
    pie4.Set('chart.shadow.blur', 3);
    pie4.Set('chart.exploded', 7);
    var total	=	0;
    for (var i=0; i<genderList.length; ++i) {
        total += parseInt(genderListCount[i]) ;
    }
    
    for (var i=0; i<genderList.length; ++i) {
        pie4.Get('chart.labels')[i] = pie4.Get('chart.labels')[i] + ', ' + Math.round(genderListCount[i]/total*100) + '%';
    }
    
    pie4.Draw();
}
</script>
	</body>
</html>