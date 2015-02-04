package action.user.access;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.etc.MemberLog;
import bean.member.LipMember;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.LogDao;
import dao.MailSendListDao;
import dao.MemberLogDao;
import dao.SurveyDao;

public class LoginAction implements Action{

	String username;
	String password;
	String message;
	
	
	@Override
	public String execute() throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();	
		System.out.println("password: "+password);
		LogDao logDao = new LogDao();
		MailSendListDao msld	=	new MailSendListDao();
		LipMember lipMember = logDao.selectById(username);
		List<Integer> enterList = msld.selectByMemberNum(lipMember.getMemberNumber());
		
		
		if(lipMember != null)
		{
			// 로그인되는 경우
			if(lipMember.getMemberPw().equals(password))
			{
				 
				HttpServletRequest request = ServletActionContext.getRequest();
				
				String memberLogIp = request.getRemoteHost();
				// 세션에 멤버 정보 등록
				session.put("lipMember", lipMember);
				
				// 메일 발송 리스트(참가 가능한 서베이리스트)를 업데이트함 가져옴
				MailSendListDao mailSendDoa = new MailSendListDao();
				enterList=mailSendDoa.selectByMemberNum(lipMember.getMemberNumber());
				List<Survey> surveyList	=	new ArrayList<Survey>();
				SurveyDao sd	=	new SurveyDao();
				
				if(enterList!=null){
					for(Integer i : enterList){
						System.out.println("i = "+i);
						Survey sur	=	sd.selectSurveyAllByNum(i);
						System.out.println(sur.getSurveyTitle());
						surveyList.add(sur);
					}
				}
				
				
				session.put("enterList", surveyList);
				
				MemberLog memberLog = new MemberLog();
				memberLog.setMemberLogContant("로그인");
				memberLog.setMemberLogIp(memberLogIp);
				memberLog.setMemberLogFrom(0);
				memberLog.setMemberNumber(lipMember.getMemberNumber());
				
				MemberLogDao memberLogDao = new MemberLogDao();
				memberLogDao.insertMemberLog(memberLog);
				
				if(username.equals("admin"))
				{
					return "admin";
				}
				else
				{
					return "member";
				}
				
			}
			else 
			{
				// 로그인이 안됨 
				message="비밀번호가 틀립니다.";
				return "input";
			}
		}
		message="아이디가 존재하지 않습니다.";
		return "input";
		
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
