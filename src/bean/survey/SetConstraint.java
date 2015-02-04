package bean.survey;

import java.util.List;

public class SetConstraint {

	private int setConstraintNumber;
	private String setConstraintName;
	private String constraintName;
	private int constraintNumber;
	private List<List<AddConstraint>> addConstraintList;
	
	//result map
	private int limitParticipateNumber;
	private int limitParticipateLimit;
	private int limitParticipateCount;
	
	
	public List<List<AddConstraint>> getAddConstraintList() {
		return addConstraintList;
	}
	public void setAddConstraintList(List<List<AddConstraint>> addConstraintList) {
		this.addConstraintList = addConstraintList;
	}
	public String getConstraintName() {
		return constraintName;
	}
	public void setConstraintName(String constraintName) {
		this.constraintName = constraintName;
	}
	public int getSetConstraintNumber() {
		return setConstraintNumber;
	}
	public void setSetConstraintNumber(int setConstraintNumber) {
		this.setConstraintNumber = setConstraintNumber;
	}
	public String getSetConstraintName() {
		return setConstraintName;
	}
	public void setSetConstraintName(String setConstraintName) {
		this.setConstraintName = setConstraintName;
	}
	public int getConstraintNumber() {
		return constraintNumber;
	}
	public void setConstraintNumber(int constraintNumber) {
		this.constraintNumber = constraintNumber;
	}
	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}
	public void setLimitParticipateNumber(int limitParticipateNumber) {
		this.limitParticipateNumber = limitParticipateNumber;
	}
	public int getLimitParticipateLimit() {
		return limitParticipateLimit;
	}
	public void setLimitParticipateLimit(int limitParticipateLimit) {
		this.limitParticipateLimit = limitParticipateLimit;
	}
	public int getLimitParticipateCount() {
		return limitParticipateCount;
	}
	public void setLimitParticipateCount(int limitParticipateCount) {
		this.limitParticipateCount = limitParticipateCount;
	}
	
}
