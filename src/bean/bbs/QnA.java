package bean.bbs;

import java.util.Date;

import bean.member.LipMember;

public class QnA {

	private int qnaNumber;
	private String qnaTitle;
	private String qnaCategory;
	private String qnaContant;
	private Date qnaDate;
	private String qnaAnswer;
	private int memberNumber;
	private LipMember member;
	
	public int getQnaNumber() {
		return qnaNumber;
	}
	public void setQnaNumber(int qnaNumber) {
		this.qnaNumber = qnaNumber;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaContant() {
		return qnaContant;
	}
	public void setQnaContant(String qnaContant) {
		this.qnaContant = qnaContant;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public LipMember getMember() {
		return member;
	}
	public void setMember(LipMember member) {
		this.member = member;
	}
	
}
