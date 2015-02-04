package action.master.survey;

import java.util.ArrayList;
import java.util.List;

import bean.member.LipMember;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;

import dao.LogDao;
import dao.SurveyDao;

public class MaintainSurveyAction implements Action{

	String conValue;			// 조건 값
	String condition;			// 조건 (아이디, 수신거부등)
	int param;					// 진행상태
	
	List<Survey> surveyList = new ArrayList<Survey>();
	
	@Override
	public String execute() throws Exception {
		
		SurveyDao surveyDao = new SurveyDao();
		if(param!=0)
		{
			surveyList = surveyDao.selectSurveyAllByCondition(param);
		}
		else
		{
	/*		System.out.println("conValue : "+conValue);
			System.out.println("condition : "+condition);*/
			
			if(condition == null)
				surveyList = surveyDao.selectAllByNumber(conValue);
			
			else if(condition.equals("id"))
				surveyList = surveyDao.selectAllByNumber(conValue);
		}
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

	public List<Survey> getSurveyList() {
		return surveyList;
	}

	public void setSurveyList(List<Survey> surveyList) {
		this.surveyList = surveyList;
	}

	public int getParam() {
		return param;
	}

	public void setParam(int param) {
		this.param = param;
	}
	
}
