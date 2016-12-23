package action.contact.notice;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

import bean.bbs.Notice;
import bean.member.LipMember;

public class WriteNoticeAction implements Action{
	private Notice notice;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		HttpSession	session	=	ServletActionContext.getRequest().getSession();
		LipMember lm	=	(LipMember) session.getAttribute("lipMember");
		
		notice.setMemberNumber(lm.getMemberNumber());
		
		nd.insertNotice(notice);
		
		return SUCCESS;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

}
