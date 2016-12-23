package action.poll.finished;

import java.sql.SQLException;
import java.util.List;

import dao.GetPollDao;

import bean.survey.Poll;

public class FinishedPollAction {
	
	private List<Poll> polls;
	
	public List<Poll> getPolls() {
		return polls;
	}

	public void setPolls(List<Poll> polls) {
		this.polls = polls;
	}

	public String execute() throws SQLException {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		
		polls = gpd.selectFinishedPoll();
		
		return "success";
	}
	public static void main(String[] args) {
		GetPollDao gpd = new GetPollDao();
		FinishedPollAction fa = new FinishedPollAction();
		try {
			fa.polls = gpd.selectFinishedPoll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Poll poll : fa.polls) {
			System.out.println(poll.getPollNumber());
		}
	}
}
