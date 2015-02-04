package Utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	public void sendEmail(String from, String to, String subject, String message){
		 String[] data = to.split(",");
		
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
}
