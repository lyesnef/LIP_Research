package bean.point;

import java.util.Date;

public class SurveyPoint {

	private int surveyPointNumber;
	private Date surveyPointDate;
	private int surveyPointPoint;
	private int surveyNumber;
	private int memberNumber;

	public int getSurveyPointNumber() {
		return surveyPointNumber;
	}
	public void setSurveyPointNumber(int surveyPointNumber) {
		this.surveyPointNumber = surveyPointNumber;
	}
	public Date getSurveyPointDate() {
		return surveyPointDate;
	}
	public void setSurveyPointDate(Date surveyPointDate) {
		this.surveyPointDate = surveyPointDate;
	}
	public int getSurveyPointPoint() {
		return surveyPointPoint;
	}
	public void setSurveyPointPoint(int surveyPointPoint) {
		this.surveyPointPoint = surveyPointPoint;
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
	
}
