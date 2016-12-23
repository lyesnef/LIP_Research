package action.master.member;

import java.util.ArrayList;
import java.util.List;

import bean.member.LipMember;

import com.opensymphony.xwork2.Action;

import dao.LogDao;

public class MemberAction implements Action{

	String conValue;			// 조건 값
	String condition;			// 조건 (아이디, 수신거부등)
	
	List<LipMember> lipmemberList = new ArrayList<LipMember>();

	@Override
	public String execute() throws Exception {
		
		LogDao logDao = new LogDao();
		
		System.out.println("conValue : "+conValue);
		System.out.println("condition : "+condition);
		
		if(condition == null)
			lipmemberList = logDao.selectAllById(conValue);
		
		else if(condition.equals("id"))
			lipmemberList = logDao.selectAllById(conValue);
		
		return SUCCESS;
	}
	
	public String getConValue() {
		return conValue;
	}

	public void setConValue(String conValue) {
		this.conValue = conValue;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public List<LipMember> getLipmemberList() {
		return lipmemberList;
	}

	public void setLipmemberList(List<LipMember> lipmemberList) {
		this.lipmemberList = lipmemberList;
	}
	
}
