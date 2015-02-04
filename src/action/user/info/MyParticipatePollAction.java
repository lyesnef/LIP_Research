package action.user.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.PollParticipate;

import com.opensymphony.xwork2.Action;

import dao.PollParticipateDao;

public class MyParticipatePollAction implements Action{
	
	List<PollParticipate> pollParticipateList = new ArrayList<PollParticipate>();
	LipMember lipMember;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		
		
		PollParticipateDao pollParticipateDao = new PollParticipateDao();
		System.out.println(lipMember.getMemberNumber());
		//폴참여정보
		pollParticipateList = pollParticipateDao.selectAllByNumber(lipMember.getMemberNumber());
		return SUCCESS;
	}



	public List<PollParticipate> getPollParticipateList() {
		return pollParticipateList;
	}

	public void setPollParticipateList(List<PollParticipate> pollParticipateList) {
		this.pollParticipateList = pollParticipateList;
	}

	public LipMember getLipMember() {
		return lipMember;
	}



	public void setLipMember(LipMember lipMember) {
		this.lipMember = lipMember;
	}
	
	
	
}
