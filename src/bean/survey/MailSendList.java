package bean.survey;

public class MailSendList {

	private int mailSendListNumber;
	private int memberNumber;
	private int surveyNumber;
	
	public MailSendList(){}
	
	
	public MailSendList(int memberNumber, int surveyNumber) {
		super();
		this.memberNumber = memberNumber;
		this.surveyNumber = surveyNumber;
	}


	public int getMailSendListNumber() {
		return mailSendListNumber;
	}
	public void setMailSendListNumber(int mailSendListNumber) {
		this.mailSendListNumber = mailSendListNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getSurveyNumber() {
		return surveyNumber;
	}
	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}
}
