var answer_num	=	2;
var question_type	=	1;
var answer_type	=	1;
var pic_answer_num	=	2;
var multiAnswerFlag	=	1;

function multiAnswer(){
	if(multiAnswerFlag==1){
		$(this).html("중복 선택하기");
		multiAnswerFlag	=	2;
		$('#multi_answer_value').val(1);
	}else{
		$(this).html("한 개만 선택하기");
		multiAnswerFlag	=	1;
	}	
	$('#multi_answer_value').val(multiAnswerFlag);
}

function deleteAnswer(){
	if(answer_num<3){
		return;	
	}
	$('#answer'+answer_num).remove();
	answer_num--;
}

function insertAnswer(){
	
	if(answer_num>4){
		return;	
	}
	answer_num++;
	
	$('#answer_list')
	.append(
			$('<tr></tr>')
			.attr('id', 'answer'+answer_num)
			.append(
				$('<td></td>')
				.html('답'+answer_num)
			)
			.append(
				$('<td></td>')
				.attr('id', 'answer'+answer_num)
				.append(
					$('<input></input>')
						.attr('type', 'text')
						.attr('name', 'answer')
						)
			)
		);
}

function insertPicAnswer(){
	if(pic_answer_num>4){
		return;	
	}
	pic_answer_num++;
	
	$('#pic_answer_tab')
	.append(
			$('<tr></tr>')
			.attr('id', 'pic_answer_'+pic_answer_num)
			.append(
				$('<td rowspan="2"></td>')
				.html('답'+pic_answer_num)
			)//append
			.append(
				$('<input></input>')
					.attr('type', 'text')
						.attr('placeholder', '답변 '+pic_answer_num+' 설명')
						.attr('name', 'picAnswer')
			)//append
			
		)
	.append(
		$('<tr></tr>')
			.attr('id', 'pic_answer_'+pic_answer_num)
			.append($('<td></td>')
				.append(
					$('<input></input>')
						.attr('type', 'file')
						.attr('name', 'picAnswerFile')	
						)
			)
	);
}

function deletePicAnswer(){
	
	if(pic_answer_num<3){
		return;	
	}
	$('#pic_answer_'+pic_answer_num).remove();
	$('#pic_answer_'+pic_answer_num).remove();
	pic_answer_num--;
	
}

function changeQuestionType(e){
	//el.toggleClass('active');
	
	var qt	=	$('input[name="question_type"]');
	
	if(question_type==e){
		return;	
	}
	$('a[name="question_type"]').remove('active');
	$(this).addClass('active');
	qt.val(e);
	question_type=e;
}

function changeAnswerType(e){
	var at	=	$('input[name="answer_type"]');
	
	if(answer_type==e){
			return;
	}
	
	switch(e){
		case 1:
			insertNormalEx();
		break;
		
		case 2:
		insertPicEx();
		break;
		case 3:
		insertMovEx();
		break;
		default:
		return;	
	}
	at.val(e);
	answer_type=e;
	
}

function insertNormalEx(){
	$('#explain_detail2').hide();
	$('#explain_detail3').hide();
	$('#explain_detail1').show();
}

function insertPicEx(e){
	//사진형 문제 넣기	
	$('#explain_detail3').hide();
	$('#explain_detail2').show();
}

function insertMovEx(){
	//동영상형 문제추가 형식
	$('#explain_detail2').hide();
	$('#explain_detail3').show();
}

function insertAnswerType(e){
	//기본형1 사진형2 좋아요?싫어요?3 별점4
	/*var elm	=	setAnswerView(e);
	$(elm).css('display', 'none');
	var value	=	'.answerOption'+e;
	$(value).show();
	*/
	switch(e){
		case 1:
			$('#answerOption2').hide();
			$('#answerOption3').hide();
			$('#answerOption4').hide();
			$('#answerOption1').show();
		break;
		
		case 2:
			$('#answerOption1').hide();
			$('#answerOption3').hide();
			$('#answerOption4').hide();
			$('#answerOption2').show();
		break;
		
		case 3:
			$('#answerOption1').hide();
			$('#answerOption2').hide();
			$('#answerOption4').hide();
			$('#answerOption3').show();
		break;
		
		case 4:
			$('#answerOption1').hide();
			$('#answerOption2').hide();
			$('#answerOption3').hide();
			$('#answerOption4').show();
		break;
		
		default:
		
		return;	
	}

	$('#answer_type').val(e);
	answer_type	=	e;
	
	answer_num	=	2;
	
}


function setAnswerView(e){
	var elms	=	'';
	
	for(var i=1; i<=4; i++){
		if(i!=e){
			elms	+=	'answerOption'+e+',';	
		}
	}
	
	return elms;
}



function init(){
	$('#insert_answer').click(function(){
	insertAnswer();
	});
	
	$('#delete_answer').click(deleteAnswer);
	
	insertNormalEx();
	
	$('#normalEx').click(function(){
		$('a[name="question_rule"]').removeClass();
		$(this).addClass('active');
		changeQuestionType(1);
		insertNormalEx();
	});
	
	$('#picEx').click(function(e) {
        $('a[name="question_rule"]').removeClass();
		$(this).addClass('active');
		changeQuestionType(2);
		insertPicEx();
    });
	
	$('#movieEx').click(function(e) {
        $('a[name="question_rule"]').removeClass();
		$(this).addClass('active');
		changeQuestionType(3);
		insertMovEx();	
    });
	
	$('a[name="a-display-kind"]').click(function(e){
		$('a[name="a-display-kind"]').removeClass();
		$(this).addClass('active');
	});
	
	$('#question_type').val(question_type);
	$('#answer_type').val(answer_type);
	
	$('#img_upload').click(function(){
			$('#image_url').hide();
			$('#image_ex').show();
	});
	
	$('#URL_upload').click(function(e) {
       	 
		$('#image_ex').hide();
		$('#image_url').show();
    });
	
	$('#point_yes').click(function(e) {
        $('#point_detail').show();
    });
	
	$('#point_no').click(function(e) {
        $('#point_detail').hide();
    });
	
	$('#category').find('option:even').css('background-color','rgba(204,204,204,1)');
	
	$('#insert_pic_answer').click(insertPicAnswer);
	
	$('#delete_pic_answer').click(deletePicAnswer);
	
	$('#multi_answer').click(multiAnswer);
	
}