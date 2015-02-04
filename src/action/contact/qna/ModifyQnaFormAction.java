package action.contact.qna;

import bean.bbs.QnA;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class ModifyQnaFormAction implements Action {
	private int qnaNumber;
	private QnA qna;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		qna = nd.getQnaByNumber(qnaNumber);
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
