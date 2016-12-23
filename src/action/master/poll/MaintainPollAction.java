package action.master.poll;

import java.util.List;

import bean.survey.Poll;

import com.opensymphony.xwork2.Action;

import dao.GetPollDao;

public class MaintainPollAction implements Action{
	
	private String message;
	private List<Poll> polls;
	private int pollNumber;
	private int result;
	private int search;
	

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPollNumber() {
		return pollNumber;
	}

	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
	public List<Poll> getPolls() {
		return polls;
	}

	public void setPolls(List<Poll> polls) {
		this.polls = polls;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		
		if(result != 0 && pollNumber != 0) {
			//폴의 상태를 변경시킨다.
			gpd.updatePollCondition(pollNumber, result);
		}
		polls = gpd.selectPollConditionOne(1);
		System.out.println(pollNumber);
		System.out.println(result);
		return SUCCESS;
	}
	
	public String changePollCondition() throws Exception {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		polls = gpd.selectPollConditionOne(search);
		return "success";
	}

}
