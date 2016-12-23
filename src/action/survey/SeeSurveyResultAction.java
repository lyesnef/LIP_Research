package action.survey;

import java.util.ArrayList;
import java.util.List;

import bean.survey.SetConstraint;
import bean.survey.SurveyConstraint;

import com.opensymphony.xwork2.Action;

import dao.SurveyDao;

public class SeeSurveyResultAction implements Action{

	final int AGE=1;
	final int LOCATION=3;
	final int GENDER=2;
	
	int surveyNum;
	List<SurveyConstraint> surveyConstraintList = new ArrayList<SurveyConstraint>();
	List<SurveyConstraint> surveyConstraintListTemp = new ArrayList<SurveyConstraint>();
	
	@Override
	public String execute() throws Exception {
		
		SurveyConstraint surveyConstraint;
		// 기본 권역 설정을 한다.
		surveyConstraint = new SurveyConstraint();
		surveyConstraint.setConstraintName("나이");
		surveyConstraint.setConstraintNumber(AGE);
		surveyConstraintList.add(surveyConstraint);
		
		surveyConstraint = new SurveyConstraint();
		surveyConstraint.setConstraintName("성별");
		surveyConstraint.setConstraintNumber(GENDER);
		surveyConstraintList.add(surveyConstraint);
		
		surveyConstraint = new SurveyConstraint();
		surveyConstraint.setConstraintName("지역");
		surveyConstraint.setConstraintNumber(LOCATION);
		surveyConstraintList.add(surveyConstraint);
		
		SurveyDao surveyDao = new SurveyDao();
		surveyConstraintListTemp = surveyDao.selectSurveyConstraintbyNum(surveyNum);
		
		for(int i=0; i < surveyConstraintListTemp.size();i++)
		{
			
			// 권역 41==나이 일경우에는 이미 인서트 되어있기때문에 인서트 하지 않는다.
			if(surveyConstraintListTemp.get(i).getConstraintNumber()==41)
			;
			
			else
				surveyConstraintList.add(surveyConstraintListTemp.get(i));
		}

		return SUCCESS;
	}

	public int getSurveyNum() {
		return surveyNum;
	}

	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}

	public List<SurveyConstraint> getSurveyConstraintList() {
		return surveyConstraintList;
	}

	public void setSurveyConstraintList(List<SurveyConstraint> surveyConstraintList) {
		this.surveyConstraintList = surveyConstraintList;
	}
	
}
