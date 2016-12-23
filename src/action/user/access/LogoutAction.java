package action.user.access;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.etc.MemberLog;
import bean.member.LipMember;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.MemberLogDao;

public class LogoutAction  implements Action{

	@Override
	public String execute() throws Exception {
		
		Map<String, LipMember> session = ActionContext.getContext().getSession();
		
		/*System.out.println("요기강ㅔ라" + session.get("lipMember").getMemberNumber());*/
		//로그기록 정보
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if(session.get("lipMember") != null)
		{
		String memberLogIp = request.getRemoteHost();
		
		MemberLog memberLog = new MemberLog();
		memberLog.setMemberLogContant("로그아웃");
		memberLog.setMemberLogIp(memberLogIp);
		memberLog.setMemberLogFrom(0);
		memberLog.setMemberNumber(session.get("lipMember").getMemberNumber());
		
		MemberLogDao memberLogDao = new MemberLogDao();
		memberLogDao.insertMemberLog(memberLog);
		
		session.remove("lipMember");
		}
		return SUCCESS;
	}

}
