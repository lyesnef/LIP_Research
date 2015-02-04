package action.poll.ongoing;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.PollComment;

import com.opensymphony.xwork2.Action;
import com.sun.net.httpserver.HttpContext;

import dao.PollDao;

public class RegMessageAction implements Action{
	private PollComment pc;
	private int pollNumber;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PollDao pd	=	new PollDao();
		HttpSession session	=	ServletActionContext.getRequest().getSession();
		LipMember lm	=	(LipMember) session.getAttribute("lipMember");
		System.out.println("member number " +lm.getMemberNumber());
		pc.setMemberNumber(lm.getMemberNumber());
		pollNumber	=	pc.getPollNumber();
	
		pd.insertPollComment(pc);
		
		return SUCCESS;
	}
	public PollComment getPc() {
		return pc;
	}
	public void setPc(PollComment pc) {
		this.pc = pc;
	}
	public int getPollNumber() {
		return pollNumber;
	}
	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}
	
	
}
