<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>LIP Research - 문제만들기</title>
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
<br/>
<div id="bodyMain">
	
		<input type="hidden" name="queCnt" value="${queCnt}"/>
		<div class="section">

			<div class="title">문제 만들기</div>

		</div>


		<div class="section">

			<div class="sub1">

				<div class="question">
					
					<!-- poll type hidden --> 
					<input type="hidden" id="question_type${queCnt}" name="question_type${queCnt}" value="1" /> 
					<input type="hidden" id="answer_type${queCnt}" name="answer_type${queCnt}" value="1" />

					<textarea name="question${queCnt}" rows="1" id="question${queCnt}"
						placeholder="질문을 입력하세요.">${fieldErrors.question }</textarea>
					<div class="question_source">
						<ul class="tabmenu_poll">
							<li><a href="#" id="normalEx${queCnt}" class="active">
							<span class="tab1">텍스트 설명 추가</span></a></li>

							<li><a href="#" id="picEx${queCnt}" > 
							<span class="tab1">사진 설명 추가</span></a></li>

							<li><a href="#" id="movieEx${queCnt}" >
							<span class="tab1">동영상 설명 추가</span></a></li>
						</ul>
					</div>
					
					<div id="explain_detail1_${queCnt}">
						<textarea rows="3" placeholder="설명을 입력하세요." id="question_detail${queCnt}"
							name="question_detail${queCnt}">${fieldErrors.question_detail }</textarea>
					</div>

					<!-- url 사진형 -->
					<div style="display: none" id="explain_detail2_${queCnt}">
						<ul>
							<li><a id="img_upload${queCnt}" href="#">이미지 업로드</a></li>
							<li><a id="URL_upload${queCnt}" href="#">이미지 URL등록</a></li>
						</ul>

						<div id="image_ex${queCnt}">
							<input type="file" name="question_img_file_que" value="찾아보기" />
							<p>파일형식 : jpg, gif, png</p>
							<p>최대 업로드 용량 : 100kbyte</p>
						</div>
						<div id="image_url${queCnt}" style="display: none">
							<input type="text" value="" name="img_url${queCnt}" />
						</div>
					</div>
					<!-- url 동영상 -->
					<div style="display: none" id="explain_detail3_${queCnt}">
						<label>유튜브</label><input type="text" placeholder="유튜브 동영상 경로"
							value="${fieldErrors.youtubefileURL}" name="youtubefileURL${queCnt}" />
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
					<li style="margin-left: 10%;"><a style="width:200px;" href="#" id="insertAnswerTypeText${queCnt}"
						class="active"> <span>기본형</span>
					</a></li>
					<li><a style="width:200px;" href="#" id="insertAnswerTypePic${queCnt}"
						> <span>사진형</span>
					</a></li>
					
				</ul>
			</div>
			<!-- 답변 기본형 -->
			<div id="answerOption1_${queCnt}">
				<table id="answer_list${queCnt}">
					<tr id="answer1_${queCnt}">
						<td>답1</td>
						<td><input type="text" name="answer_${queCnt}" id="answer_${queCnt}_1"
							value="${fieldErrors.answer}" />
							<%-- <input type="checkbox" checked name="answerRadio_${queCnt}_1"/>권역설정</td> --%>
					</tr>
					<tr id="answer2_${queCnt}">
						<td>답2</td>
						<td id="answer2"><input type="text" id="answer_${queCnt}_2"
							name="answer_${queCnt}" value="${fieldErrors.answer}" />
							<%-- <input type="checkbox" name="answerRadio_${queCnt}_2" />권역설정</td> --%>
					</tr>
				</table>
				<input type="button" id="insert_answer${queCnt}" value="답추가" /> <input
					type="button" id="delete_answer${queCnt}" value="답삭제" />
			</div>
			<!-- 답변 사진형 -->
			<div style="display: none" id="answerOption2_${queCnt}">
				<table id="pic_answer_tab${queCnt}">
					<tr id="pic_answer1_${queCnt}">
						<td rowspan="2">답1</td>
						<td><input style="float: left;" type="text" name="picAnswer_${queCnt}" value="${fieldErrors.picAnswer}" placeholder="답변1 설명" />
						<%-- <input type="checkbox" name="picAnswerRadio_${queCnt}_1" />권역설정 --%>
						</td>
					</tr>
					<tr>
						<td><input type="file" name="picAnswerFile" /></td>
					</tr>

					<tr id="pic_answer_2_${queCnt}">
						<td rowspan="2">답2</td>
						<td><input style="float: left;" type="text" name="picAnswer_${queCnt}" value="${fieldErrors.picAnswer}" placeholder="답변2 설명" />
						<%-- <input type="checkbox" name="picAnswerRadio_${queCnt}_2" />권역설정</td> --%>
					</tr>
					<tr>
						<td><input type="file" name="picAnswerFile" /></td>
					</tr>

				</table>
				<!-- 답갯수 -->
				<input type="button" id="insert_pic_answer${queCnt}" value="답추가" /> <input
					type="button" id="delete_pic_answer${queCnt}" value="답삭제" />

			</div>			
		</div>
	
</div>
	<script src="/LIP_Research/js/user/survey/makesurvey.js"></script>
</body>
</html>