package action.user.info;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.member.Postcode;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.InfoDao;
import dao.JoinDao;
import dao.LogDao;

@SuppressWarnings("serial")
public class CheckPWAction extends ActionSupport {
	private String password;
	private LipMember lipMember;
	private HttpServletRequest request;
	private LipMember lp;
	private Postcode pc;
	
	public LipMember getLp() {
		return lp;
	}

	public void setLp(LipMember lp) {
		this.lp = lp;
	}

	public Postcode getPc() {
		return pc;
	}

	public void setPc(Postcode pc) {
		this.pc = pc;
	}

	public LipMember getLipMember() {
		return lipMember;
	}

	public void setLipMember(LipMember lipMember) {
		this.lipMember = lipMember;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String execute() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		LogDao logDao = new LogDao();
		lipMember = logDao.selectById(lp.getMemberId());
		System.out.println(lipMember.getMemberId());
		System.out.println(lipMember.getMemberPw());
		session.put("lipMember", lipMember);
		pc = new Postcode();
		InfoDao infodao = new InfoDao();
		pc = infodao.selectPostcodeByNum(lipMember.getPostcodeNumber());
		
		return SUCCESS;
	}
	
	@Override
	public void validate(){
		request = ServletActionContext.getRequest();
		lp = new LipMember();
		lp = (LipMember)request.getSession().getAttribute("lipMember");
		String repw = lp.getMemberPw();
		
		if(password == null || password ==""){
			addFieldError("fail", "비밀번호를 입력해주세요.");
		}else if(password.length() < 8 || password.length() >12){
			addFieldError("fail", "비밀번호는 8자에서 12자 입니다.");
		}else if(!password.trim().equals(repw.trim())){
			addFieldError("fail", "비밀번호가 일치하지 않습니다.");
		}
		
		
		
		
	}
}
