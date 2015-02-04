package action.user.join;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.Action;

import dao.LogDao;

/*	sendEmail
 * param	from		보낸는이 
 * param	to			받는이
 * param	subject		메일제목
 * param	message		본문내용
 * James SMTP를이용하여 메일보내기
 * James 에서 run.bat 실행시키기
 */

public class CheckMailAction implements Action, ServletRequestAware {

	HttpServletRequest request;
	private String email;
	private String subject;
	private int confirmCheck;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getConfirmCheck() {
		return confirmCheck;
	}

	public void setConfirmCheck(int confirmCheck) {
		this.confirmCheck = confirmCheck;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}

	@Override
	public String execute() throws Exception {
		int cnt;
		LogDao logDao = new LogDao();
		cnt = logDao.selectNumByEmail(email);
		if(cnt == 0){
			message = "가입 가능한 이메일입니다.";
			subject = "LIP_Reseach 회원가입 인증 메일입니다.";
			sendEmail("LIP_Reseach@naver.com", email, subject, "");
		}else{
			message = "이미 가입하신 이메일입니다.";
		}
		
		
		return SUCCESS;
	}
	
	private void sendEmail(String from, String to, String subject, String message){
		 String[] data = to.split(",");
		System.out.println("메일왔냐?");
		System.out.println(email);
		try {
		   confirmCheck = ((int) (Math.random() * 99999) + 10000);
           Properties props = new Properties();
           props.setProperty("mail.host", "localhost");

           Session session = Session.getInstance(props);
           MimeMessage msg = new MimeMessage(session);
           msg.setText(message+ "\n\n" +
           		"인증 번호는 : " + confirmCheck);
           msg.setSubject(subject);
           msg.setFrom(new InternetAddress(from));
           msg.addRecipient(Message.RecipientType.TO, new InternetAddress(data[0]));
           Transport.send(msg);
		}catch(Exception e){}
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
