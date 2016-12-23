package bean.bbs;

import java.util.Date;

public class NoticeComment {

	private int noticeCommentNumber;
	private Date noticeCommentDate;
	private String noticeCommentContant;
	private int noticeCommentLevel;
	private int memberNumber;
	private int noticeNumber;

	public int getNoticeCommentNumber() {
		return noticeCommentNumber;
	}
	public void setNoticeCommentNumber(int noticeCommentNumber) {
		this.noticeCommentNumber = noticeCommentNumber;
	}
	public Date getNoticeCommentDate() {
		return noticeCommentDate;
	}
	public void setNoticeCommentDate(Date noticeCommentDate) {
		this.noticeCommentDate = noticeCommentDate;
	}
	public String getNoticeCommentContant() {
		return noticeCommentContant;
	}
	public void setNoticeCommentContant(String noticeCommentContant) {
		this.noticeCommentContant = noticeCommentContant;
	}
	public int getNoticeCommentLevel() {
		return noticeCommentLevel;
	}
	public void setNoticeCommentLevel(int noticeCommentLevel) {
		this.noticeCommentLevel = noticeCommentLevel;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getNoticeNumber() {
		return noticeNumber;
	}
	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}
	
}
