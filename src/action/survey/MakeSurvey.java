package action.survey;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;

import bean.member.Age;
import bean.member.Gender;
import bean.member.Region;
import bean.survey.SetConstraint;

import com.opensymphony.xwork2.Action;

import dao.PollDao;
import dao.SurveyDao;

public class MakeSurvey implements Action, ParameterAware{
	private Map parameters;
	private String surveyTitle;
	private int limitParticipateNumber;
	private int questionCount;
	private List<SetConstraint> ageList;
	private List<SetConstraint> genderList;
	private List<SetConstraint> regionList;
	private List category;
	
	@Override
	public void setParameters(Map parameters) {
		this.parameters = parameters;		
	}
	
	@Override
	public String execute() throws Exception {
		int count = parameters.size();
		System.out.println(count);
		String[] surT = (String[])parameters.get("surveyTitle");
		String[] surL = (String[])parameters.get("limitParticipateNumber");
		String[] surQ = (String[])parameters.get("questionCount");
		surveyTitle = surT[0];
		limitParticipateNumber = Integer.parseInt(surL[0]);
		questionCount = Integer.parseInt(surQ[0]);
		
		
		PollDao	pd	=	new PollDao();
		category	=	pd.getCategories();
		
		//기본권역값가져오기
		SurveyDao sd = new SurveyDao();
		
		ageList = new ArrayList<SetConstraint>();
		regionList = new ArrayList<SetConstraint>();
		genderList = new ArrayList<SetConstraint>();
		ageList = sd.selectSetConbyName("나이");
		regionList = sd.selectSetConbyName("지역");
		genderList = sd.selectSetConbyName("성별");
		
		return SUCCESS;
	}
	public String getSurveyTitle() {
		return surveyTitle;
	}
	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}
	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}
	public void setLimitParticipateNumber(int limitParticipateNumber) {
		this.limitParticipateNumber = limitParticipateNumber;
	}
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}

	public List getAgeList() {
		return ageList;
	}

	public void setAgeList(List ageList) {
		this.ageList = ageList;
	}

	public List getGenderList() {
		return genderList;
	}

	public void setGenderList(List genderList) {
		this.genderList = genderList;
	}

	public List getRegionList() {
		return regionList;
	}

	public void setRegionList(List regionList) {
		this.regionList = regionList;
	}

	public List getCategory() {
		return category;
	}

}
