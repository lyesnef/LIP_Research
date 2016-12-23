package bean.survey;

import java.util.List;

public class AddConstraint {

	private int addConstraintNumber;
	private List setConstraintNumber;
	private int surveyNumber;
	private int limitParticipateNumber;
	private List<SetConstraint> setConsList;
	private List<LimitParticipate> limitParticipateList;
	private int setConstraintNum;
	private List<SurveyConstraint> surveyConstraintList;
	private LimitParticipate limitPart;
	
	public LimitParticipate getLimitPart() {
		return limitPart;
	}
	public void setLimitPart(LimitParticipate limitPart) {
		this.limitPart = limitPart;
	}
	public List<SurveyConstraint> getSurveyConstraintList() {
		return surveyConstraintList;
	}
	public void setSurveyConstraintList(List<SurveyConstraint> surveyConstraintList) {
		this.surveyConstraintList = surveyConstraintList;
	}
	public int getSetConstraintNum() {
		return setConstraintNum;
	}
	public void setSetConstraintNum(int setConstraintNum) {
		this.setConstraintNum = setConstraintNum;
	}
	public List<SetConstraint> getSetConsList() {
		return setConsList;
	}
	public void setSetConsList(List<SetConstraint> setConsList) {
		this.setConsList = setConsList;
	}
	public List<LimitParticipate> getLimitParticipateList() {
		return limitParticipateList;
	}
	public void setLimitParticipateList(List<LimitParticipate> limitParticipateList) {
		this.limitParticipateList = limitParticipateList;
	}
	public int getAddConstraintNumber() {
		return addConstraintNumber;
	}
	public void setAddConstraintNumber(int addConstraintNumber) {
		this.addConstraintNumber = addConstraintNumber;
	}
	public List getSetConstraintNumber() {
		return setConstraintNumber;
	}
	public void setSetConstraintNumber(List setConstraintNumber) {
		this.setConstraintNumber = setConstraintNumber;
	}
	public int getSurveyNumber() {
		return surveyNumber;
	}
	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}
	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}
	public void setLimitParticipateNumber(int limitParticipateNumber) {
		this.limitParticipateNumber = limitParticipateNumber;
	}
	
}
