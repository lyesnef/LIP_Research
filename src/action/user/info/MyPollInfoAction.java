package action.user.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.Poll;

import com.opensymphony.xwork2.Action;

import dao.GetPollDao;

public class MyPollInfoAction implements Action{

	private List<Poll> pollList = new ArrayList<Poll>();
	private LipMember lipMember;

	public List<Poll> getPollList() {
		return pollList;
	}
	public void setPollList(List<Poll> pollList) {
		this.pollList = pollList;
	}

	public LipMember getLipMember() {
		return lipMember;
	}
	public void setLipMember(LipMember lipMember) {
		this.lipMember = lipMember;
	}

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		GetPollDao getPollDao = new GetPollDao();
		pollList=getPollDao.selectPollbyMemberNum(lipMember.getMemberNumber());
		return SUCCESS;
	}

}
