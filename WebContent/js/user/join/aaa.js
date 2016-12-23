function insertAnswer(){
	if(poll.getAnswerNum()>4){
		return;	
	}
	poll.plusAnswerNum();
	$('#answer_list').append(
			$('<tr></tr>')
			.attr('id', 'answer'+(poll.getAnswerNum())
			.append(
				$('<td></td>')
				.attr('id', poll.getAnswerValue())
				.html(poll.getAnswerValue())
			)
			.append(
				$('<td></td>')
				.attr('id', poll.getAnswerValue())
				.append(
					$('<input />').attr('type', 'text')
					.attr('name', poll.getAnswerValue())
				)
		)	)
		);
}