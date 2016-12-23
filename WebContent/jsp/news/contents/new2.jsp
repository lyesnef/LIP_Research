<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<title>Insert title here</title>

<style type="text/css">


#newsbutton {
width: 194px;
height: 39px;
border: none;
font-size: 14px;
font-weight: bold;
color: white;
background: #0A3842;
padding: 12px 0;
}
.boardView2 {
margin: 0 auto;
width: 91%;
overflow: hidden;
border-top: 2px solid #4A4A4A;
}
.boardView2 table {
width: 100%;
table-layout: fixed;
font-size: 13px;
font-weight: normal;
color: #666;
margin-left: -1px;
}
caption {
display: none;
}

.boardView2 div.contents {
line-height: 1.7em;
padding: 24px 0;
word-wrap: break-word;
}
.boardView2 div.contents .graphicImg {
padding-bottom: 30px;
border-bottom: 1px solid #E5E5E5;
margin-bottom: 10px;
}
.mgb30 {
margin-bottom: 30px;
}
.btnC {
clear: both;
text-align: center;
padding: 0;
}
* {
margin: 0;
padding: 0;
font-size: 13px;
}
.boardView2 tr.keyword td {
color: #777;
font-size: 13px;
font-weight: bold;
padding: 10px;
vertical-align: middle;
border: 1px solid #E5E5E5;
border-right: none;
}

</style>
</head>
<body>
<jsp:include page="../../common/menu_bar/user_menu.jsp" />

<div class="cont">
                    <!-- Area -->
						<div class="boardView2">
							<table>
								<caption>그래픽 상세보기</caption>
								<colgroup>
									<col style="width:10%">
									<col style="width:*">
									<col style="width:12%">
									<col style="width:10%">
									<col style="width:17%">
								</colgroup>
								<thead>
									<tr>
										<th class="title" colspan="2">
											<span>[패션,쇼핑,뷰티]</span> [틸리언 인포그래픽] 화장하는 남자 <br>
										</th>
										<th>2012.10.04</th>
										<th class="bicon"><span class="cnt" title="조회수"><span>조회수</span></span><span class="txt">280</span></th>
										<th class="bicon">

										</th>
									</tr>
									<tr class="contents"><td colspan="5">최근 뷰티붐과 함께 남성화장품 시장이 성장하고 있습니다.
한 발표에 의하면 남성 화장품 시장은 2009년 약 6천 5백억원 규모에서 2011년 9천억규모로 30% 이상
성장하였습니다. 
전체 9조원 규모의 화장품 시장에서 10%에 불과하지만, 성장세가 더 가파르기 때문에 더욱 시장이 커질 것이라는 전망입니다. 
남성 화장품 시장이 확장되는 것은 남성의 외모에 대한 기준이 변화하고 있기 때문인데요, 
10년전에 비해 남성의 피부 관리 및 화장품 인식 및 변화를 인포그래픽으로 정리하였습니다. 
흥미로운 내용이 많은데요, 현재 2012년 2030남성들이 생각하는 패션 아이콘과 시대별 남성 헤어스타일 트렌드를 한눈에
살펴보실 수 있습니다. </td></tr>
								
									
									<tr class="keyword"><th>키워드</th><td colspan="4">인포그래픽, infographic, 남성화장품, 남성, 그루밍, 패션아이콘, 시대별 헤어스타일, 타임라인 </td></tr>
									
								</thead>
							</table>
							<div class="contents">
								<div class="graphicImg"><p style="text-align: center; "><img src="/LIP_Research/images/news/cdb5c7d2-8734-4208-943c-b7baaf90c149.jpg"	 alt="0923_3.jpg"></p></div>  
							</div>                            
						</div>
						<div class="btnC mgb30">
							<button name="list-btn" type="button" class="btnTypeASize" id="newsbutton" onclick="location.href='/LIP_Research/News.action'">목록</button>
						</div>
						<br>
						
</div>


<jsp:include page="../../common/footer/footer1.jsp" />
</body>
</html>