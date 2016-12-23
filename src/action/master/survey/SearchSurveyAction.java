package action.master.survey;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import bean.member.LipMember;
import bean.survey.MailSendList;
import bean.survey.Question;
import bean.survey.SetConstraint;
import bean.survey.Survey;
import bean.survey.SurveyConstraint;

import com.opensymphony.xwork2.Action;

import dao.EventDao;
import dao.LogDao;
import dao.SurveyDao;

public class SearchSurveyAction implements Action{

	int surveyNum;
	int con;
	Survey survey = new Survey();
	List<Question> questionList = new ArrayList<Question>();
	List<Integer> setConList = new ArrayList<Integer>();
	List<LipMember> mailSendList = new ArrayList<LipMember>();
	List<MailSendList> mailsendListList = new ArrayList<MailSendList>();
	
	
	@Override
	public String execute() throws Exception {
		System.out.println(con);
		System.out.println(surveyNum);
		SurveyDao surveyDao = new SurveyDao();
		
		questionList = surveyDao.selectQuestionNum(surveyNum);
		
		if (con == 0)
		{
		survey=surveyDao.selectSurveyAllByNum(surveyNum);
		}
		// 진행 상태로 바꿈 - 등록
		else if(con == 2)
		{
			// 진행상태 업데이트
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("condition", con);
			map.put("surveyNumber", surveyNum);
			surveyDao.updateSurveyCondition(map);
			
			// 복합폴이 없는지 확인
			EventDao eventDao = new EventDao();
			List<Integer> memberGenList = new ArrayList<Integer>();
			List<Integer> memberAgeList = new ArrayList<Integer>();
			List<Integer> memberLocList = new ArrayList<Integer>();
			List<Integer> memberAllList = new ArrayList<Integer>();
			int genderNum=0;
			int ageNum=0;
			int locationNum=0;

			// 복합폴이 없으면
			if(eventDao.cehckBySurveyNumber(surveyNum).isEmpty())
			{
				System.out.println("복합폴이 없는 상태");
				// 기본 조건 밖에 없을 경우 참가리스트 인서트 
				
				setConList=surveyDao.selectMailListPre(surveyNum);
				if(setConList.size()==0)
				{
					// 모든 회원이 참가인원
					System.out.println("모든회원이 참가 인원");
					memberAllList=surveyDao.selectMailGendeAll();
				}
				else
				{
					for(int i =0; i<setConList.size(); i++)
					{
						//성별
						if(setConList.get(i)==1 || setConList.get(i)==2)
						{
							System.out.println("성별 검색 : " + setConList.get(i));
							Collection<Integer> testCollection = CollectionUtils.union(memberGenList, surveyDao.selectMailGendePre(setConList.get(i)));
							memberGenList=(List<Integer>) testCollection;
							genderNum++;
						}
						//나이
						else if( 2 < setConList.get(i) && setConList.get(i) < 9)
						{
							System.out.println("나이 검색 : " + setConList.get(i));
							Collection<Integer> testCollection = CollectionUtils.union(memberAgeList, surveyDao.selectMailAgePre(setConList.get(i)-2));
							memberAgeList=(List<Integer>) testCollection;
							ageNum++;
						}
						//지역
						else if( 8 < setConList.get(i) && setConList.get(i) < 16)
						{
							System.out.println("지역 검색 : " + setConList.get(i));
							Collection<Integer> testCollection = CollectionUtils.union(memberLocList, surveyDao.selectMailLocatePre(setConList.get(i)-8));
							memberLocList=(List<Integer>) testCollection;
							locationNum++;
						}
						
					}
					// 하나의 조건도 없으면 전체 회원
					if(genderNum==0)
					{
						// 모든 회원 셀렉트
						memberGenList=surveyDao.selectMailGendeAll();
					}
					if(ageNum==0)
					{
						// 모든 회원 셀렉트
						memberAgeList=surveyDao.selectMailGendeAll();
					}
					if(locationNum==0)
					{
						// 모든 회원 셀렉트
						memberLocList.addAll(surveyDao.selectMailGendeAll());
					}
					
					if(genderNum+ageNum+locationNum==0)
					{
						memberAllList=memberLocList;
						
					}
					else 
					{
						for(int i=0; i < memberGenList.size(); i++ )
						{
							System.out.print("성별");
							System.out.print(memberGenList.get(i) + ", ");
							System.out.println();
						}
						for(int i=0; i < memberAgeList.size(); i++ )
						{
							System.out.print("나이");
							System.out.print(memberAgeList.get(i) + ", ");
							System.out.println();
						}
						for(int i=0; i < memberLocList.size(); i++ )
						{
							System.out.print("지역");
							System.out.print(memberLocList.get(i) + ", ");
							System.out.println();
						}
						Collection<Integer> testCollection = CollectionUtils.intersection(memberGenList, memberAgeList);
						memberGenList.clear();
						for(int testColl : testCollection)
						{
							System.out.println("test : "+testColl);
							memberGenList.add(testColl);
						}
						for(int i=0; i < memberGenList.size(); i++ )
						{
							System.out.print("1차");
							System.out.print(memberGenList.get(i) + ", ");
							System.out.println();
						}
						
						testCollection = CollectionUtils.intersection(memberGenList, memberLocList);
						memberGenList.clear();
						for(int testColl : testCollection)
						{
							System.out.println("test : "+testColl);
							memberGenList.add(testColl);
						}
						for(int i=0; i < memberGenList.size(); i++ )
						{
							System.out.print("2차");
							System.out.print(memberGenList.get(i) + ", ");
							System.out.println();
						}
						memberAllList=memberGenList;
					}
					
				}
				System.out.println("인서트하나");
				// 참가리스트에 인서트 해준다.
				System.out.println(memberAllList.size());
				for(int index=0; index < memberAllList.size(); index++)
				{
					// 생성
					MailSendList mailSend = new MailSendList();
					System.out.print("회원번호 : " +memberAllList.get(index));
					mailSend.setMemberNumber(memberAllList.get(index));
					mailSend.setSurveyNumber(surveyNum);
					mailsendListList.add(mailSend);
					
					// 인서트
					eventDao.insertMailSendList(mailSend);
				}
			}
			
			// 복합볼이 있으면 복합폴 상태 변경
			else
			{
				List<Integer> pollNumList = new ArrayList<Integer>();
				pollNumList = surveyDao.selectMultiPoll(surveyNum);
				
				for(int i=0; i < pollNumList.size(); i++)
				{
					surveyDao.updateMultiPollCondition(pollNumList.get(i));
				}
				
			}
			
			// 현재 게시판 업데이트
			survey=surveyDao.selectSurveyAllByNum(surveyNum);
		}
		
		// 진행상태 강제종료
		else if(con == 4)
		{
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("condition", con);
			map.put("surveyNumber", surveyNum);
			surveyDao.updateSurveyCondition(map);
			
			survey=surveyDao.selectSurveyAllByNum(surveyNum);
			
		}
		// 참가리스트 조회
		LogDao logDao = new LogDao();
		mailSendList=logDao.selectSendMailbySurvey(surveyNum);
		
		return SUCCESS;
	}
	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public Survey getSurvey() {
		return survey;
	}
	public void setSurvey(Survey survey) {
		this.survey = survey;
	}
	public int getCon() {
		return con;
	}
	public void setCon(int con) {
		this.con = con;
	}
	public List<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	public List<Integer> getSetConList() {
		return setConList;
	}
	public void setSetConList(List<Integer> setConList) {
		this.setConList = setConList;
	}
	public List<LipMember> getMailSendList() {
		return mailSendList;
	}
	public void setMailSendList(List<LipMember> mailSendList) {
		this.mailSendList = mailSendList;
	}
	
	
}
