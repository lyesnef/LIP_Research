package bean.member;

import java.util.Date;

public class LipMember {
	
	private int memberNumber;
	private String memberDetailAddress;
	private int memberPoint;
	private String memberCellphoneCo;
	private String memberCellphoneNumber;
	private String memberImage;
	private String memberEmail;
	private String memberEmailRecieve;
	private Date memberBirth;
	private String memberPw;
	private String memberId;
	
	//1:남자 2:여자
	private int genderNumber;	
	
	private int postcodeNumber;
	private int regionNumber;
	private int ageNumber;
	private String memberAgree;
	
	public int getGenderNumber() {
		return genderNumber;
	}
	public void setGenderNumber(int genderNumber) {
		this.genderNumber = genderNumber;
	}
	
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public String getMemberDetailAddress() {
		return memberDetailAddress;
	}
	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberCellphoneCo() {
		return memberCellphoneCo;
	}
	public void setMemberCellphoneCo(String memberCellphoneCo) {
		this.memberCellphoneCo = memberCellphoneCo;
	}
	public String getMemberCellphoneNumber() {
		return memberCellphoneNumber;
	}
	public void setMemberCellphoneNumber(String memberCellphoneNumber) {
		this.memberCellphoneNumber = memberCellphoneNumber;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberEmailRecieve() {
		return memberEmailRecieve;
	}
	public void setMemberEmailRecieve(String memberEmailRecieve) {
		this.memberEmailRecieve = memberEmailRecieve;
	}
	public Date getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPostcodeNumber() {
		return postcodeNumber;
	}
	public void setPostcodeNumber(int postcodeNumber) {
		this.postcodeNumber = postcodeNumber;
	}
	public int getRegionNumber() {
		return regionNumber;
	}
	public void setRegionNumber(int regionNumber) {
		this.regionNumber = regionNumber;
	}
	public int getAgeNumber() {
		return ageNumber;
	}
	public void setAgeNumber(int ageNumber) {
		this.ageNumber = ageNumber;
	}
	public String getMemberAgree() {
		return memberAgree;
	}
	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}
}
