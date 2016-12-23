package bean.survey;

import java.util.Date;

public class SurveyParticipate {

	private int surveyParticipateNumber;
	private String surveyParticipateName;
	private Date surveyParticipateDate;
	private String surveyParticipateQuestion;
	private int surveyNumber;
	private int memberNumber;
	private int questionNumber;
	private int exampleNumber;
	private int limitParticipateNumber;

	// result맵 사용변수
	private String surveyTitle;
	private String categoryName;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSurveyTitle() {
		return surveyTitle;
	}
	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}
	public int getSurveyParticipateNumber() {
		return surveyParticipateNumber;
	}
	public void setSurveyParticipateNumber(int surveyParticipateNumber) {
		this.surveyParticipateNumber = surveyParticipateNumber;
	}
	public String getSurveyParticipateName() {
		return surveyParticipateName;
	}
	public void setSurveyParticipateName(String surveyParticipateName) {
		this.surveyParticipateName = surveyParticipateName;
	}
	public Date getSurveyParticipateDate() {
		return surveyParticipateDate;
	}
	public void setSurveyParticipateDate(Date surveyParticipateDate) {
		this.surveyParticipateDate = surveyParticipateDate;
	}
	public String getSurveyParticipateQuestion() {
		return surveyParticipateQuestion;
	}
	public void setSurveyParticipateQuestion(String surveyParticipateQuestion) {
		this.surveyParticipateQuestion = surveyParticipateQuestion;
	}
	public int getSurveyNumber() {
		return surveyNumber;
	}
	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	public int getExampleNumber() {
		return exampleNumber;
	}
	public void setExampleNumber(int exampleNumber) {
		this.exampleNumber = exampleNumber;
	}
	
	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}
	public void setLimitParticipateNumber(int limitParticipateNumber) {
		this.limitParticipateNumber = limitParticipateNumber;
	}
	
}
