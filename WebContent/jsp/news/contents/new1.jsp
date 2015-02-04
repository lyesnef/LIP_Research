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
											<span>[경제,사회]</span> [국내 인포그래픽] 세계가 인정한 한글의 우수성 <br>
										</th>
										<th>2012.10.08</th>
										<th class="bicon"><span class="cnt" title="조회수"><span>조회수</span></span><span class="txt">153</span></th>
										<th class="bicon">
										
											<!-- like 기능 -->
											
										</th>
									</tr>
									<tr class="contents"><td colspan="5">매년 10월 9일은 세종대왕의 한글 창제를 기념하는 한글의 날입니다. 
한글은 세계에서 유일하게 만든 사람과 반포일, 창제 원리까지도 알려져있는 문자입니다. 
그 만큼 과학적인 언어로, 한글의 창제 원리를 기술한 "훈민정음 해례본(국보 70호)"은 유네스코 세계기록유산으로
등재되어 있을 만큼 세계적으로 그 가치를 인정받고 있습니다. 
이렇게 자랑스러운 한글 창제일인 한글날은 국가 지정 공휴일이었습니다만, 
1991년부터 휴일에서 제외되어, 지금에 이르고 있습니다. 
지난 해에는 세종대왕께서 한글을 창제하는 과정을 다룬 팩션(역사적 사실과 허구를 섞은 이야기 기법) 드라마인
"뿌리깊은 나무" 가 방영되어 큰 인기를 끌기도 하였습니다. 

한글에 대해 정리한 국내 인포그래픽이 있어 소개하여 드립니다. </td></tr>
									
									
									<tr class="keyword"><th>키워드</th><td colspan="4">인포그래픽, infographic, 한글날, 한글, </td></tr>
									
								</thead>
							</table>
							<div class="contents">
								<div class="graphicImg"><p style="text-align: center; ">출처 :&nbsp;<a href="http://www.yonhapnews.co.kr/medialabs">http://www.yonhapnews.co.kr/medialabs</a></p>
<p>&nbsp;</p>
<p><img src="http://www.yonhapnews.co.kr/medialabs/info/2012/images/han_im_01.jpg">
<img src="http://www.yonhapnews.co.kr/medialabs/info/2012/images/han_im_02.jpg">
<img src="http://www.yonhapnews.co.kr/medialabs/info/2012/images/han_im_03.jpg"></p>
</div>  
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