package action.user.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.SurveyParticipate;

import com.opensymphony.xwork2.Action;

import dao.SurveyParticipateDao;

public class MyParticipateSurveyAction implements Action{

	List<SurveyParticipate> surveyParticipateList = new ArrayList<SurveyParticipate>();
	LipMember lipMember;
	
	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		SurveyParticipateDao surveyParticipateDao = new SurveyParticipateDao();
		
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		surveyParticipateList = surveyParticipateDao.selectAllByNumber(lipMember.getMemberNumber());
		
		return SUCCESS;
	}

	public List<SurveyParticipate> getSurveyParticipateList() {
		return surveyParticipateList;
	}

	public void setSurveyParticipateList(
			List<SurveyParticipate> surveyParticipateList) {
		this.surveyParticipateList = surveyParticipateList;
	}
	
}
