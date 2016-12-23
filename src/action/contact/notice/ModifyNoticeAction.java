package action.contact.notice;

import bean.bbs.Notice;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class ModifyNoticeAction implements Action {
	private Notice notice;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		System.out.println(notice.getNoticeNumber());
		nd.updateNotice(notice);
		
		return SUCCESS;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

}
