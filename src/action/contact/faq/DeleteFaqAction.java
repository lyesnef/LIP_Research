package action.contact.faq;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;
/*
 * FAQ 게시물을 삭제하는 액션
 */
public class DeleteFaqAction implements Action {
	
	private int faqNumber;//삭제할 FAQ의 고유번호
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		nd.deleteFaq(faqNumber);
		
		return SUCCESS;
	}

	public int getFaqNumber() {
		return faqNumber;
	}

	public void setFaqNumber(int faqNumber) {
		this.faqNumber = faqNumber;
	}
	
	
}
