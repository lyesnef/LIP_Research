<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
<style type="text/css">
ul, ol {
margin: 0;
padding: 0;
}
ul, ol {
margin-left: 2em;
}
ul li, ol li {
list-style: none;

}
.pointer{
cursor: pointer;
}

.pollType3 .active div.activeOk {
width: 184px;
height: 162px;
background: white;
border: 3px solid #0080B6;
position: relative;
left: -5px;
top: -5px;
text-align: center;

}

.starEvalute .starItem {
display: inline-block;
width: 60px;
height: 60px;
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 0;
padding-right: 5px;
margin-top: 11px;
cursor: pointer;
}

.starEvalute .starItem.active {
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 -60px;
}

.ongoingpoll {
margin: 10px 0;
padding: 8px 8px 0;
background: #E6F1F6;
border: 1px solid #C5D5DD;
border-radius: 4px;
}
.module {
margin: 10px 0;
padding: 8px 8px 0;
background: #E6F1F6;
border: 1px solid #C5D5DD;
border-radius: 4px;
}

.sss  {
margin-left: -8px;
width: 100%;
padding: 8px;
background: white;
border-top: 1px solid #D8E6EC;
border-bottom-right-radius: 4px;
border-bottom-left-radius: 4px;
}

/* .starBox .starEvalute .starItem {
display: inline-block;
width: 60px;
height: 60px;
background: url(/images/front/icon/icon_starScore.png) no-repeat 0 0;
padding-right: 5px;
margin-top: 11px;
}

.starEvalute .starItem.active {
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 -60px;
}
.starEvalute .starItem {
display: inline-block;
width: 60px;
height: 60px;
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 0;
padding-right: 5px;
margin-top: 11px;
}
.starEvalute .starItem.active {
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 -60px;
}
.starEvalute .starItem {
display: inline-block;
width: 60px;
height: 60px;
background: url(/LIP_Research/images/poll/icon_starScore.png) no-repeat 0 0;
padding-right: 5px;
cursor: pointer;
}

 */

</style>
<script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>
<script type="text/javascript">


function fOnload() {
    var contentId = 1; //should be the identity id for which rating needs to be updated
    var imgs = document.getElementById('setrating')
        .getElementsByTagName('img');

    for (var i = 0; i < imgs.length; i++) {
    	imgs[i].addEventListener("click", function(e) {
            setRating(parseInt(e.target.alt) + 1)
        }, false);
      
    }
}

function setRating(point) {
	
    stars = new Array("R0", "R1", "R2", "R3", "R4");
    start = parseInt(point);
    for ( var i = 0; i < 5; i++) {
        document.getElementById(stars[i]).src = "/LIP_Research/images/poll/rate0.png";
    }
    for ( var i = 0; i < point; i++) {
        document.getElementById(stars[i]).src = "/LIP_Research/images/poll/rate1.png";
    }
   
    var pollexample = document.getElementById("pollexample" + (point-1)).value;
 //   alert(pollexample);
    document.getElementById("starScore").value = pollexample;
    
}



function selectLike(element) {
	
	var pollNumber = $(element).attr("pollNumber");
	var pollExampleNumber = $(element).attr("pollExampleNumber");
	
	$("div[pollNumber='" + pollNumber + "']").each(function(element, index) {
		$(this).removeClass("active");
	});
	
	$(element).addClass("active");
	$("#exampleno" + pollExampleNumber).attr("checked", true);
}



moreNumStart = 7;

 $(document).ready(function() {
		
	    $('div.poll_title').click(function(){
	        //alert(this);
	  	  var body$ = $(this).closest('div.module').find('div.poll_example');
	        if (body$.is(':hidden')) {
	          body$.show();
	        }
	        else {
	          body$.hide();
	        }
	      });
	 
 	$("#botton_more_poll").click(function() {
			
 		
		$.post("/LIP_Research/poll/MoreOngoingPoll.action", { "start" : moreNumStart },
				   
					function(data) {
			//alert(data);
					$(data).appendTo('#poll_space');
				     //alert("Data Loaded: " + data);
				   });
		moreNumStart =moreNumStart+5;
	});
 	
 	$('input[name$="result_button"]').click(function() {
 		 var pollNumber = parseInt(this.name);
 		 window.location.href = '/LIP_Research/poll/ResultPoll.action?pollNumber=' + pollNumber;
	});
 	
 	fOnload();
});


