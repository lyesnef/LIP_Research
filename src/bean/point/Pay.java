package bean.point;

import java.util.Date;

public class Pay {

	private int payNumber;
	private String payList;
	private Date payDate;
	private int payMoney;
	private int memberNumber;
	
	public int getPayNumber() {
		return payNumber;
	}
	public void setPayNumber(int payNumber) {
		this.payNumber = payNumber;
	}
	public String getPayList() {
		return payList;
	}
	public void setPayList(String payList) {
		this.payList = payList;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	
}
