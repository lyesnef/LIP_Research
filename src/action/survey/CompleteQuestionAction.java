package action.survey;

import com.opensymphony.xwork2.Action;

public class CompleteQuestionAction implements Action {

	private int limitParticipateNumber;	//초기 설정
	private int setLimitNumber;			//셋팅 설정
	private int questionCount;			//문제수설정
	private int totalPayment;				//결제금액
	
	@Override
	public String execute() throws Exception {
		if(setLimitNumber != 0){
			if(questionCount != 0){
				totalPayment = setLimitNumber * questionCount * 200;
			}
		}else if(limitParticipateNumber != 0){
			if(questionCount != 0){
				totalPayment = limitParticipateNumber * questionCount * 200;
			}
		}else{
			System.out.println("에러");
		}
		return SUCCESS;
	}

	public int getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}

	public void setLimitParticipateNumber(int limitParticipateNumber) {
		this.limitParticipateNumber = limitParticipateNumber;
	}

	public int getSetLimitNumber() {
		return setLimitNumber;
	}

	public void setSetLimitNumber(int setLimitNumber) {
		this.setLimitNumber = setLimitNumber;
	}

	public int getQuestionCount() {
		return questionCount;
	}

	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	
}