function aa(param) {
	
	param = param.toString().split(",");
	var poll = {};
	poll.result = [];
	poll.pollNumber = param[0];
	poll.pollQuestionType = param[1];
	poll.exampleType = param[2];
	poll.pollBalancePoint = param[3];
	
	
	//alert(poll.pollNumber + "  div 폴 아이디, +  폴 타입:" + poll.pollQuestionType);
	
	
	/* 보기 div 쓸줄 모르니깐 만들어 놓음  */
	
	var exampleBoxDiv = document.getElementById('exampleBoxDiv-' + poll.pollNumber);
	//alert(exampleBoxDiv.id);
	
	
	poll.pollcheked  = false;
	/* 값들을 추출해온다  */
	if (poll.pollQuestionType == 1) {
		/* 보기 라디오 박스의 elementList 형식: poll${poll.pollNumber}-example */		 
		//alert("라디오박스검사");
		var exampleInptList = document.getElementsByName("poll" + poll.pollNumber + "-example");
		//alert(exampleInptList.length );
		
		for ( var i = 0; i < exampleInptList.length; i++) {
			var example = exampleInptList[i];
			if (example.checked) {
				//alert(example.value);				
				poll.result = example.value;
				poll.pollcheked = true;
			}
		}
	
	} else if (poll.pollQuestionType == 2) {
		//alert("체크박스검사");
		var exampleInptList = document.getElementsByName("poll" + poll.pollNumber + "-example");
		//alert(exampleInptList.length );
		
		for ( var i = 0, j= 0 ; i < exampleInptList.length; i++) {
			var example = exampleInptList[i];
			if (example.checked) {
				alert(example.value);				
				poll.result[j] = example.value;
				poll.pollcheked = true;
				j++;
			}
		}
		poll.result.join(",");
	
	} else if (poll.pollQuestionType == 3) {
		//alert("좋아요 싫어요 검사");
		var exampleInptList = document.getElementsByName("poll" + poll.pollNumber + "-example");
		//alert(exampleInptList.length );
		
		for ( var i = 0, max = exampleInptList.length ; i < max; i++) {
			var example = exampleInptList[i];
			if (example.checked) {
				//alert(example.value);				
				poll.result = example.value;
				poll.pollcheked = true;
			}
		}
	} else if (poll.pollQuestionType == 4) {
		//alert("별 검사 ");
		
		var result = parseInt(document.getElementById("starScore").value);
		if(result == 0) {
			alert("별을 선택해 주세요");
			return;
		}
		poll.result = result;
		poll.pollcheked = true;
	}
	
	if (poll.pollcheked == false) {
		alert("입력해주세요");
		return;
	}
	
	//폴을 서버로 보낸다.
	jQuery.ajaxSettings.traditional = true;
	$.post( "/LIP_Research/poll/ParticipatePoll.action", poll,
      function( data ) {
        //alert(data);
      }
    );
	
	//폴을 접는다.
	
  	  var body$ = $(exampleBoxDiv);
      if (body$.is(':hidden')) {
        body$.show();
      }
      else {
        body$.hide();
      } 
      
    
      //타이틀에 부분에 참여라고 했다라고 표시한다.
      
     //버튼에 참여했음 라고 표시한다. 클릭이벤트를 지운다.
    //alert('button'+ poll.pollNumber);
	
	var button = document.getElementById('button'+ poll.pollNumber);
	button.onclick = null;
	button.value = '참여하셨습니다.';
      
      
}

  </script>
