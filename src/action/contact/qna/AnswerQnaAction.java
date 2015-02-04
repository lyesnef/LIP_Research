package action.contact.qna;

import java.util.HashMap;

import bean.bbs.QnA;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class AnswerQnaAction implements Action{
	private QnA qna;
	private int qnaNumber;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		nd.updateQna(qna);
		qnaNumber	=	qna.getQnaNumber();
		return SUCCESS;
	}

	public QnA getQna() {
		return qna;
	}

	public void setQna(QnA qna) {
		this.qna = qna;
	}

	public int getQnaNumber() {
		return qnaNumber;
	}

	public void setQnaNumber(int qnaNumber) {
		this.qnaNumber = qnaNumber;
	}
	
	
	

}
