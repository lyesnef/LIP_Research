package action.contact.faq;

import bean.bbs.FAQ;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;
/*
 * FAQ의 상세내용을 보여주는 액션
 */
public class SingleFaqAction implements Action {
	private int faqNumber;
	private FAQ faq;
	private String result;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		faq	=	nd.getFaqByNumber(faqNumber);//FAQ의 고유키값으로 FAQ의 정보를 읽어온다
		
		result	=	""+faq.getFaqTitle()+"/"+faq.getFaqAnswer();
		
		return SUCCESS;
	}
	public int getFaqNumber() {
		return faqNumber;
	}
	public void setFaqNumber(int faqNumber) {
		this.faqNumber = faqNumber;
	}
	public FAQ getFaq() {
		return faq;
	}
	public void setFaq(FAQ faq) {
		this.faq = faq;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	

}
