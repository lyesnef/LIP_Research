package action.survey;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.SetConstraint;
import bean.survey.SurveyConstraint;

import com.opensymphony.xwork2.Action;

import dao.LogDao;
import dao.SurveyDao;

public class PreviewSurveyAction  implements Action{

	final int AGE=1;
	final int LOCATION=3;
	final int GENDER=2;
	
	int surveyNum;
	int memberNum;
	String result="";
	List<SurveyConstraint> surveyConstraintList = new ArrayList<SurveyConstraint>();
	List<SurveyConstraint> surveyConstraintListTemp = new ArrayList<SurveyConstraint>();
	List<SetConstraint> setConstraintList = new ArrayList<SetConstraint>();
	HttpServletRequest request;
	LipMember lipMember;
	
	
	@Override
	public String execute() throws Exception {
		System.out.println("프리뷰");
		System.out.println(surveyNum);
		SurveyDao surveyDao = new SurveyDao();
		
		surveyConstraintListTemp = surveyDao.selectSurveyConstraintbyNum(surveyNum);
		System.out.println(surveyConstraintListTemp.size());
		if(surveyConstraintListTemp.size()>0)
		{
			System.out.println(surveyConstraintListTemp.get(0).getConstraintName());
			setConstraintList = surveyConstraintListTemp.get(0).getSetConstraintList();
			System.out.println(setConstraintList.get(0).getSetConstraintName());
			
			//기본권역체크
			for(int i=0; i < surveyConstraintListTemp.size();i++)
			{
				request = ServletActionContext.getRequest();
				lipMember = (LipMember) request.getSession().getAttribute("lipMember");
				LogDao logDao;
				
				//나이체크
				if(surveyConstraintListTemp.get(i).getConstraintNumber()==AGE)
				{
					logDao = new LogDao();
					String age = logDao.selectAgeNum(lipMember.getAgeNumber());
					List<SetConstraint> temp =surveyConstraintListTemp.get(i).getSetConstraintList();
					for(int j=0; j<temp.size();j++)
					{
						if(age.equals(temp.get(j).getSetConstraintName()))
						{
							int ageStatu=temp.get(j).getSetConstraintNumber();
							result += Integer.toString(ageStatu)+",";
							System.out.println(ageStatu);
						}
							
					}
				}
				
				// 성별 체크 
				else if(surveyConstraintListTemp.get(i).getConstraintNumber()==GENDER)
				{
					logDao = new LogDao();
					int gender = lipMember.getAgeNumber();
					String genderStr;
					if(gender == 1)
						genderStr="남";
					else 
						genderStr="여";
					
					List<SetConstraint> temp =surveyConstraintListTemp.get(i).getSetConstraintList();
					for(int j=0; j<temp.size();j++)
					{
						if(genderStr.equals(temp.get(j).getSetConstraintName()))
						{
							int genderStatu=temp.get(j).getSetConstraintNumber();
							result += Integer.toString(genderStatu)+",";
							System.out.println(genderStatu);
						}
							
					}
				}
				
				// 지역 체크 
				else if(surveyConstraintListTemp.get(i).getConstraintNumber()==LOCATION)
				{
					logDao = new LogDao();
					String region = logDao.selectRegionName(lipMember.getRegionNumber());
					List<SetConstraint> temp =surveyConstraintListTemp.get(i).getSetConstraintList();
					for(int j=0; j<temp.size();j++)
					{
						if(region.equals(temp.get(j).getSetConstraintName()))
						{
							int regionStatu=temp.get(j).getSetConstraintNumber();
							result += Integer.toString(regionStatu)+",";
							System.out.println(regionStatu);
						}
							
					}
				}
				
				
				else
				{
					surveyConstraintList.add(surveyConstraintListTemp.get(i));
				}
			}
			memberNum=lipMember.getMemberNumber();
			return SUCCESS;
		}
		else return INPUT;
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

	public List<SetConstraint> getSetConstraintList() {
		return setConstraintList;
	}

	public void setSetConstraintList(List<SetConstraint> setConstraintList) {
		this.setConstraintList = setConstraintList;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
}
