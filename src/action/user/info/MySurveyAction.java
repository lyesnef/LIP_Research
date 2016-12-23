package action.user.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;

import dao.SurveyDao;

public class MySurveyAction implements Action{

	List<Survey> surveyList = new ArrayList<Survey>();
	LipMember lipMember;
	
	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		
		SurveyDao surveyDao = new SurveyDao();
		surveyList = surveyDao.selectAllByNumber(lipMember.getMemberId());
		
		return SUCCESS;
	}

	public List<Survey> getSurveyList() {
		return surveyList;
	}

	public void setSurveyList(List<Survey> surveyList) {
		this.surveyList = surveyList;
	}

}
