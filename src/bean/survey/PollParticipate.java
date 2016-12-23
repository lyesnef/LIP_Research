package bean.survey;

import java.util.Date;
import java.util.List;

public class PollParticipate {

	private int pollParticipateNumber;
	private int memberNumber;
	private int pollNumber;
	private int pollExampleNumber;
	private Date  pollParticipateDate;
	private List<Integer> result;
	private int pollBalancePoint;
	
	public PollParticipate(){}
	
	
	public PollParticipate(int memberNumber, int pollNumber,
			int pollExampleNumber) {
		super();
		this.memberNumber = memberNumber;
		this.pollNumber = pollNumber;
		this.pollExampleNumber = pollExampleNumber;
	}


	public int getPollBalancePoint() {
		return pollBalancePoint;
	}
	public void setPollBalancePoint(int pollBalancePoint) {
		this.pollBalancePoint = pollBalancePoint;
	}
	public List<Integer> getResult() {
		return result;
	}
	public void setResult(List<Integer> result) {
		this.result = result;
	}
	// resultClass로 사용
	private String categoryName;
	private String pollQuestion;
	
	public int getPollParticipateNumber() {
		return pollParticipateNumber;
	}
	public void setPollParticipateNumber(int pollParticipateNumber) {
		this.pollParticipateNumber = pollParticipateNumber;
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
	public int getPollExampleNumber() {
		return pollExampleNumber;
	}
	public void setPollExampleNumber(int pollExampleNumber) {
		this.pollExampleNumber = pollExampleNumber;
	}
	public Date getPollParticipateDate() {
		return pollParticipateDate;
	}
	public void setPollParticipateDate(Date pollParticipateDate) {
		this.pollParticipateDate = pollParticipateDate;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getPollQuestion() {
		return pollQuestion;
	}
	public void setPollQuestion(String pollQuestion) {
		this.pollQuestion = pollQuestion;
	}
	
}
