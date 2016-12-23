package action.contact.faq;

import java.util.List;

import bean.bbs.FAQ;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;
/*
 * 데이터 베이스 상에 저장된 FAQ의 목록을 가져온다
 */
public class FaqAction implements Action{
	private List<FAQ> faqList;//FAQ가 저장될 변수
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		faqList	=	nd.getFaq();
		
		return SUCCESS;
	}
	public List<FAQ> getFaqList() {
		return faqList;
	}
	public void setFaqList(List<FAQ> faqList) {
		this.faqList = faqList;
	}
	
	
}
