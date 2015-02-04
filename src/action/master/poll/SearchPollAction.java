package action.master.poll;

import java.sql.SQLException;
import java.util.List;

import bean.survey.Poll;
import dao.GetPollDao;

public class SearchPollAction {
	private int pollNumber;
	private List<Poll> poll; 

	public List<Poll> getPoll() {
		return poll;
	}

	public void setPoll(List<Poll> poll) {
		this.poll = poll;
	}

	public int getPollNumber() {
		return pollNumber;
	}

	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}

	public String execute() throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(pollNumber);
		GetPollDao gpd = new GetPollDao();
		poll = gpd.selectPoll(pollNumber);
		
		return "success";
	}
}
