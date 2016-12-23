package action.master.member;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.Action;

public class SuccessEmailAction implements Action,  ServletRequestAware {
	
	
	HttpServletRequest request;
	
	private String fromEmail;
	private String userEmail;
	private String title;
	private String content;
	private String[] reUserEmail;

	@Override
	public String execute() throws Exception {
		
		
		//체그가 없이 요청시 돌려보낸다.
		if (userEmail == null) {
			System.out.println("데이타 없다.");
			return SUCCESS;
		}
	
		else {
			reUserEmail= userEmail.split(", ");
			for (int i = 0; i < reUserEmail.length; i++) {
			sendEmail(fromEmail, reUserEmail[i], title, content);
			}
		}
		
		return SUCCESS;
	
	}

	private void sendEmail(String from, String to, String subject, String message){
		 String[] data = to.split(",");
		System.out.println("메일왔냐?");
		try {
           Properties props = new Properties();
           props.setProperty("mail.host", "localhost");

           Session session = Session.getInstance(props);
           MimeMessage msg = new MimeMessage(session);
           msg.setText(message);
           msg.setSubject(subject);
           msg.setFrom(new InternetAddress(from));
           msg.addRecipient(Message.RecipientType.TO, new InternetAddress(data[0]));
           Transport.send(msg);
		}catch(Exception e){}
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request=request;
		
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}


	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
