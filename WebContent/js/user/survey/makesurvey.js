

/*function checkForm(e){
	
	var form	=	document.fm;
	alert($('#question_type').val());
	alert($('#answer_type').val());

	
	if($('#question').val()==null||$('#question').val()==""){
		alert('질문을 입력해주세요');
		return false;	
	}
	if($('#question_detail').val()==null||$('#question_detail').val()==""){
		alert('질문의 상세내용을 입력해주세요');
		return false;	
	}
	
	if($('#answer_type').val()==1){
		var arr	=	document.getElementsByName("answer");
		for(var i	=	0; i<arr.length; i++){
			if(arr[i].value==null||arr[i].value.length<1){
				alert('보기의 값을 입력해 주세요');
				return false;	
			}
		}
	}
	
	if($('#answer_type').val()==2){
		var picArr	=	document.getElementsByName("picAnswer");
		for(var i	=	0; i<picArr.length; i++){
		if(picArr[i].value==null||picArr[i].value.length<1){
			alert('사진보기의 값을 입력해 주세요');
			return false;	
			}
		}
	}
	
	if(form.start_date.value==null||form.start_date.value==''){
		alert('시작일을 입력해주세요');
		return false;	
	}
	
	if(form.end_date.value==null||form.end_date.value==''){
		alert('종료일을 입력해주세요');
		return false;	
	}
	var checkedRadio	=	$('.radiobox:checked').val();
	if(checkedRadio==1){
		var value	=	$('input[name="bettingPoint"]').val();
		if(value<10||value==""){
			alert('포인트는 10포인트 이상 부터 사용할 수 있습니다.');
			return false;	
		}
	}
	return true;
}*/

