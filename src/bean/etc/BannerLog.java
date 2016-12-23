package bean.etc;

import java.util.Date;

public class BannerLog {

	private int bannerLogNumber;
	private Date bannerLogDate;
	private String bannerLogIp;
	private int memberNumber;
	private int bannerNumber;
	public int getBannerLogNumber() {
		return bannerLogNumber;
	}
	public void setBannerLogNumber(int bannerLogNumber) {
		this.bannerLogNumber = bannerLogNumber;
	}
	public Date getBannerLogDate() {
		return bannerLogDate;
	}
	public void setBannerLogDate(Date bannerLogDate) {
		this.bannerLogDate = bannerLogDate;
	}
	public String getBannerLogIp() {
		return bannerLogIp;
	}
	public void setBannerLogIp(String bannerLogIp) {
		this.bannerLogIp = bannerLogIp;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getBannerNumber() {
		return bannerNumber;
	}
	public void setBannerNumber(int bannerNumber) {
		this.bannerNumber = bannerNumber;
	}
	
}
