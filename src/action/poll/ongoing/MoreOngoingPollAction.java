package action.poll.ongoing;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.survey.Poll;

import dao.GetPollDao;

public class MoreOngoingPollAction {
	private List<Poll> polls = new ArrayList<Poll>();
	private int start;
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public List<Poll> getPolls() {
		return polls;
	}

	public void setPolls(List<Poll> polls) {
		this.polls = polls;
	}

	public String execute() {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		System.out.println(start);
		try {
			polls = gpd.selectAllPoll(start ,start+5);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
}
