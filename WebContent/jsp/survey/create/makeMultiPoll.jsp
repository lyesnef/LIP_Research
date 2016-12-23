<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>LIP Research - 복합폴만들기</title>
<link rel="stylesheet" href="../../css/poll.css" />
<link rel="stylesheet" href="/LIP_Research/css/poll.css" />
<link rel="stylesheet" href="/LIP_Research/css/style.css" />

<style type="text/css">
	#bodyMain{
		width:90%;
		margin: auto;
	}
</style>

</head>
<body>

	<%-- <jsp:include page="/jsp/common/menu_bar/user_menu.jsp" /> --%>
<br/>
<div id="bodyMain">
	
		<input type="hidden" name="pollCnt" value="${pollCnt}"/>
		<div class="section">

			<div class="title">이벤트 폴 만들기</div>

		</div>


		<div class="section">

			<div class="sub1">

				<div class="question">
					
					<!-- poll type hidden --> 
					<input type="hidden" id="question_type${pollCnt}" name="question_type${pollCnt}" value="1" /> 
					<input type="hidden" id="answer_type${pollCnt}" name="answer_type${pollCnt}" value="1" />

					<textarea name="question${pollCnt}" rows="1" id="question${pollCnt}"
						placeholder="질문을 입력하세요.">${fieldErrors.question }</textarea>
					<div class="question_source">
						<ul class="tabmenu_poll">
							<li><a href="#" id="normalEx${pollCnt}" class="active">
							<span class="tab1">텍스트 설명 추가</span></a></li>

							<li><a href="#" id="picEx${pollCnt}" > 
							<span class="tab1">사진 설명 추가</span></a></li>

							<li><a href="#" id="movieEx${pollCnt}" >
							<span class="tab1">동영상 설명 추가</span></a></li>
						</ul>
					</div>
					
					<div id="explain_detail1_${pollCnt}">
						<textarea rows="3" placeholder="설명을 입력하세요." id="question_detail${pollCnt}"
							name="question_detail${pollCnt}">${fieldErrors.question_detail }</textarea>
					</div>

					<!-- url 사진형 -->
					<div style="display: none" id="explain_detail2_${pollCnt}">
						<ul>
							<li><a id="img_upload${pollCnt}" href="#">이미지 업로드</a></li>
							<li><a id="URL_upload${pollCnt}" href="#">이미지 URL등록</a></li>
						</ul>

						<div id="image_ex${pollCnt}">
							<input type="file" name="question_img_file_poll" value="찾아보기" />
							<p>파일형식 : jpg, gif, png</p>
							<p>최대 업로드 용량 : 100kbyte</p>
						</div>
						<div id="image_url${pollCnt}" style="display: none">
							<input type="text" value="" name="img_url${pollCnt}" />
						</div>
					</div>
					<!-- url 동영상 -->
					<div style="display: none" id="explain_detail3_${pollCnt}">
						<label>유튜브</label><input type="text" placeholder="유튜브 동영상 경로"
							value="${fieldErrors.youtubefileURL}" name="youtubefileURL${pollCnt}" />
					</div>
				</div>
			</div>
		</div>

		<div class="section">
			<div>
				<label>답변 등록하기</label>
			</div>
			<div align="center">
				<ul class="tabmenu_answer">
					<li style="margin-left: 10%;"><a style="width:200px;" href="#" id="insertAnswerTypeText${pollCnt}"
						class="active"> <span>기본형</span>
					</a></li>
					<li><a style="width:200px;" href="#" id="insertAnswerTypePic${pollCnt}"
						> <span>사진형</span>
					</a></li>
					
				</ul>
			</div>
			<!-- 답변 기본형 -->
			<div id="answerOption1_${pollCnt}">
				<table id="answer_list${pollCnt}">
					<tr id="answer1_${pollCnt}">
						<td>답1</td>
						<td><input type="text" name="answer_${pollCnt}" id="answer_${pollCnt}_1"
							value="${fieldErrors.answer}" />
							<input type="checkbox" checked name="answerRadio_${pollCnt}_1" value="text${pollCnt}-1"/>권역설정</td>
					</tr>
					<tr id="answer2_${pollCnt}">
						<td>답2</td>
						<td id="answer_1_${pollCnt}"><input type="text" id="answer_${pollCnt}_2"
							name="answer_${pollCnt}" value="${fieldErrors.answer}" />
							<input type="checkbox" name="answerRadio_${pollCnt}_2" value="text${pollCnt}-2" />권역설정</td>
					</tr>
				</table>
				<input type="button" id="insert_answer${pollCnt}" value="답추가" /> <input
					type="button" id="delete_answer${pollCnt}" value="답삭제" />
			</div>
			<!-- 답변 사진형 -->
			<div style="display: none" id="answerOption2_${pollCnt}">
				<table id="pic_answer_tab${pollCnt}">
					<tr id="pic_answer_1_${pollCnt}">
						<td rowspan="2">답1</td>
						<td><input style="float: left;" type="text" name="picAnswer_${pollCnt}" value="${fieldErrors.picAnswer}" placeholder="답변1 설명" />
						<input type="checkbox" name="picAnswerRadio_${pollCnt}_1"  value="pic${pollCnt}-1"/>권역설정
						</td>
					</tr>
					<tr>
						<td><input type="file" name="picAnswerFile" /></td>
					</tr>

					<tr id="pic_answer_2_${pollCnt}">
						<td rowspan="2">답2</td>
						<td><input style="float: left;" type="text" name="picAnswer_${pollCnt}" value="${fieldErrors.picAnswer}" placeholder="답변2 설명" />
						<input type="checkbox" name="picAnswerRadio_${pollCnt}_2" value="pic${pollCnt}-2"/>권역설정</td>
					</tr>
					<tr>
						<td><input type="file" name="picAnswerFile" /></td>
					</tr>

				</table>
				<!-- 답갯수 -->
				<input type="button" id="insert_pic_answer${pollCnt}" value="답추가" /> <input
					type="button" id="delete_pic_answer${pollCnt}" value="답삭제" />

			</div>
			
			
			
			
		</div>
	
</div>
	<%-- <jsp:include page="/jsp/common/footer/footer.jsp" /> --%>

	<%-- <script src="/LIP_Research/js/common/kw/makepoll.js"></script> --%>
	<script src="/LIP_Research/js/user/survey/makesurvey.js"></script>
<%-- 	<script src="/LIP_Research/js/common/jquery-1.8.1.js"></script> --%>

</body>
</html>