package bean.survey;

import java.util.Date;

import bean.member.LipMember;

public class PollComment {

	private int pollCommentNumber;
	private Date pollCommentDate;
	private String pollCommentContant;
	private int pollCommentLevel;
	private int memberNumber;
	private LipMember member;
	private int pollNumber;
	
	public int getPollCommentNumber() {
		return pollCommentNumber;
	}
	public void setPollCommentNumber(int pollCommentNumber) {
		this.pollCommentNumber = pollCommentNumber;
	}
	public Date getPollCommentDate() {
		return pollCommentDate;
	}
	public void setPollCommentDate(Date pollCommentDate) {
		this.pollCommentDate = pollCommentDate;
	}
	public String getPollCommentContant() {
		return pollCommentContant;
	}
	public void setPollCommentContant(String pollCommentContant) {
		this.pollCommentContant = pollCommentContant;
	}
	public int getPollCommentLevel() {
		return pollCommentLevel;
	}
	public void setPollCommentLevel(int pollCommentLevel) {
		this.pollCommentLevel = pollCommentLevel;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getPollNumber() {
		return pollNumber;
	}
	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}
	public LipMember getMember() {
		return member;
	}
	public void setMember(LipMember member) {
		this.member = member;
	}
	
	
}
