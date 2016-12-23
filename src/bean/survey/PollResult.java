package bean.survey;

import java.util.Date;
import java.util.List;

import bean.member.Age;
import bean.member.Gender;
import bean.member.LipMember;

public class PollResult {
	private List<Example> exampleList; //보기 
	private List<Gender> genderList;
	private List<Age> ageList;
	private int pollNumber;//폴번호
	private String pollQuestion;//질문 내용
	private String pollLink;//폴사진이나 동영상 링크 주소
	private Date pollDate;//폴 생성시간
	private String pollExplain;//폴질문 부가설명
	private Date pollStartDate;//폴 시작일
	private Date pollEndDate;//폴 종료일
	private int pollBalancePoint;//폴 포인트 잔여액
	private int exampleType;//보기 타입(ex)1:텍스트 2:사진
	private int memberNumber;
	//1:기본형, 2:사진형, 3:동영상
	private int pollViewType;
	
	//1:단답형(radio), 2:다답형(checkbox), 3:Y/N형, 4:별점형 => 폴은 1, 3, 4번만 가능
	private int pollQuestionType;
	
	//1:진행전, 2:진행중, 3:진행종료, 4:강제종료
	private int pollCondition;
	private LipMember member;
	private int categoryNumber;//카테고리 번호
	private String categoryName;
	private List<PollComment> pollCommentList;
	
	
	public List<PollComment> getPollCommentList() {
		return pollCommentList;
	}
	public void setPollCommentList(List<PollComment> pollCommentList) {
		this.pollCommentList = pollCommentList;
	}
	public List<Example> getExampleList() {
		return exampleList;
	}
	public void setExampleList(List<Example> exampleList) {
		this.exampleList = exampleList;
	}
	public List<Gender> getGenderList() {
		return genderList;
	}
	public void setGenderList(List<Gender> genderList) {
		this.genderList = genderList;
	}
	public List<Age> getAgeList() {
		return ageList;
	}
	public void setAgeList(List<Age> ageList) {
		this.ageList = ageList;
	}
	public int getPollNumber() {
		return pollNumber;
	}
	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}
	public String getPollQuestion() {
		return pollQuestion;
	}
	public void setPollQuestion(String pollQuestion) {
		this.pollQuestion = pollQuestion;
	}
	public String getPollLink() {
		return pollLink;
	}
	public void setPollLink(String pollLink) {
		this.pollLink = pollLink;
	}
	public Date getPollDate() {
		return pollDate;
	}
	public void setPollDate(Date pollDate) {
		this.pollDate = pollDate;
	}
	public String getPollExplain() {
		return pollExplain;
	}
	public void setPollExplain(String pollExplain) {
		this.pollExplain = pollExplain;
	}
	public Date getPollStartDate() {
		return pollStartDate;
	}
	public void setPollStartDate(Date pollStartDate) {
		this.pollStartDate = pollStartDate;
	}
	public Date getPollEndDate() {
		return pollEndDate;
	}
	public void setPollEndDate(Date pollEndDate) {
		this.pollEndDate = pollEndDate;
	}
	public int getPollBalancePoint() {
		return pollBalancePoint;
	}
	public void setPollBalancePoint(int pollBalancePoint) {
		this.pollBalancePoint = pollBalancePoint;
	}
	public int getExampleType() {
		return exampleType;
	}
	public void setExampleType(int exampleType) {
		this.exampleType = exampleType;
	}
	public int getPollViewType() {
		return pollViewType;
	}
	public void setPollViewType(int pollViewType) {
		this.pollViewType = pollViewType;
	}
	public int getPollQuestionType() {
		return pollQuestionType;
	}
	public void setPollQuestionType(int pollQuestionType) {
		this.pollQuestionType = pollQuestionType;
	}
	public int getPollCondition() {
		return pollCondition;
	}
	public void setPollCondition(int pollCondition) {
		this.pollCondition = pollCondition;
	}
	
	public LipMember getMember() {
		return member;
	}
	public void setMember(LipMember member) {
		this.member = member;
	}
	public int getCategoryNumber() {
		return categoryNumber;
	}
	public void setCategoryNumber(int categoryNumber) {
		this.categoryNumber = categoryNumber;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	
	
	
}
