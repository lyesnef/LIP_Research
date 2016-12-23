package bean.survey;

import java.util.List;

public class ResultSurvey {
	
	private int questionOrder;
	private String questionContant; 
	private int exampleOrder;
	private String exampleContant;
	private String memberEmail;
	private String ageName;
	private String genderName;
	private String postcodeAddress;
	private int LimtParticipateNumber;
	List<SetConstraint> setConstraintList;
	public int getQuestionOrder() {
		return questionOrder;
	}
	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}
	public String getQuestionContant() {
		return questionContant;
	}
	public void setQuestionContant(String questionContant) {
		this.questionContant = questionContant;
	}
	public int getExampleOrder() {
		return exampleOrder;
	}
	public void setExampleOrder(int exampleOrder) {
		this.exampleOrder = exampleOrder;
	}
	public String getExampleContant() {
		return exampleContant;
	}
	public void setExampleContant(String exampleContant) {
		this.exampleContant = exampleContant;
	}
	public String getAgeName() {
		return ageName;
	}
	public void setAgeName(String ageName) {
		this.ageName = ageName;
	}
	public String getGenderName() {
		return genderName;
	}
	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}
	public String getPostcodeAddress() {
		return postcodeAddress;
	}
	public void setPostcodeAddress(String postcodeAddress) {
		this.postcodeAddress = postcodeAddress;
	}
	public int getLimtParticipateNumber() {
		return LimtParticipateNumber;
	}
	public void setLimtParticipateNumber(int limtParticipateNumber) {
		LimtParticipateNumber = limtParticipateNumber;
	}
	public List<SetConstraint> getSetConstraintList() {
		return setConstraintList;
	}
	public void setSetConstraintList(List<SetConstraint> setConstraintList) {
		this.setConstraintList = setConstraintList;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
}
