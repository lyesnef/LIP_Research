package action.survey;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;

import dao.MailSendListDao;
import dao.SurveyDao;

public class OnGoingSurveyAction  implements Action{

	List<Survey> surveyList = new ArrayList<Survey>();
	
	@Override
	public String execute() throws Exception {
		SurveyDao surveyDao = new SurveyDao();
		MailSendListDao msld	=	new MailSendListDao();
		LipMember lm	=	(LipMember) ServletActionContext.getRequest().getSession().getAttribute("lipMember");
		if(lm==null){
			return LOGIN;
		}
		List<Survey> resultList	=	new ArrayList<Survey>();
		if(msld.selectByMemberNum(lm.getMemberNumber())==null){
			//이메일 리스트에 존재하지 않으면
			return SUCCESS;
		}
		
		surveyList = surveyDao.selectAllByNumber("");//모든 서베이 리스트를 가져온다
		
		for(Survey sur : surveyList){
			if(surveyDao.checkMailList(sur.getSurveyNumber(), lm.getMemberNumber())){
				sur.setParticipable(1);
			}else{
				sur.setParticipable(2);
			}
			System.out.println(sur.getCategoryNumber());
			resultList.add(sur);
		}
		
		surveyList	=	resultList;
		
		return SUCCESS;
	}

	public List<Survey> getSurveyList() {
		return surveyList;
	}

	public void setSurveyList(List<Survey> surveyList) {
		this.surveyList = surveyList;
	}
	
}
