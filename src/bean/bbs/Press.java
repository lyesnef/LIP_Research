package bean.bbs;

import java.util.Date;

public class Press {

	private int pressNumber;
	private String pressTitle;
	private String pressContant;
	private Date pressDate;
	private String pressImage;
	private int memberNumber;
	
	public int getPressNumber() {
		return pressNumber;
	}
	public void setPressNumber(int pressNumber) {
		this.pressNumber = pressNumber;
	}
	public String getPressTitle() {
		return pressTitle;
	}
	public void setPressTitle(String pressTitle) {
		this.pressTitle = pressTitle;
	}
	public String getPressContant() {
		return pressContant;
	}
	public void setPressContant(String pressContant) {
		this.pressContant = pressContant;
	}
	public Date getPressDate() {
		return pressDate;
	}
	public void setPressDate(Date pressDate) {
		this.pressDate = pressDate;
	}
	public String getPressImage() {
		return pressImage;
	}
	public void setPressImage(String pressImage) {
		this.pressImage = pressImage;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	
}
