package bean.survey;

import java.util.List;

public class SurveyConstraint {

	private int constraintNumber;
	private String constraintName;
	private List<SetConstraint> setConstraintList;
	private List<LimitParticipate> limitParticipateList;

	public int getConstraintNumber() {
		return constraintNumber;
	}
	public void setConstraintNumber(int constraintNumber) {
		this.constraintNumber = constraintNumber;
	}
	public String getConstraintName() {
		return constraintName;
	}
	public void setConstraintName(String constraintName) {
		this.constraintName = constraintName;
	}
	public List<SetConstraint> getSetConstraintList() {
		return setConstraintList;
	}
	public void setSetConstraintList(List<SetConstraint> setConstraintList) {
		this.setConstraintList = setConstraintList;
	}
	public List<LimitParticipate> getLimitParticipateList() {
		return limitParticipateList;
	}
	public void setLimitParticipateList(List<LimitParticipate> limitParticipateList) {
		this.limitParticipateList = limitParticipateList;
	}
	
}
