package action.contact.qna;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class DeleteQnaAction implements Action {
	private int qnaNumber;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		nd.deleteQna(qnaNumber);
		
		return SUCCESS;
	}

	public int getQnaNumber() {
		return qnaNumber;
	}

	public void setQnaNumber(int qnaNumber) {
		this.qnaNumber = qnaNumber;
	}
	
	

}
