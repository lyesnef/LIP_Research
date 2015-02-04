package action.contact.notice;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class DeleteNoticeAction implements Action{
	private int noticeNumber;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		System.out.println(noticeNumber);
		nd.deleteNotice(noticeNumber);
		
		return SUCCESS;
	}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}
	
	
}
