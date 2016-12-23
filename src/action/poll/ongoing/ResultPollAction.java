package action.poll.ongoing;

import java.io.File;

import bean.survey.PollResult;

import com.opensymphony.xwork2.Action;

import dao.PollDao;

public class ResultPollAction implements Action {
	private PollResult pr;
	private int pollNumber;
	private int totalParticipateNumber;
	private String[] answerList;
	private String[] answerListCount;
	private String[] genderList;
	private String[] genderListCount;
	private String[] ageList;
	private String[]	ageListCount;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PollDao pd	=	new PollDao();
		System.out.println("pollNumber = " +pollNumber);
		pr	=	pd.getPollResult(pollNumber);
		System.out.println(pr.getMember().getMemberId());
		answerList	=	new String[pr.getExampleList().size()];
		answerListCount	=	new String[pr.getExampleList().size()];
		totalParticipateNumber = 0;
		for(int i=0; i<pr.getExampleList().size(); i++){
			answerList[i]	=	pr.getExampleList().get(i).getExampleContant();
			totalParticipateNumber+=pr.getExampleList().get(i).getExampleCounter();
			answerListCount[i]	=	Integer.toString(pr.getExampleList().get(i).getExampleCounter());
		}
		
		
		genderList	=	new String[pr.getGenderList().size()];
		genderListCount	=	new String[pr.getGenderList().size()];
		
		for(int i=0; i<pr.getGenderList().size(); i++){
			genderList[i]	=	pr.getGenderList().get(i).getGenderName();
			genderListCount[i]	=	Integer.toString(pr.getGenderList().get(i).getGenderCounter());
		}
		
		int ageCount	=	pr.getAgeList().size();
		ageList	=	new String[ageCount];
		ageListCount	=	new String[ageCount];
		for(int i=0; i<ageCount; i++){
			ageList[i]	=	pr.getAgeList().get(i).getAgeName();
			ageListCount[i]=	Integer.toString(pr.getAgeList().get(i).getAgeCounter());
		}
		
		
	
		return SUCCESS;
	}

	public PollResult getPr() {
		return pr;
	}

	public void setPr(PollResult pr) {
		this.pr = pr;
	}

	public int getPollNumber() {
		return pollNumber;
	}

	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}

	public String[] getAnswerList() {
		return answerList;
	}

	public void setAnswerList(String[] answerList) {
		this.answerList = answerList;
	}

	public String[] getAnswerListCount() {
		return answerListCount;
	}

	public void setAnswerListCount(String[] answerListCount) {
		this.answerListCount = answerListCount;
	}

	public String[] getGenderList() {
		return genderList;
	}

	public void setGenderList(String[] genderList) {
		this.genderList = genderList;
	}

	public String[] getGenderListCount() {
		return genderListCount;
	}

	public void setGenderListCount(String[] genderListCount) {
		this.genderListCount = genderListCount;
	}

	public String[] getAgeList() {
		return ageList;
	}

	public void setAgeList(String[] ageList) {
		this.ageList = ageList;
	}

	public String[] getAgeListCount() {
		return ageListCount;
	}

	public void setAgeListCount(String[] ageListCount) {
		this.ageListCount = ageListCount;
	}

	public int getTotalParticipateNumber() {
		return totalParticipateNumber;
	}

	public void setTotalParticipateNumber(int totalParticipateNumber) {
		this.totalParticipateNumber = totalParticipateNumber;
	}
	
	
}
