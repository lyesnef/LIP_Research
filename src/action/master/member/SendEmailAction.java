package action.master.member;

import com.opensymphony.xwork2.Action;

public class SendEmailAction implements Action{
	
	String fromEmail;
	String userEmail;
	String title;
	String Content;
	String userid;
	int usage;
	

	@Override
	public String execute() throws Exception {
		System.out.println("userEmail : "+ userEmail);
		
		// 관리자가 회원 일인에게
		if(usage==1)
		{
			fromEmail="LTP@naver.com";
			title=userid + "님 LIP Research 입니다.";
			Content="LIP Research 입니다.";
		}
		// 관리지가 회원 전체에게
		else if(usage==2)
		{
			fromEmail="LTP@naver.com";
			title=userid + "님 LIP Research 입니다.";
			Content="LIP 회원에게 보내는 전체 메일입니다.";
		}
		else if(usage==3)
		{
			fromEmail="LTP@naver.com";
			title=userid + "님 LIP Research 입니다.";
			Content="LIP 회원에게 보내는 설문 참여 메일입니다. ";
		}	
		
		return SUCCESS;
	}



	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getUsage() {
		return usage;
	}


	public void setUsage(int usage) {
		this.usage = usage;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}
}
