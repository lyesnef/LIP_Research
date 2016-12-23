<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- <link rel="stylesheet" href="/LIP_Research/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/LIP_Research/css/bootstrap/css/bootstrap-responsive.css"> -->
<!-- <link rel="stylesheet" href="/LIP_Research/css/bootstrap/css/bootstrap.css">-->
<!-- <link rel="stylesheet" href="/LIP_Research/css/bootstrap/css/bootstrap.css">  -->

<%--  <script type='text/javascript' src="http://widcraft.googlecode.com/svn/jquery.js"></script>
  --%>
<%--   <script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script> --%>
<link rel="stylesheet" href="/LIP_Research/css/banner_style.css">
<%--  <script type="text/javascript">
	$(function() {

		var offset = $("#sidebar").offset();
		var topPadding = 60;
		$(window).scroll(function() {
			if ($(window).scrollTop() > offset.top) {
				$("#sidebar").stop().animate({
					marginTop : $(window).scrollTop() - offset.top + topPadding
				});
			} else {
				$("#sidebar").stop().animate({
					marginTop : 10
				});
			}
			;
		});
	});
</script>  --%>
<div class="container">
	<div class="row">
		<div id="sidebar" style="width: 210px; float: right;" class="sidebar">

			<div id="page-wrap">
				<s:if test="#session.lipMember != null">
					<table id="feature-table">
						<colgroup class="pro"></colgroup>
						<thead>
							<tr>
								<td style="background-color: lavender;">LIPEAN</td>
							</tr>
							<tr>

								<th id="header-pro" class="table-col-1"><s:if
										test="#session.lipMember.memberImage!=null">

										<img alt=""
											src="/LIP_Research/ReadImage.action?imgName=<s:property value="#session.lipMember.memberImage"/>"
											title="나의정보" width="158" height="150" align="middle"
											hspace="5"
											onclick="window.location='/LIP_Research/poll/MyInfo.action'"
											style="cursor: pointer;">


									</s:if> <s:else>
										<s:if test="#session.lipMember.genderNumber==1">
											<img alt=""
												src="/LIP_Research/images/common/member/default1.gif"
												title="나의정보" width="158" height="150" align="middle"
												onclick="window.location='/LIP_Research/poll/MyInfo.action'"
												style="cursor: pointer;" hspace="5">
										</s:if>
										<s:elseif test="#session.lipMember.genderNumber==2">
											<img alt=""
												src="/LIP_Research/images/common/member/default_woman.jpg"
												title="나의정보" width="158" height="150" align="middle"
												hspace="5"
												onclick="window.location='/LIP_Research/poll/MyInfo.action'"
												style="cursor: pointer;">
										</s:elseif>
									</s:else>
									<p style="margin-bottom: 10px;">
										<strong><s:property
												value="#session.lipMember.memberId" /></strong>님<br /> 환영합니다!
									</p> <a class="bbutton" href="/LIP_Research/poll/MyInfo.action"
									style="cursor: pointer;">내 정보보기</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<p>
										<img style="margin-top: -4px; margin-right: 8px;" width="20"
											height="20" src="/LIP_Research/images/point/clip.png"
											title="잔여클립" /><font color="black"><strong>
												<s:property value="#session.lipMember.memberPoint" />
										</strong></font> CLIP
									</p>
								</td>
							</tr>
							<tr class="odd">
								<td><a href="/LIP_Research/poll/MakePoll.action"
									style="text-decoration: none">폴만들기</a></td>
							</tr>
							<tr>
								<td><a href="/LIP_Research/MakeSurvey.action"
									style="text-decoration: none"> 서베이 만들기 </a></td>
							</tr>

							<tr class="odd final-row">
								<td><a class="bbutton" style="width: 200px;"
									href="/LIP_Research/poll/LogoutAction.action"><strong>로그아웃
									</strong> </a></td>
							</tr>
						</tbody>
					</table>
				</s:if>
				<s:else>
					<table id="feature-table">

						<colgroup class="pro"></colgroup>
						<thead>
							<tr>
								<td style="background-color: lavender; text-align: center"><strong>Be
										a LIPEAN!</strong><br />right now!</td>
							</tr>
							<tr>

								<th id="header-pro" style="height: 100px" class="table-col-1">
									<p>리서치 그룹 LIP에 오신 것을 환영합니다.</p>
									<p>개인폴, 서베이 등에 참여해서 포인트도 벌고</p>
									<p>원하는 통계자료가 있다면 손쉽게 조사하세요!</p> <a class="bbutton"
									href="/LIP_Research/jsp/user/join/regForm.jsp">Sign Up</a>
								</th>
							</tr>
						</thead>
					</table>
				</s:else>
			<%-- 	<s:if test="#session.lipMember!=null">
					<table style="margin-top: 18px;" id="feature-table">
						<colgroup class="basic"></colgroup>

						<thead>
							<tr>
								<th id="header-basic" class="table-col-1">참여가능 서베이</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="#session.lipMember != null">
								<s:iterator value="#session.enterList" status="groupStatus">
									<tr <s:if test="#groupStatus.odd == true"> class="odd"</s:if>>
										<td class="table-col-1"><a style="text-decoration: none;"
											href='/LIP_Research/survey/PreviewSurvey.action?surveyNum=<s:property value="surveyNumber" />'>
												<s:property value="surveyNumber" />번 <s:property
													value="surveyTitle" />
										</a></td>
									</tr>
								</s:iterator>
							</s:if>
						</tbody>
					</table>
				</s:if>  --%>
			</div>
		</div>
	</div>
	

</div>
<%-- <script type="text/javascript" src="/LIP_Research/js/common/jquery-1.8.1.js"></script>  --%>
<%-- <script type="text/javascript">
<!--
	$(function() {

		var numCols = $("colgroup").length, featuredCol;

		// Zebra striping
		$("td:odd").addClass("odd");
		$("td:last").addClass("final-row");

		// Figure out which column # is featured.
		$("colgroup").each(function(i) {
			if (this.id == "featured")
				featuredCol = i + 1;
		});

		// Apply classes to each table cell indicating column
		// Also applies classes if cell is right or left of featured column
		$("td, th").each(function(i) {
			$(this).addClass("table-col-" + ((i % numCols) + 1));
			if (((i % numCols) + 1) == (featuredCol - 1))
				$(this).addClass("leftOfFeatured");
			if (((i % numCols) + 1) == (featuredCol + 1))
				$(this).addClass("rightOfFeatured");
		});

	});
//-->
</script> --%>


