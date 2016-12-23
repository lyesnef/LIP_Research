package bean.point;

import java.util.Date;

public class PollPoint {

	private int pollPointNumber;
	private Date pollPointDate;
	private int pollPointPoint;
	private int memberBumber;
	private int pollNumber;
	
	public int getPollPointNumber() {
		return pollPointNumber;
	}
	public void setPollPointNumber(int pollPointNumber) {
		this.pollPointNumber = pollPointNumber;
	}
	public Date getPollPointDate() {
		return pollPointDate;
	}
	public void setPollPointDate(Date pollPointDate) {
		this.pollPointDate = pollPointDate;
	}
	public int getPollPointPoint() {
		return pollPointPoint;
	}
	public void setPollPointPoint(int pollPointPoint) {
		this.pollPointPoint = pollPointPoint;
	}
	public int getMemberBumber() {
		return memberBumber;
	}
	public void setMemberBumber(int memberBumber) {
		this.memberBumber = memberBumber;
	}
	public int getPollNumber() {
		return pollNumber;
	}
	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}
	
}
