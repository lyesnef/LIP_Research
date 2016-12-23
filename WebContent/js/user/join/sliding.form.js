$(function() {
	/*
	 * number of fieldsets
	 */

	var fieldsetCount = $('#formElem').children().length;

	/*
	 * current position of fieldset / navigation link
	 */
	var current = 1;

	/*
	 * sum and save the widths of each one of the fieldsets set the final sum as
	 * the total width of the steps element
	 */
	var stepsWidth = 0;
	var widths = new Array();
	$('#steps .step').each(function(i) {
		var $step = $(this);
		widths[i] = stepsWidth;
		stepsWidth += $step.width();
	});
	$('#steps').width(stepsWidth);

	/*
	 * to avoid problems in IE, focus the first input of the form
	 */
	$('#formElem').children(':first').find(':input:first').focus();

	/*
	 * show the navigation bar
	 */
	$('#navigation').show();

	/*
	 * when clicking on a navigation link the form slides to the corresponding
	 * fieldset
	 */
	$('#navigation a').bind(
			'click',
			function(e) {
				var $this = $(this);
				var prev = current;
				$this.closest('ul').find('li').removeClass('selected');
				$this.parent().addClass('selected');
				/*
				 * we store the position of the link in the current variable
				 */
				current = $this.parent().index() + 1;
				/*
				 * animate / slide to the next or to the corresponding fieldset.
				 * The order of the links in the navigation is the order of the
				 * fieldsets. Also, after sliding, we trigger the focus on the
				 * first input element of the new fieldset If we clicked on the
				 * last link (confirmation), then we validate all the fieldsets,
				 * otherwise we validate the previous one before the form slided
				 */
				$('#steps').stop().animate(
						{
							marginLeft : '-' + widths[current - 1] + 'px'
						},
						500,
						function() {
							if (current == fieldsetCount)
								validateSteps();
							else
								validateStep(prev);
							$('#formElem').children(
									':nth-child(' + parseInt(current) + ')')
									.find(':input:first').focus();
						});
				e.preventDefault();
			});

	/*
	 * clicking on the tab (on the last input of each fieldset), makes the form
	 * slide to the next step
	 */
	$('#formElem > fieldset').each(
			function() {
				var $fieldset = $(this);
				$fieldset.children(':last').find(':input').keydown(
						function(e) {
							if (e.which == 9) {
								$(
										'#navigation li:nth-child('
												+ (parseInt(current) + 1)
												+ ') a').click();
								/* force the blur for validation */
								$(this).blur();
								e.preventDefault();
							}
						});
			});

	/*
	 * validates errors on all the fieldsets records if the Form has errors in
	 * $('#formElem').data()
	 */
	function validateSteps() {
		var FormErrors = false;
		for ( var i = 1; i < fieldsetCount; ++i) {
			var error = validateStep(i);
			if (error == -1)
				FormErrors = true;
		}
		$('#formElem').data('errors', FormErrors);
	}

	/*
	 * validates one fieldset and returns -1 if errors found, or 1 if not
	 */
	function validateStep(step) {
		if (step == fieldsetCount)
			return;

		var error = 1;
		var hasError = false;
		$('#formElem').children(':nth-child(' + parseInt(step) + ')').find(
				':input:not(button)').each(
				function() {
					var $this = $(this);
					/* var valueLength = jQuery.trim($this.val()).length; */

					var recommend = document.getElementById('recommend');

					if (hasError == false) {
						// agreement
						if (this.id == 'agreement') {
							var radioButton = document
									.getElementById('agreement');
							// 동의할 경우
							if (radioButton.checked == true) {
								if (radioButton.value == 'agree') {
									hasError = false;
								}
							} else {
								if (hasError == false) {
									alert('약관에 동의해주세요.');
								}
								hasError = true;
							}
						}
						// User ID
						else if (this.id == 'userid') {
							var id = document.getElementById('userid');
							// 아이디 체크 길이 0일때
							if (id.value.length == '') {
								if (hasError == false) {
									alert('아이디를 입력해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 길이 초과일때
							else if (id.value.length < 6
									|| id.value.length > 12) {
								if (hasError == false) {
									alert('아이디는 6~12자 입니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 숫자로만 이루어졌거나 특수문자인 경우
							else if (id.value.length > 5
									&& id.value.length < 13) {
								var str = id.value;
								var splitStr = str.split('');
								var cntStr = 0;
								for ( var i = 0; i < id.value.length; i++) {
									var ch_char = str.charAt(i);
									var ch = ch_char.charCodeAt();
									if ((ch >= 33 && ch <= 47)
											|| (ch >= 58 && ch <= 64)
											|| (ch >= 91 && ch <= 96)
											|| (ch >= 123 && ch <= 126)) {
										if (hasError == false) {
											alert('아이디는 특수문자가 올 수 없습니다.');
										}
										hasError = true;
										$this
												.css('background-color',
														'#FFEDEF');
										break;
									} else if (ch >= 44031 && ch <= 55203
											|| ch >= 12593 && ch <= 12643) {
										if (hasError == false) {
											alert('아이디는 한글이 올 수 없습니다.');
										}
										hasError = true;
										$this
												.css('background-color',
														'#FFEDEF');
										break;
									} else if (isNaN(splitStr[i])) {
										cntStr++;
									}

								}
								if (hasError == false) {
									if (cntStr == 0) {
										alert('아이디는 숫자로만 만들 수 없습니다.');
										hasError = true;
										$this
												.css('background-color',
														'#FFEDEF');
									}
								}
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// User Password
						else if (this.id == 'pw') {
							var pwVal = document.getElementById('pw');
							var repw = document.getElementById('repw');
							// 비밀번호 또는 비밀번호 확인 미입력시
							if (pwVal.value.length == '') {
								if (hasError == false) {
									alert('비밀번호를 입력해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 비밀번호는 숫자 영문 혼합
							else if (pwVal.value.length > 7
									&& pwVal.value.length < 13) {
								var strPW = pwVal.value;
								var splitPW = strPW.split('');
								var cntPW = 0;
								for ( var i = 0; i < pwVal.value.length; i++) {
									if (isNaN(splitPW[i])) {
										cntPW++;
									}
								}
								if (hasError == false) {
									if (cntPW == pwVal.value.length
											|| cntPW == 0) {
										alert('비밀번호는 영문, 숫자 혼합으로만 만들 수 있습니다.');
										hasError = true;
										$this
												.css('background-color',
														'#FFEDEF');
									}
								}
							}
							// 비밀번호 길이 불일치
							else if (pwVal.value.length < 8
									|| pwVal.value.length > 12) {
								if (hasError == false) {
									alert('비밀번호는 8~12자 입니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 비밀번호확인불일치
							else if (pwVal.value != repw.value) {
								if (hasError == false) {
									alert('비밀번호가 일치하지 않습니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// Email
						else if (this.id == 'email') {
							// 이메일 형식 오류
							if (this.checkValidity() == false) {
								if (hasError == false) {
									alert('이메일 형식이 아닙니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// Email Check
						else if (this.id == 'confirmCheck') {
							var emailCheckVal = document
									.getElementById('confirmCheck');
							// 이메일 인증번호 오류시
							if (emailValue != emailCheckVal.value) {
								if (hasError == false) {
									alert('이메일 인증번호가 일치하지 않습니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// Cell Phone Check
						else if (this.id == 'mobileco') {
							var companyVal = document
									.getElementById('mobileco');
							var secondnum = document
									.getElementById('secondnum');
							var lastnum = document.getElementById('lastnum');
							// 통신사
							if (companyVal.value == '') {
								if (hasError == false) {
									alert('통신사를 선택해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 두번째 국번
							else if (secondnum.value.length == ''
									|| secondnum.value.length < 3
									|| secondnum.value.length > 4) {
								if (hasError == false) {
									alert('휴대폰 번호의 두번째 자리는 3자 또는 4자 입니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}
							// 세번째 국번
							else if (lastnum.value.length != 4) {
								if (hasError == false) {
									alert('휴대폰 번호의 세번째 자리는 4자 입니다.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// PostCode
						else if (this.id == 'postcode1') {
							if (this.value.length == '') {
								if (hasError == false) {
									alert('우편번호를 입력하세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						} else if (this.id == 'postcode2') {
							if (this.value.length == '') {
								if (hasError == false) {
									alert('우편번호를 입력하세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// Detail Post
						else if (this.id == 'detailaddress') {
							if (this.value.length == '') {
								if (hasError == false) {
									alert('상세주소를 입력하세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// Gender
						else if (this.id == 'gender') {
							var genderCheck = document
									.getElementsByName('gender');
							var cnt = 0;
							for ( var i = 0; i < genderCheck.length; i++) {
								if (genderCheck[i].checked == false) {
									cnt++;
								}
							}
							if (cnt == 2) {
								if (hasError == false) {
									alert('성별을 체크해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						// birth
						else if (this.id == 'datepicker') {
							var birth = document.getElementById('datepicker');
							if (birth.value.length == '') {
								if (hasError == false) {
									alert('생년월일을 선택해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							} else {
								$this.css('background-color', '#FFFFFF');
							}
						}
						else if(this.id == 'idHidden'){
							var idHidden = document.getElementById('idHidden');
							if(idHidden.value == ''){
								if (hasError == false) {
									alert('아이디 중복체크를 해주세요.');
								}
								hasError = true;
								$this.css('background-color', '#FFEDEF');
							}else{
								$this.css('background-color', '#FFFFFF');
							}
						}
						// 예외
						else {
							$this.css('background-color', '#FFFFFF');
						}
					}
				});
		var $link = $('#navigation li:nth-child(' + parseInt(step) + ') a');
		$link.parent().find('.error,.checked').remove();

		var valclass = 'checked';
		if (hasError) {
			error = -1;
			valclass = 'error';
		}
		$('<span class="' + valclass + '"></span>').insertAfter($link);

		return error;
	}

	/*
	 * if there are errors don't allow the user to submit
	 */
	$('#userid').change(function() {
		var idHidden = document.getElementById('idHidden');
		idHidden.value = '';
		return false;
	});
	
	$('#postcode').click(function() {
		window.open('/LIP_Research/jsp/user/join/postSearch.jsp', 'postSearchPage', 'width=420, height=600, location=no');
		return false;
	});

	$('#idcheck').click(function() {
		var id = document.getElementById('userid');
		var idHidden = document.getElementById('idHidden');
		//공백처리
		if (id.value.length == '') {
			alert('아이디를 입력해주세요.');
			return false;
		}
		// 길이 초과일때
		else if (id.value.length < 6
				|| id.value.length > 12) {
			
			alert('아이디는 6~12자 입니다.');
			return false;
		}
		// 숫자로만 이루어졌거나 특수문자인 경우
		else if (id.value.length > 5
				&& id.value.length < 13) {
			var str = id.value;
			var splitStr = str.split('');
			var cntStr = 0;
			for ( var i = 0; i < id.value.length; i++) {
				var ch_char = str.charAt(i);
				var ch = ch_char.charCodeAt();
				if ((ch >= 33 && ch <= 47)
						|| (ch >= 58 && ch <= 64)
						|| (ch >= 91 && ch <= 96)
						|| (ch >= 123 && ch <= 126)) {
					
					alert('아이디는 특수문자가 올 수 없습니다.');
					break;
					return false;
				} else if (ch >= 44031 && ch <= 55203
						|| ch >= 12593 && ch <= 12643) {
					
					alert('아이디는 한글이 올 수 없습니다.');
					break;
					return false;
				} else if (isNaN(splitStr[i])) {
					cntStr++;
				}
			}
			
			if (cntStr == 0) {
				alert('아이디는 숫자로만 만들 수 없습니다.');
				return false;
			}
			
		}
		jQuery.ajax({
			type:"POST",
			url:"CheckId.action",
			data: "userid="+id.value,
			success:function(msg){
				alert(msg);
				if(jQuery.trim(msg) == '사용 가능한 아이디입니다.'){
					idHidden.value = 'true';
				}
			}, error: function(xhr,status,error){
				alert(error);
			}
		}); 
		return false;
	});

	$('#emailConfirm').click(function() {
		var emailCheck = document.getElementById('email');
		var popup;
		var resText;
		var emailtemp = document.getElementById('emailVal');
		if (emailCheck.checkValidity() == false) {
			alert('이메일 형식이 아닙니다.');
		} else {
			emailtemp.value = emailCheck.value;
			jQuery.ajax({
				type:"POST",
				url:"CheckMail.action",
				data: "email="+emailCheck.value,
				success:function(msg){
					resText = msg.split(',');
					popup = resText[0];
					alert(popup);
					emailValue = resText[1];
					alert(emailValue);
				}, error: function(xhr,status,error){
					alert(error);
				}
			});
			emailCheck.disabled = "disabled";
		}
		
		return false;
	});

	$('#registerButton').click(function() {
		if ($('#formElem').data('errors')) {
			alert('모든 사항을 입력해주세요.');
			return false;
		}else{
			alert("회원가입을 환영홥니다!");
			joinMember();
		}
	});
});