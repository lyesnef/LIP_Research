package action.poll.ongoing;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import bean.member.LipMember;
import bean.survey.Example;
import bean.survey.Poll;

import com.opensymphony.xwork2.ActionContext;

import dao.GetPollDao;
import dao.LogDao;
import dao.MailSendListDao;

public class OnGoingPollAction {

	private List<Poll> polls;
	private List<Integer> participatedList;
	private String message;

	public List<Integer> getParticipatedList() {
		return participatedList;
	}

	public void setParticipatedList(List<Integer> participatedList) {
		this.participatedList = participatedList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<Poll> getPolls() {
		return polls;
	}

	public void setPolls(List<Poll> polls) {
		this.polls = polls;
	}

	public String execute() throws SQLException {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		// 회원을 업데이트 한다. (참가가능한 서베이 리스트도 업데이트, )
		int memberNumber = memberUpdate();
		System.out.println(memberNumber);
		
		// 날자가 지난 폴을 상태를 바꿔준다. 
		gpd.updatePollConditionEnd();
		
		//사용자가 참여한 폴을 닫아준다. 
		if (memberNumber != 0) {
			System.out.println("들어옴");
			participatedList = gpd.getparticipatedPollList(memberNumber);
			for (Integer a : participatedList) {
				System.out.println(a);
			}
		}
		polls = gpd.selectAllPoll(0, 7);

		this.message = "happy";
		return "success";
	}

	public void enterList(int memberNmber) {
		// TODO Auto-generated method stub

		Map<String, List<Integer>> session = ActionContext.getContext()
				.getSession();
		MailSendListDao mailSendDoa = new MailSendListDao();
		List<Integer> enterList = mailSendDoa.selectByMemberNum(memberNmber);
		session.put("enterList", enterList);

		// session.put("participatedList", participatedList);
	}

	private int memberUpdate() {
		// TODO Auto-generated method stub
		Map<String, LipMember> session = ActionContext.getContext()
				.getSession();
		LogDao logDao = new LogDao();
		if (session.get("lipMember") != null) {
			session.put("lipMember",
					logDao.selectById(session.get("lipMember").getMemberId()));
			enterList(session.get("lipMember").getMemberNumber());
			return session.get("lipMember").getMemberNumber();
		}
		return 0;
	}
	public String index() throws SQLException {
		// TODO Auto-generated method stub
		GetPollDao gpd = new GetPollDao();
		polls = gpd.selectIndexPolls();
		return "success";
	}

}
