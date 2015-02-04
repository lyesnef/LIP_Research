package bean.survey;

import java.util.Date;
import java.util.List;

public class Survey {

	private int surveyNumber;
	private int surveyPoint;
	private Date surveyDate;
	private String surveyTitle;
	private Date surveyStartDate;
	private Date surveyEndDate;
	private int surveyCondition;
	private int memberNumber;
	private int categoryNumber;
	private String categoryName;
	private String memberId;
	private List<String> constraintName;
	private int participable;
	private List<Question> questionList;
	

	// result 클래스 사용

	

	public int getParticipable() {
		return participable;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public void setParticipable(int participable) {
		this.participable = participable;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getSurveyNumber() {
		return surveyNumber;
	}
	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}
	public int getSurveyPoint() {
		return surveyPoint;
	}
	public void setSurveyPoint(int surveyPoint) {
		this.surveyPoint = surveyPoint;
	}
	public Date getSurveyDate() {
		return surveyDate;
	}
	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}
	public String getSurveyTitle() {
		return surveyTitle;
	}
	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}
	public Date getSurveyStartDate() {
		return surveyStartDate;
	}
	public void setSurveyStartDate(Date surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}
	public Date getSurveyEndDate() {
		return surveyEndDate;
	}
	public void setSurveyEndDate(Date surveyEndDate) {
		this.surveyEndDate = surveyEndDate;
	}
	public int getSurveyCondition() {
		return surveyCondition;
	}
	public void setSurveyCondition(int surveyCondition) {
		this.surveyCondition = surveyCondition;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getCategoryNumber() {
		return categoryNumber;
	}
	public void setCategoryNumber(int categoryNumber) {
		this.categoryNumber = categoryNumber;
	}
	public List<String> getConstraintName() {
		return constraintName;
	}
	public void setConstraintName(List<String> constraintName) {
		this.constraintName = constraintName;
	}
	
}
