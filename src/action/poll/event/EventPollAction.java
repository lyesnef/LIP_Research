package action.poll.event;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.survey.Example;
import bean.survey.Multipoll;
import bean.survey.Poll;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;

import dao.EventDao;
import dao.GetPollDao;
import dao.SurveyDao;

public class EventPollAction implements Action {
	private List<Multipoll> multiList;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		LipMember lm	=	(LipMember) ServletActionContext.getRequest().getSession().getAttribute("lipMember");
		EventDao ed	=	new EventDao();
		
		System.out.println("1");
		multiList	=	new ArrayList<Multipoll>();
		if(lm==null){
			return LOGIN;
		}
		SurveyDao sd	=	new SurveyDao();
		
		
		List<Survey> sl	=	sd.selectOngoingSurvey();
		
		 List<Survey>sl2	=	 this.filterSurvey(sl, lm);
		
		for(Survey sur : sl2){
			
			Multipoll mp	=	new Multipoll(sur.getSurveyNumber());
	
			mp.setIsParticipated(ed.findMailList(sur.getSurveyNumber(), lm.getMemberNumber())?1 : 2);//참여했으면 true 아니면 false
			
			multiList.add(mp);
		}
		
		
		return SUCCESS;
	}
	public List<Multipoll> getMultiList() {
		return multiList;
	}
	public void setMultiList(List<Multipoll> multiList) {
		this.multiList = multiList;
	}
	
	public List<Survey> filterSurvey(List<Survey> list, LipMember member){
		//성별/나이/지역 조건들로 묶인 서베이와 안묶인 서베이를 골라낸다
		
		String[] constraintName	= {"지역", "나이"};
		
		List<Survey> tangledList = new ArrayList<Survey>();//성별/나이/지역 조건으로 묶인 서베이들
		List<Survey> notTangledList	=	new ArrayList<Survey>();//성별/나이/지역 조건으로 묶이지 않은 서베이들
		
		EventDao ed	=	new EventDao();
		

		for(Survey survey : list){
			boolean flag	=	false;
			List<String> constraintList	=	new ArrayList<String>();

			for(String str : constraintName){
				try {
					flag = ed.getConditionNumber(survey.getSurveyNumber(), str);
					//제한 조건명 하나씩 조사해서 있으면 묶인 서베이
					if(flag){
				
						constraintList.add(str);//제한 조건명을 추가한다
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					
					e.printStackTrace();
				}
			}
			
			if(constraintList.size()>0){
			
				survey.setConstraintName(constraintList);//제한 조건명을 세팅
		
				tangledList.add(survey);//묶인 서베이에 추가
			}else{
		
				notTangledList.add(survey);//묶이지 않은 서베이에 추가
			}
		
		}//묶인것 안묶인 것 골라냈음
		
		if(tangledList.size()>0){
			//묶인 것이 있다면 회원 조건과 비교
			for(Survey survey : tangledList){
				
				List<Boolean> boolList =	new ArrayList<Boolean>();
				
				for(String str : survey.getConstraintName()){
					str = str.trim();
					String memberValue;
					
					List<String> valueList;
					if(str.equals("지역")){
						try {
						
							valueList = ed.getSetConstraint(survey.getSurveyNumber(), str);
							//지역 권역들의 값들을 가져온다
						
					
							memberValue	=	ed.getMemberRegionOrAge(str, member.getMemberNumber());
							
							//회원의 권역 String값을 가져온다
							for(String conValue : valueList){
								if(conValue.equals(memberValue)){
									//값들을 비교해서 맞으면 true
								
									boolList.add(true);
								}
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}else if(str.equals("성별")){
						try {
					
							valueList = ed.getSetConstraint(survey.getSurveyNumber(), str);
						
							memberValue	=	ed.getMemberGender(member.getMemberNumber());
		
							for(String conValue : valueList){
				
								if(conValue.equals(memberValue)){
			
									boolList.add(true);
								}
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}else if(str.equals("나이")){
						try {
			
							valueList = ed.getSetConstraint(survey.getSurveyNumber(), str);
							//권역에 묶인 나이들의 String 값을 가져옴
						
							memberValue	=	ed.getMemberRegionOrAge(str, member.getMemberNumber());
							//사용자의 나이 String값을 가져와서
							
							for(String conValue : valueList){
								
								if(conValue.equals(memberValue)){
								//두 값을 비교해서 틀리면 flag를 false로 바꾼다
								
									boolList.add(true);
								}
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
					
					
				}
			
				boolean check	=	boolList.size()==survey.getConstraintName().size();
			
				if(check){
	
					notTangledList.add(survey);
				}
			}
		}
		
		return notTangledList;
	}

}
