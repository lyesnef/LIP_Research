<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" href="/LIP_Research/css/banner_style1.css">
<div id="banner-section" style="color: #777;
font-size: 13px;
font-family: 'Nanum',nanumgothic,'돋움',Dotum,AppleGothic,Helvetica,sans-serif;">
<div class="banner-section">
	<div class="row">
		<div id="sidebar" class="sidebar">

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
										<s:property value="#session.lipMember.memberPoint" /></strong></font>
										CLIP
									</p>
								</td>
							</tr>
							<tr class="odd">
								<td><a href="/LIP_Research/poll/MakePoll.action">폴만들기</a></td>
							</tr>
							<tr>
								<td><a href="/LIP_Research/MakeSurvey.action"> 서베이 만들기
								</a></td>
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
								<td style="background-color: lavender;text-align:center"><strong>Be a LIPEAN!</strong><br />right now!</td>
							</tr>
							<tr>
								
								<th id="header-pro" style="height:100px" class="table-col-1">
								<p>리서치 그룹 LIP에 오신 것을 환영합니다.</p>
								<p>개인폴, 서베이 등에 참여해서 포인트도 벌고</p>
								<p>원하는 통계자료가 있다면 손쉽게 조사하세요!</p>
								<a class="bbutton"
									href="/LIP_Research/jsp/user/join/regForm.jsp">Sign Up</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배너</td>
							</tr>
						</tbody>
					</table>
				</s:else>

				<table style="width: 180;text-align: center;">
				<colgroup class="basic"></colgroup>

					<thead>
						<tr>
							<th id="header-basic" class="table-col-1">참여가능 서베이</th>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="#session.enterList" status="groupStatus">
						<tr<s:if test="#groupStatus.odd == true"> class="odd"</s:if>>
							<td class="table-col-1"><a href='/LIP_Research/survey/PreviewSurvey.action?surveyNum=<s:property value="surveyNumber" />'>
							<s:property value="surveyNumber" />번 
							<s:property value="surveyTitle" />
							</a></td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</div>
</div>

