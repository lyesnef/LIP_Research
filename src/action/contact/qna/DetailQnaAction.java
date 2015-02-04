package action.contact.qna;

import bean.bbs.QnA;

import com.opensymphony.xwork2.Action;

import dao.LogDao;
import dao.NoticeDao;

public class DetailQnaAction implements Action{
	private int qnaNumber;
	private QnA qna;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		LogDao ld	=	new LogDao();
		
		qna = nd.getQnaByNumber(qnaNumber);
		
		qna.setMember(ld.selectByNumber(qna.getMemberNumber()));
		
		return SUCCESS;
	}

	public int getQnaNumber() {
		return qnaNumber;
	}

	public void setQnaNumber(int qnaNumber) {
		this.qnaNumber = qnaNumber;
	}

	public QnA getQna() {
		return qna;
	}

	public void setQna(QnA qna) {
		this.qna = qna;
	}

	
}
