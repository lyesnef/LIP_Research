package action.contact.notice;

import java.util.List;

import bean.bbs.Notice;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class NoticeAction implements Action{
	private List<Notice> noticeList;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		
		noticeList	=	nd.getNoticeList();
		
		return SUCCESS;
	}
	public List<Notice> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}

}
