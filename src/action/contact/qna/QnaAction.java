package action.contact.qna;

import java.util.HashMap;
import java.util.List;

import bean.bbs.QnA;

import com.opensymphony.xwork2.Action;

import dao.LogDao;
import dao.NoticeDao;

public class QnaAction implements Action{
	private List<QnA> qnaList;
	private int currentPage;
	private int totalCount;
	private int blockCount	=	10;
	private int blockPage	=	5;
	private String pagingHtml;
	private PagingAction page;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		if(currentPage==0){
			currentPage	=	1;
		}
		totalCount	=	 nd.getRowCount();
		System.out.println("currentPage = " +currentPage);
		page	=	new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml	=	page.getPagingHtml().toString().trim();
		
		int lastCount	=	totalCount;
		
		if(page.getEndCount()<totalCount){
			lastCount	=	page.getEndCount()+1;
		}
		
		HashMap<String, Integer>	map	=	new HashMap<String, Integer>();
		
		map.put("start", page.getStartCount());
		map.put("end", lastCount);
		LogDao ld	=	new LogDao();
		
		qnaList	=	nd.getQnaList(map);
		for(QnA qna : qnaList){
			qna.setMember(ld.selectByNumber(qna.getMemberNumber()));
		}
		
		return SUCCESS;
	}

	public List<QnA> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnA> qnaList) {
		this.qnaList = qnaList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

}
