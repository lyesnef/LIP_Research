package action.contact.qna;

public class PagingAction {
	private int currentPage;
	private int totalCount;
	private int totalPage;
	private int blockCount;
	private int blockPage;
	private int startCount;
	private int endCount;
	private int startPage;
	private int endPage;
	private StringBuffer pagingHtml;
	
	public PagingAction(int currentPage, int totalCount, int blockCount, int blockPage){
		this.blockCount	=	blockCount;
		this.blockPage	=	blockPage;
		this.currentPage	=	currentPage;
		this.totalCount	=	totalCount;
		
		totalPage	=	(int)Math.ceil((double)totalCount/blockCount);
		if(totalPage==0){
			totalPage	=	1;
		}
		
		if(currentPage>totalPage){
			currentPage	=	totalPage;
		}
		
		startCount	=	(currentPage-1)*blockCount;
		endCount	=	startCount+blockCount-1;
		
		startPage	=	(int)((currentPage-1)/blockPage)*blockPage+1;
		endPage	=	startPage+blockPage-1;
		
		if(endPage>totalPage){
			endPage	=	totalPage;
		}
		
		pagingHtml	=	new StringBuffer();
		if(currentPage>blockPage){
			pagingHtml.append("<li><a class='before' href='Qna.action?currentPage="+(startPage-1)+"'>");
			pagingHtml.append("이전");
			pagingHtml.append("</a></li>");
		}
		
		for(int i=startPage; i<=endPage; i++){
			if(i>totalPage){
				break;
			}
			
			if(i==currentPage){
				pagingHtml.append("<li><strong>"+i+"</strong></li>");
			}else{
				pagingHtml.append("<li><a href='Qna.action?currentPage="+i);
				pagingHtml.append("'>");
				pagingHtml.append(i);
				pagingHtml.append("</a></li>");
			}
			
			if(totalPage-startPage>=blockPage){
				pagingHtml.append("<li><a href='Qna.action?currentPage=");
				pagingHtml.append((endPage+1)+">");
				pagingHtml.append("다음");
				pagingHtml.append("</a></li>");
			}
		}
		
		
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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}
