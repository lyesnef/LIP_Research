package action.contact.notice;

import bean.bbs.Notice;

import com.opensymphony.xwork2.Action;

import dao.NoticeDao;

public class GetSingleNotice implements Action {
	private int noticeNumber;
	private String process;
	private String result;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		NoticeDao nd	=	new NoticeDao();
		Notice notice	=	nd.getSingleNotice(noticeNumber);
		System.out.println(process);
		result	=	""+notice.getNoticeTitle()+"/"+notice.getNoticeContant();
		
		System.out.println(result);
		return SUCCESS;
	}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

}
