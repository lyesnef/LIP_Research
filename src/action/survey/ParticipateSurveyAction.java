package action.survey;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;


import bean.member.LipMember;
import bean.survey.Example;
import bean.survey.LimitParticipate;
import bean.survey.Question;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.SurveyDao;

public class ParticipateSurveyAction  implements Action{

	String result;
	String message;				// 참여자수가 5명 이하일 경우 독려 메세지를 출력
	int surveyNum;
	int limitNum;
	int memberNum;
	
	 List<Question> questionList = new ArrayList<Question>();
	 private List<Example> exampleList;
	
	@Override
	public String execute() throws Exception {
		
		System.out.println("파티시페이션 액션 : "+result);
		SurveyDao surveyDao = new SurveyDao();
		
		if(result.length() > 0)
		{
			String[] choise = result.split(",");		// 받아온 파라미터값을 짜른다.
			
			List<List<Integer>> list = new ArrayList<List<Integer>>();	// 결과값을 받을 리스트 
			
			// 맵으로 파라미터로 변경해서 해당 리스트값을 받아온다.
			for(int i = 0; i<choise.length; i++)
			{
				Map<String, Integer> map = new HashMap<String,Integer>();
				map.put("survey", surveyNum);
				map.put("setCon", Integer.parseInt(choise[i]));
				List<Integer> temp = surveyDao.getLimitNum(map);
				list.add(temp);
				
			}
			
			// 각 리스트들의 교집합을 구하기;
			/*Collection<Integer> testCollection;*/
		
			List<Integer> subList = new ArrayList<Integer>();
			List<Integer> subList1 = new ArrayList<Integer>();
			subList = list.get(0);
			for(int i=0; i<list.size()-1; i++)
			{
				subList1 = list.get(i+1);
				for(int j=0; j<subList.size(); j++){
					System.out.print("1번스트링 : "+ subList.get(j) + ",");
				}
				System.out.println();
				for(int j=0; j<subList1.size(); j++){
					System.out.print("2번스트링 : "+ subList1.get(j) + ",");
				}
				System.out.println();
				Collection<Integer> testCollection = CollectionUtils.intersection(subList, subList1);
				subList.clear();
				for(int testColl : testCollection)
				{
					System.out.println("test : "+testColl);
					subList.add(testColl);
				}
							
			}
		
		// 제한 카운트 숫자 확인
			System.out.println("subList.size() = "+subList.size());
			limitNum=subList.get(0);
		
		}
		// result == 널일 경우
		
		
		/*else
		{
			limitNum = surveyDao.getOneLimitNum(surveyNum);
			
		}*/
		LimitParticipate limit = surveyDao.getLimitCount(limitNum);
		
		System.out.println("제한번호  : "+ limitNum);
		
		// 메일리스트에서 해당 멤버을 삭제한다.
		Map<String, Object> session = ActionContext.getContext().getSession();	
		LipMember lipmember = (LipMember) session.get("lipMember");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", lipmember.getMemberNumber());
		map.put("surveyNum", surveyNum);
		int aa=surveyDao.deletePaticipate(map);
		System.out.println("삭제 : " + aa);
		
		// 제한 조건에 맞으면 문제를 출력한다.
		if(limit.getLimitParticipateLimit()>limit.getLimitParticipateCount())
		{
			if(limit.getLimitParticipateLimit()-limit.getLimitParticipateCount() <= 5)
			{
				message = "설문 제한수가 5명 이하입니다. 참여가 안될수도 있습니다.";
			}
			questionList = surveyDao.selectQuestionNum(surveyNum);
			for(int i=0; i<questionList.size();i++)
			{
				System.out.println(questionList.get(i).getQuestionContant());
				for(int j=0;j<questionList.get(i).getExampleList().size();j++)
				{
					System.out.println(questionList.get(i).getExampleList().get(j).getExampleContant());
				}
			}
			return SUCCESS;
		}
		
		// 제한 조건에 맞지않으면 에러 페이지를 출력한다.
		else
			return INPUT;
		
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public int getSurveyNum() {
		return surveyNum;
	}


	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public List<Question> getQuestionList() {
		return questionList;
	}


	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}


	public List<Example> getExampleList() {
		return exampleList;
	}


	public void setExampleList(List<Example> exampleList) {
		this.exampleList = exampleList;
	}


	public int getLimitNum() {
		return limitNum;
	}


	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}


	public int getMemberNum() {
		return memberNum;
	}


	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	
}