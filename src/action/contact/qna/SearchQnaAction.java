package action.contact.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.bbs.QnA;
import bean.member.LipMember;

import com.opensymphony.xwork2.Action;

import dao.LogDao;
import dao.NoticeDao;

public class SearchQnaAction implements Action {
	private String SearchColumn;
	private String SearchWord;
	private List<QnA> qnaList;
	private int currentPage	=	1;
	private int totalCount;
	private int blockCount	=	10;
	private int blockPage	=	5;
	private String pagingHtml;
	private PagingAction page;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		LogDao ld	=	new LogDao();
		HashMap<String, Object> map	=	new HashMap<String, Object>();
		
		if(SearchColumn.equals("qna_title")){
			map.put("qnaTitle", SearchWord);
		}else if(SearchColumn.equals("qna_contant")){
			map.put("qnaContant", SearchWord);
		}else if(SearchColumn.equals("member_id")){	
			LipMember lm	=	ld.selectById(SearchWord);
			
			if(lm==null){
				return SUCCESS;
			}
			map.put("memberNumber", lm.getMemberNumber());
		}
		
		qnaList	=	nd.getQnaListByCondition(map);
		totalCount	=	qnaList.size();
		page	=	new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml	=	page.getPagingHtml().toString().trim();
		for(QnA qna : qnaList){
			qna.setMember(ld.selectByNumber(qna.getMemberNumber()));
		}
		
		System.out.println(pagingHtml);
		return SUCCESS;
	}
	public String getSearchColumn() {
		return SearchColumn;
	}
	public void setSearchColumn(String searchColumn) {
		SearchColumn = searchColumn;
	}
	public String getSearchWord() {
		return SearchWord;
	}
	public void setSearchWord(String searchWord) {
		SearchWord = searchWord;
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
