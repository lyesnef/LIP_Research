package action.contact.qna;

import org.apache.struts2.ServletActionContext;

import bean.bbs.QnA;
import bean.member.LipMember;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class WriteQnaAction implements Action{
	private QnA qna;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		LipMember lm	=	(LipMember)ServletActionContext.getRequest().getSession().getAttribute("lipMember");
		qna.setMemberNumber(lm.getMemberNumber());
		
		nd.insertQna(qna);
		
		return SUCCESS;
	}

	public QnA getQna() {
		return qna;
	}

	public void setQna(QnA qna) {
		this.qna = qna;
	}
	
}
