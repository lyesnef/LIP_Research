package action.contact.faq;

import bean.bbs.FAQ;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class WriteFaqAction implements Action{
	private FAQ faq;
	/*
	 * FAQ를 등록하는 클래스
	 */
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		nd.insertFaq(faq);//웹으로 부터 입력받은 FAQ내용을 데이터베이스 상에 등록한다.
		
		return SUCCESS;
	}
	public FAQ getFaq() {
		return faq;
	}
	public void setFaq(FAQ faq) {
		this.faq = faq;
	}

}
