package action.contact.faq;

import bean.bbs.FAQ;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;
/*
 * 이미 게시된 FAQ의 내용을 수정하는 액션
 */
public class ModifyFaqAction implements Action{
	private FAQ faq;//수정할 내용을 담을 FAQ객체
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		nd.updateFaq(faq);
		
		return SUCCESS;
	}

	public FAQ getFaq() {
		return faq;
	}

	public void setFaq(FAQ faq) {
		this.faq = faq;
	}
	
}