function init(val){
	
//수정 완료 기능 체크 완료
	
	//기본형 질문 답변 추가 -----------------------------------------------------
	var answer_num = 2;
	var pic_answer_num	=	2;
	
	$('#insert_answer'+val).click(function(){
		if(answer_num>4){
			return;
		}
		answer_num++;
		if(isNaN(val)==false){
			$('#answer_list'+val)
			.append(
					$('<tr></tr>')
					.attr('id', 'answer'+val+'_'+answer_num)
					.append(
						$('<td></td>')
						.html('답'+answer_num)
					)
					.append(
						$('<td></td>')
						.attr('id', 'answer'+ val +'_'+answer_num)
						.append(
							$('<input></input>')
								.attr('type', 'text')
								.attr('name', 'answer_'+val)
								)
						
						.append(
								$('<input></input>')
									.attr('type', 'checkbox')
									.attr('name', 'answerRadio_'+val+'_'+answer_num)
									.attr('value', 'text'+val+'-'+answer_num)
									)
						.append('권역설정')
					)			
					
				);
		}else{
			$('#answer_list'+val)
			.append(
					$('<tr></tr>')
					.attr('id', 'answer'+val+'_'+answer_num)
					.append(
						$('<td></td>')
						.html('답'+answer_num)
					)
					.append(
						$('<td></td>')
						.attr('id', 'answer'+ val +'_'+answer_num)
						.append(
							$('<input></input>')
								.attr('type', 'text')
								.attr('name', 'answer_'+val)
								)
						
						
					)			
					
				);
		}
		
		
	});
	//기본형 질문 답변 삭제 -----------------------------------------------------
	$('#delete_answer'+val).click(function(){
		if(answer_num<3){
			return;	
		}
		$('#answer'+val+'_'+answer_num).remove();
		answer_num--;
	});
	
	//답변 타입 변경 텍스트형 ------------------------------------------------
	$('#insertAnswerTypeText'+val).click(function(){
		$('#answerOption2'+'_'+val).hide();
		$('#answerOption1'+'_'+val).show();
		$('#insertAnswerTypePic'+val).removeClass();
		$(this).addClass('active');
		$('#answer_type' + val).val(1);
	});
	//답변 타입 변경 사진형 -------------------------------------------------
	$('#insertAnswerTypePic'+val).click(function(){
		$('#answerOption1'+'_'+val).hide();
		$('#answerOption2'+'_'+val).show();
		$('#insertAnswerTypeText'+val).removeClass();
		$(this).addClass('active');
		$('#answer_type' + val).val(2);
	});
	
	//사진형 답변 추가------------------------------------------------------
	
	$('#insert_pic_answer'+val).click(function(){
		
		if(pic_answer_num>4){
			return;	
		}
		pic_answer_num++;
		
		if(isNaN(val)==false){
			$('#pic_answer_tab'+val)
			.append($('<tr></tr>')
					.attr('id', 'pic_answer_'+val + '_' +pic_answer_num)
					.append($('<td rowspan="2"></td>').html('답'+pic_answer_num))//append
					.append($('<td></td>')
						.append($('<input></input>').attr('type', 'text')
								.attr('placeholder', '답변 '+pic_answer_num+' 설명')
								.attr('name', 'picAnswer_'+val)
								.attr('style','float:left')
						)//append
						.append($('<input></input>').attr('type', 'checkbox')
								.attr('name', 'picAnswerRadio_'+val+'_'+pic_answer_num)
								.attr('value', 'pic' + val + '-' +pic_answer_num)
						)
						.append('권역설정')
					)
			)
			.append($('<tr></tr>')
					.attr('id', 'pic_answer_'+ val + '_' +pic_answer_num)
					.append($('<td></td>')
						.append(
							$('<input></input>')
								.attr('type', 'file')
								.attr('name', 'picAnswerFile')	
								)
					)
			);
		}else{
			$('#pic_answer_tab'+val)
			.append($('<tr></tr>')
					.attr('id', 'pic_answer_'+val + '_' +pic_answer_num)
					.append($('<td rowspan="2"></td>').html('답'+pic_answer_num))//append
					.append($('<td></td>')
						.append($('<input></input>').attr('type', 'text')
								.attr('placeholder', '답변 '+pic_answer_num+' 설명')
								.attr('name', 'picAnswer_'+val)
								.attr('style','float:left')
						)//append
						
					)
			)
			.append($('<tr></tr>')
					.attr('id', 'pic_answer_'+ val + '_' +pic_answer_num)
					.append($('<td></td>')
						.append(
							$('<input></input>')
								.attr('type', 'file')
								.attr('name', 'picAnswerFile')	
								)
					)
			);
		}
		
		
	});
	
	//사진형 답변 삭제-----------------------------------------------------------
	$('#delete_pic_answer'+val).click(function(){
		if(pic_answer_num<3){
			return;	
		}
		$('#pic_answer_'+val+'_'+pic_answer_num).remove();
		$('#pic_answer_'+val+'_'+pic_answer_num).remove();
		pic_answer_num--;
	});
	
	//초기화 설정 텍스트형--------------------------------------------------------
	$('#explain_detail2'+'_'+val).hide();
	$('#explain_detail3'+'_'+val).hide();
	$('#explain_detail1'+'_'+val).show();
	$('#question_type'+val).val(1);
	
	//텍스트형 질문 클릭된 경우-----------------------------------------------------
	$('#normalEx'+val).click(function(){
		$('#picEx'+val).removeClass();
		$('#movieEx'+val).removeClass();
		$(this).addClass('active');
		$('#question_type'+val).val(1);
		$('#explain_detail2'+'_'+val).hide();
		$('#explain_detail3'+'_'+val).hide();
		$('#explain_detail1'+'_'+val).show();
	});
	
	//사진형 질문 선택된 경우------------------------------------------------------
	$('#picEx'+val).click(function() {
		$('#normalEx'+val).removeClass();
		$('#movieEx'+val).removeClass();
		$(this).addClass('active');
		$('#question_type'+val).val(2);
		$('#explain_detail3'+'_'+val).hide();
		$('#explain_detail2'+'_'+val).show();
    });
	
	//동영상 질문 선택된 경우------------------------------------------------------
	$('#movieEx'+val).click(function(e) {
		$('#normalEx'+val).removeClass();
		$('#picEx'+val).removeClass();
		$(this).addClass('active');
		$('#question_type'+val).val(3);
		$('#explain_detail2'+'_'+val).hide();
		$('#explain_detail3'+'_'+val).show();
    });
	
	//사진형 클릭시 초기화
	$('#img_upload'+val).css('color','white');
	$('#URL_upload'+val).css('color','white');
	
	//이미지 질문형 URL 클릭시
	$('#URL_upload'+val).click(function() {
		$('#image_ex'+val).hide();
		$('#image_url'+val).show();
    });
	
	//이미지 질문형 파일 클릭시
	$('#img_upload'+val).click(function(){
		$('#image_url'+val).hide();
		$('#image_ex'+val).show();
	});
	
	
	//--------------------------미수정------------------------------------
	
	//--------------------------추가사항-----------------------------------
	
	$('#end_date'+val).datepicker({
		changeMonth: true,	changeYear: true,
		// buttonText:'선택',
		altField: '#datepicker', altFormat: 'yy-mm-dd',
		defaultDate: '+0m+0d', minDate: '+0d'
	});
	$('#start_date'+val).datepicker({
		changeMonth: true,	changeYear: true,
		onSelect:function(selectedDate){
			$('#end_date'+val).datepicker('option','minDate', $.datepicker.parseDate($.datepicker._defaults.dateFormat, selectedDate));
		},
		altField: '#datepicker', altFormat: 'yy-mm-dd',
		defaultDate: '+0m+0d', minDate: '+0d'
	});
	$('#end_date'+val).click(function(){
		if($('#start_date'+val).val()==null || $('#start_date'+val).val()==""){
			alert("시작 날짜를 선택해주세요.");
			$('#end_date'+val).datepicker("disable");
		}
	});
	$('#start_date'+val).click(function(){
		$('#end_date'+val).datepicker("enable");
	});
}