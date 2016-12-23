package bean.point;

import java.util.Date;

public class PointIncome {

	private int pointIncomeNumber;
	private Date pointIncomeDate;
	private int pointIncomePoint;
	
	private int pointOutcomePoint;				// resultMap 사용
	
	private String pointIncomeDetail;
	private String pointIncomeList;
	private int memberNumber;

	public int getPointIncomeNumber() {
		return pointIncomeNumber;
	}
	public void setPointIncomeNumber(int pointIncomeNumber) {
		this.pointIncomeNumber = pointIncomeNumber;
	}
	public Date getPointIncomeDate() {
		return pointIncomeDate;
	}
	public void setPointIncomeDate(Date pointIncomeDate) {
		this.pointIncomeDate = pointIncomeDate;
	}
	public int getPointIncomePoint() {
		return pointIncomePoint;
	}
	public void setPointIncomePoint(int pointIncomePoint) {
		this.pointIncomePoint = pointIncomePoint;
	}
	public String getPointIncomeDetail() {
		return pointIncomeDetail;
	}
	public void setPointIncomeDetail(String pointIncomeDetail) {
		this.pointIncomeDetail = pointIncomeDetail;
	}
	public String getPointIncomeList() {
		return pointIncomeList;
	}
	public void setPointIncomeList(String pointIncomeList) {
		this.pointIncomeList = pointIncomeList;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getPointOutcomePoint() {
		return pointOutcomePoint;
	}
	public void setPointOutcomePoint(int pointOutcomePoint) {
		this.pointOutcomePoint = pointOutcomePoint;
	}
	
	
}
