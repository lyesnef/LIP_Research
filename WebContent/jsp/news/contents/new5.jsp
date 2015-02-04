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
											<span>[남과여,연애]</span> [틸리언 인포그래픽] 두근 두근 대한민국 평균 소개팅<br>
										</th>
										<th>2012.09.26</th>
										<th class="bicon"><span class="cnt" title="조회수"><span>조회수</span></span><span class="txt">478</span></th>
										<th class="bicon">
										
										</th>
									</tr>
									<tr class="contents"><td colspan="5">매달 14일은 다양한 기념일의 날인데요, 발렌타인데이, 화이트데이 등 많은 데이들이 커플들을 위한 기념일이 되고 있습니다. 
이동통신 요금제나 다양한 서비스도 커플들을 위한 할인을 제공하는데요, 한국에서는 커플이 아니면 살아남기 힘들다는 말도 있네요, 
남자와 여자가 만나서 연애를 하는 가장 보편적인 방법이 바로 다른 사람의 주선을 받는 소개팅인데요, 
대한민국 미혼 남여의 평균 소개팅은 어떤 모습일까요? 
틸리언 인포그래픽에서 확인해 보세요! </td></tr>
									
									
									<tr class="keyword"><th>키워드</th><td colspan="4">인포그래픽, infographic, 소개팅, 남여차이, 진상남여, </td></tr>
									
								</thead>
							</table>
							<div class="contents">
								<div class="graphicImg"><p>&nbsp;</p>
<p style="text-align: center; "><img src="/LIP_Research/images/news/c52af477-81bb-4b9e-89d0-102b097a5584.jpg" alt="tillion0926.jpg"></p></div>  
							</div>                            
						</div>
						<div class="btnC mgb30">
							<button name="list-btn" type="button" class="btnTypeASize" id="newsbutton" onclick="location.href='/LIP_Research/News.action'">목록</button>
						</div>
<jsp:include page="../../common/footer/footer1.jsp" />
</body>
</html>