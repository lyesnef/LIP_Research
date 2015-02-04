package action.poll.create;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;

import com.opensymphony.xwork2.Action;
import com.sun.net.httpserver.HttpContext;

import dao.PollDao;

public class MakePollAction implements Action{
	private List category;
	private int point_left;
	private String message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		PollDao	pd	=	new PollDao();
		HttpSession session	=	ServletActionContext.getRequest().getSession();
		LipMember lm	=	(LipMember) session.getAttribute("lipMember");
		if(lm==null){
			return LOGIN;
		}
		category	=	pd.getCategories();
		point_left	=	pd.getLeftPoint(lm.getMemberNumber());
		
		return SUCCESS;
	}
	public List getCategory() {
		return category;
	}
	public void setCategory(List category) {
		this.category = category;
	}
	public int getPoint_left() {
		return point_left;
	}
	public void setPoint_left(int point_left) {
		this.point_left = point_left;
	}

}