</head>
<body>
 <jsp:include page="../common/menu_bar/user_menu.jsp" />
  <div id="body-section">
    <div id="poll_space"> 
	<div class="ongoingpoll" style="font-size: 25;padding: 15;">
	 현재 진행중인 폴
	</div>
	<c:forEach var="poll" items="${polls }">
	<div class="module" id="m${poll.pollNumber }" >
		
	<div class="poll_title" style="padding-top: 10px; padding-bottom: 20px">
	  <!-- 폴제목 -->
	 <span style="padding-left: 15;display: block; float: left; ">
	  <c:if test="${poll.pollBalancePoint !=0}">
	   <img src="/LIP_Research/images/etc/1349615017_money_gold.png" width="25px" height="25px" alt="point" style="display: block;">
	   <label ><font color="#A7A341">1P</font></label>
	  </c:if>  
	 </span>
	 <span>
	  <c:if test="${poll.categoryNumber == 1}">
	    <img src="/LIP_Research/images/category/Love.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 2}">
	    <img src="/LIP_Research/images/category/Car.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 3}">
	     <img src="/LIP_Research/images/category/Movie.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 4}">
	     <img src="/LIP_Research/images/category/IT.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 5}">
	    <img src="/LIP_Research/images/category/Fashion.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 6}">
	    <img src="/LIP_Research/images/category/Maternity.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 7}">
	    <img src="/LIP_Research/images/category/Interior.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 8}">
	    <img src="/LIP_Research/images/category/Tv.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 9}">
	    <img src="/LIP_Research/images/category/Food.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 10}">
	    <img src="/LIP_Research/images/category/Economy.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">  
	  </c:if>
	  <c:if test="${poll.categoryNumber == 11}">
	    <img src="/LIP_Research/images/category/Finance.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	  <c:if test="${poll.categoryNumber == 12}">
	    <img src="/LIP_Research/images/category/Etc.gif" width="35px" height="35px" alt="point" style=" padding-left: 10;">
	  </c:if>
	 </span>
	 <span id=${poll.pollNumber } style="font-size:140%; padding-left: 20px; vertical-align : top; font-weight: bold;"> ${poll.pollQuestion} </span>
	<%--  <p  style="font-size:150%" id=${poll.pollNumber }> 폴 제목 ${poll.pollQuestion}   </p> --%>
	 
	 <%-- 
	 폴 타입 ${poll.pollQuestionType}, 폴보기 타입 ${poll.exampleType } 폴 넘버 ${poll.pollNumber}
	 <!-- 잔여포인트 -->
	  폴잔여포인트 ${poll.pollBalancePoint } 폴설명타입 ${poll.pollViewType }  
	  폴시작시간 <fmt:formatDate value="${poll.pollStartDate}" pattern="yyyy-MM-dd"   />
	  폴 종료시간 <fmt:formatDate value="${poll.pollEndDate}" pattern="yyyy-MM-dd"   /> --%>
	</div>
	<div class="poll_example" id="exampleBoxDiv-${poll.pollNumber }">
	 <div class="sss">
	  <!-- 제목에 따른 설명  -->
 	  <!-- 텍스트일때  -->
 	  <div id="pollViewType" style="text-align: center;">
 	  <c:if test="${poll.pollViewType == 1 }" >
 	   <span style="font-size: 25;">  ${poll.pollExplain }</span>
 	  </c:if>
 	  <!-- 사진일때  -->
 	  <c:if test="${poll.pollViewType == 2 }" >
 	    <span style="font-size: 25;"> ${poll.pollExplain }</span><br/>
 	    <img src="/LIP_Research/ReadImage.action?imgName=${poll.pollLink}" style="margin:0 auto;display:block" border="0" width="200" height="200"/>
 	  </c:if>
 	  <!-- 동영상일때  -->
 	  <c:if test="${poll.pollViewType == 3 }" >
 	   <span style="font-size: 25;"> ${poll.pollExplain }</span><br/>
 	   <iframe width="560" height="315" src="http://www.youtube.com/embed/${poll.pollLink}" frameborder="0" allowfullscreen style="margin-top: 10;"></iframe>
 	  </c:if>
 	  </div>
	 </div>

	<div class="sss">
	
	<!-- 단답형 -->
	<c:if test="${poll.pollQuestionType == 1 }">
	 <ul>
	  <!-- 보기가 text인 경우에 -->
	 <c:if test="${poll.exampleType == 1 }" >
	  <c:forEach var="example" items="${poll.exampleList }">  
	   <li>
		<input type="radio" name="poll${poll.pollNumber}-example" id="${example.exampleNumber }" value="${example.pollExampleNumber }" />
		<label for="${example.exampleNumber }">${example.exampleContant }</label>
	   </li>	
	  </c:forEach> 
	  </c:if> 
	  <!-- 보기가 사진인경우에 -->
	 <c:if test="${poll.exampleType == 2 }" >
	  <c:forEach var="example" items="${poll.exampleList }">  
	   
	   <li>
	    
	    <img src="/LIP_Research/ReadImage.action?imgName=${example.exampleLink}" width="200" height="200"/>
		<input type="radio" name="poll${poll.pollNumber}-example" id="${example.exampleNumber }" value="${example.pollExampleNumber }" />
		<label for="${example.exampleNumber }">${example.exampleContant }</label>
		
	   </li>	
	  </c:forEach> 
	  </c:if> 
	 </ul>
	</c:if>
	
	<!-- 다답형 -->	
	<c:if test="${poll.pollQuestionType == 2 }">
	 <ul>
	  <!-- 보기가 text인 경우에 -->
	 <c:if test="${poll.exampleType == 1 }" >
	  <c:forEach var="example" items="${poll.exampleList }">  
	   <li>
	   
		<input type="checkbox" name="poll${poll.pollNumber}-example" id="${example.exampleNumber }" value="${example.pollExampleNumber }" />
		<label for="${example.exampleNumber }">${example.exampleContant }</label>
	   </li>	
	  </c:forEach> 
	  </c:if> 
	  <!-- 보기가 사진인경우에 -->
	 <c:if test="${poll.exampleType == 2 }" >
	  <c:forEach var="example" items="${poll.exampleList }">  
	   <li>
		<img src="/LIP_Research/ReadImage.action?imgName=${example.exampleLink}" width="200" height="200"/>
		<input type="checkbox" name="poll${poll.pollNumber}-example" id="${example.exampleNumber }" value="${example.pollExampleNumber }" />
		<label for="${example.exampleNumber }">${example.exampleContant }</label>
	   </li>	
	  </c:forEach> 
	  </c:if> 
	 </ul>
	</c:if>	
	
	<!-- 좋아요 싫어요 -->
	
	<c:if test="${poll.pollQuestionType == 3 }">
	<div class="pollType3">
	 <table style="margin: auto;">
	 <tr>
	 <c:forEach var="example" items="${poll.exampleList }">
	  <c:if test="${example.exampleOrder == 1 }">
	  <td>
	  <div class="imgFrame" onclick="selectLike(this);" pollNumber="${poll.pollNumber}" pollExampleNumber="${example.pollExampleNumber }" style="width: 190px;height: 168px;text-align: center;cursor: pointer;"> 
	    <div class="activeOk" style=""> 
		<span class="like" style="display: inline-block;width: 71px; height: 66px; text-indent: -999em; background: url(/LIP_Research/images/etc/icon_f_likehate1.gif) no-repeat 0 0;margin-top: 28px;"> </span>
		
	   <!-- <img src="/LIP_Research/images/etc/icon_f_likehate1.gif" width="100" height="100" style=""/> -->
		<input type="radio" name="poll${poll.pollNumber}-example" id="exampleno${example.pollExampleNumber }" value="${example.pollExampleNumber }" />
		<label for="exampleno${example.pollExampleNumber }">좋아요</label>
		</div>
	    </div>
	    </td>
	  </c:if>
	  <c:if test="${example.exampleOrder == 2}">
	  <td>
	  <div class="imgFrame" onclick="selectLike(this);" pollNumber="${poll.pollNumber}" pollExampleNumber="${example.pollExampleNumber }" style="width: 190px;height: 168px;text-align: center; cursor: pointer;"> 
	    <div class="activeOk">
	   <span class="hate" style="display: inline-block;width: 71px; height: 66px; text-indent: -999em; background: url(/LIP_Research/images/etc/icon_f_likehate2.gif) no-repeat 0 0;margin-top: 28px;"> </span>
	   <!-- <img src="/LIP_Research/images/etc/icon_f_likehate1.gif" width="100" height="100"/> -->
		<input type="radio" name="poll${poll.pollNumber}-example" id="exampleno${example.pollExampleNumber }" value="${example.pollExampleNumber }" />
		<label for="exampleno${example.pollExampleNumber }">싫어요</label>
		</div>
	   </div>
	   </td>
	  </c:if>
	  </c:forEach>
	  </tr>
	 </table>
	 </div>
	</c:if>
	
	<!-- 별점주기 -->
	<c:if test="${poll.pollQuestionType == 4 }">
	 
	 <div class="starEvalute">
	 
	 <div id="setrating" class="lst" style="margin-left: 70;">
		
	<c:set value="0" var="i"/>
	   <c:forEach var="example" items="${poll.exampleList }">
		<img src="/LIP_Research/images/poll/rate0.png" id="R${i}" alt="${i}" style="cursor:pointer" title="Not at All" />
	    <input type="hidden" id="pollexample${i}" value="${example.pollExampleNumber }">
	    <c:set value="${i+1 }" var="i"/>
	   </c:forEach>
	   <input type="hidden" id="starScore" value="0">
	   </div>
	 </div>
	</c:if>

	 <!-- 회원이 참여한 폴인경우에는 비교해서 닫아버린다.  -->
		<c:set var="flog" value="0" />
		<c:if test="${session.lipMember.memberId == null }">
		  <c:set var="flog" value="${flog + 2 }" />
		</c:if>
		<c:forEach var="participated" items="${participatedList }">
		 <c:if test="${poll.pollNumber == participated}">
			
		  <c:set var="flog" value="${flog + 1 }" />
		  <script type="text/javascript">
			var exampleBoxDiv = document.getElementById('exampleBoxDiv-${poll.pollNumber }');
			var body$ = $(exampleBoxDiv);
		      if (body$.is(':hidden')) {
		        body$.show();
		      }
		      else {
		        body$.hide();
		      }
		  </script>
		 </c:if>
	
		</c:forEach>
     <br />
     </div>
     
      <div class="sss" style="text-align: center;">
      <c:if test="${flog == 0}">
       <input class="pointer" type="button" value="참여하기" onclick='aa(${poll.pollNumber} + "," + ${poll.pollQuestionType} + "," + ${poll.exampleType} + "," + ${poll.pollBalancePoint })' id="button${poll.pollNumber}" style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #0A3842; padding: 12px 0; text-align: center; ">
       <input class="pointer" type="button" value="결과보기" name="${poll.pollNumber}result_button" style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #9DB4B9; padding: 12px 0; text-align: center;">
      </c:if> 
      <c:if test="${flog == 1}">
       <input class="pointer" type="button" value="이미 참여 하셨습니다." style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #0A3842; padding: 12px 0; text-align: center;">
       <input class="pointer" type="button" value="결과보기" name="${poll.pollNumber}result_button" style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #9DB4B9; padding: 12px 0; text-align: center;">
      </c:if> 
      <c:if test="${flog == 2}">
       <input class="pointer" type="button" value="참여하기" onclick="alert('로그인해주세요'); location.href='/LIP_Research/jsp/user/access/login.jsp'" style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #0A3842; padding: 12px 0; text-align: center;">
       <input class="pointer" type="button" value="결과보기" name="${poll.pollNumber}result_button" style="width: 194px; height: 39px; border: none; font-size: 14px; font-weight: bold; color: white; background: #9DB4B9; padding: 12px 0; text-align: center;">
      </c:if>
      </div>
      <div class="sss">
       	기간 [ <fmt:formatDate value="${poll.pollStartDate}" pattern="yyyy-MM-dd"   /> ~
	 	 <fmt:formatDate value="${poll.pollEndDate}" pattern="yyyy-MM-dd" /> ]
      </div> 
    </div>
	
  </div>
  </c:forEach>
  </div>
  
  <div id="" class=""style="text-align: center;">
   <input type="button" name="" id="botton_more_poll" value="더보기" style="width: 194px;
height: 39px;
border: none;
font-size: 14px;
font-weight: bold;
color: white;
background: #0A3842;
padding: 12px 0;
">
  </div>
 </div>


 <jsp:include page="../common/banner/banner1.jsp" />

 <jsp:include page="../common/footer/footer1.jsp" />
</body>
</html>