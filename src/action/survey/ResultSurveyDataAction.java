package action.survey;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.survey.Example;
import bean.survey.Question;

import com.opensymphony.xwork2.Action;

import dao.SurveyDao;

public class ResultSurveyDataAction implements Action{

	final int AGE=1;
	final int LOCATION=3;
	final int GENDER=2;
	
	int conNum;				// 권역 값 
	int conValue;			// 권역 숫자
	int surveyNum;			// 서베이 번호
	int countMax=0;
	
	List<String> question = new ArrayList<String>();		// 문제 리스트-
	List<String> answer = new ArrayList<String>();			// 답안 리스트-
	List<String> cons = new ArrayList<String>();			// 제약조건 리스트-
	
	List<Integer> anitems = new ArrayList<Integer>();		// 문항당 Answer 갯수 리스트-
	List<Integer> count = new ArrayList<Integer>();			// 총 답 결과 리스트
	
	List<Integer> checkNum = new ArrayList<Integer>();		// 문제 갯수-
	List<Integer> conpiece = new ArrayList<Integer>();		// 문항당 제약조건 갯수 리스트-
	
	List<Example> exampleList = new ArrayList<Example>() ;
	
	@Override
	public String execute() throws Exception {
		
		int totalPiece =0;									// 총 답안갯수 
		System.out.println("result Data");
		System.out.println(conNum);
		List<Question> questionList = new ArrayList<Question>();
		SurveyDao surveyDao = new SurveyDao();
		List<Integer> examNumList = new ArrayList<Integer>();
		List<String> consTemp = new ArrayList<String>();
		
		
		
		// DB 파라미터로사용할 hash맵을 만든다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("conNum", conNum);
		map.put("surveyNum", surveyNum);
		
		// 제약조건이 41(나이)일 경우 61(지역) 62(성별)
		if(conNum==AGE)
		{
			consTemp=surveyDao.getBasicSetConName(map);
			
			//기본조건이 제약조건이 아니면 
			if(consTemp.isEmpty()){

				consTemp=surveyDao.getSetConstraintName(conNum);				// 권역 리스트를 가져오고
				exampleList=surveyDao.getResultListAge(surveyNum);
				 
			}
			else{
				System.out.println("답안리스트를 가져온다=나이");
				exampleList = surveyDao.getResultList(map);						// 답안 체크된 결과값을 가져온다.
				for(int i=0; i < exampleList.size(); i++)
				{
					System.out.println(exampleList.get(i).getConString());
				}
				
			}
		}
		else if(conNum==LOCATION)
		{
			consTemp=surveyDao.getBasicSetConName(map);
			
			//기본조건이 제약조건이 아니면
			if(consTemp.isEmpty()){
				consTemp=surveyDao.getSetConstraintName(conNum);
				exampleList=surveyDao.getResultListPost(surveyNum);
				 
			}
			else{
				exampleList = surveyDao.getResultList(map);
			}
			
		}
		else if(conNum==GENDER)
		{
			consTemp=surveyDao.getBasicSetConName(map);
			
			//기본조건이 제약조건이 아니면
			if(consTemp.isEmpty()){
			
				consTemp=surveyDao.getSetConstraintName(conNum);
				System.out.println("가져온 권역");
				System.out.println(consTemp.get(0));
				System.out.println(consTemp.get(1));
				exampleList=surveyDao.getResultListGender(surveyNum);
			
				// 1일경우 남자 2일 경우 여자로 변경한다.
				for(int i=0; i < exampleList.size(); i++)
				{
					System.out.println(exampleList.get(i).getConString());
					if(exampleList.get(i).getConString().equals("1")){
						exampleList.get(i).setConString("남");
					}
					else{
						exampleList.get(i).setConString("여");
					}
					System.out.println(exampleList.get(i).getConString());
				}
			}
			else{
				exampleList = surveyDao.getResultList(map);
			}
			
		}
		// 기본권역이 아닌경우
		else{
			
			System.out.println("추가권역 부분 Dao실행");
			consTemp=surveyDao.getSetConstraintName(conNum);
			exampleList = surveyDao.getResultList(map);
		}
		
		// 문제 리스트를 가져온다.
		questionList = surveyDao.selectQuestionNum(surveyNum);
		
		checkNum.add(questionList.size());
		// 전달 파라미터에 값을 세팅한다.
		for(int i=0; i < questionList.size(); i++)
		{
			
			for(int j=0; j < consTemp.size(); j++)
			{
				cons.add(consTemp.get(j));
			}
			conpiece.add(consTemp.size());
			System.out.println("문제 : "+ questionList.get(i).getQuestionContant());
			question.add(questionList.get(i).getQuestionContant());
			
			System.out.println("답안갯수 : "+questionList.get(i).getExampleList().size());
			anitems.add(questionList.get(i).getExampleList().size());
			for(int j=0; j < questionList.get(i).getExampleList().size(); j++)
			{
				System.out.println("답안 : " + questionList.get(i).getExampleList().get(j).getExampleContant());
				answer.add(questionList.get(i).getExampleList().get(j).getExampleContant());
				examNumList.add(questionList.get(i).getExampleList().get(j).getExampleNumber());
			}
		}
		
		
		System.out.println("답안 크기 : " + exampleList.size());
		for(int i=0; i < exampleList.size(); i++)
		{
			System.out.println("1 : " +exampleList.get(i).getConString());
			System.out.println("2 : " +exampleList.get(i).getTotalValue());
		}
		// 총 답안개수
		for(int i=0; i< checkNum.get(0); i++)
		{
			totalPiece += anitems.get(i)*conpiece.get(0);
		}
		System.out.println("총갯수" + totalPiece);
		Example example = new Example();
		exampleList.add(example);
		int index=0;
		int r=0;
		System.out.println("문제크기 : "+ question.size());
		System.out.println("권역크기 : " + consTemp.size());
		for(int i=0; i < question.size(); i++)
		{
			System.out.println("보기크기 : "+anitems.get(i));
			for(int j=0; j < anitems.get(i); j++, r++)
			{
				for(int k=0; k < consTemp.size(); k++)
				{	
					System.out.println("index : " + index);
					System.out.println("a : "+consTemp.get(k));
					System.out.println("b : "+exampleList.get(index).getConString());
					System.out.println("c : "+exampleList.get(index).getExampleNumber());
					System.out.println("d : "+examNumList.get(r));
					if(consTemp.get(k).equals(exampleList.get(index).getConString())
					&& exampleList.get(index).getExampleNumber()==examNumList.get(r))
					{
							count.add(exampleList.get(index).getTotalValue());
							if(countMax < exampleList.get(index).getTotalValue())
								countMax = exampleList.get(index).getTotalValue();
							index++;
					}
					else
					{
						count.add(0); 
					}
						
				}
			}
		}
	
		for(int i=0; i < count.size(); i++)
			System.out.print(count.get(i)+",");
		
		return SUCCESS;
	}
	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public int getConNum() {
		return conNum;
	}
	public void setConNum(int conNum) {
		this.conNum = conNum;
	}
	public int getConValue() {
		return conValue;
	}
	public void setConValue(int conValue) {
		this.conValue = conValue;
	}
	public List<String> getQuestion() {
		return question;
	}
	public void setQuestion(List<String> question) {
		this.question = question;
	}
	public List<String> getAnswer() {
		return answer;
	}
	public void setAnswer(List<String> answer) {
		this.answer = answer;
	}
	public List<String> getCons() {
		return cons;
	}
	public void setCons(List<String> cons) {
		this.cons = cons;
	}
	public List<Integer> getAnitems() {
		return anitems;
	}
	public void setAnitems(List<Integer> anitems) {
		this.anitems = anitems;
	}
	public List<Integer> getCount() {
		return count;
	}
	public void setCount(List<Integer> count) {
		this.count = count;
	}
	public List<Integer> getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(List<Integer> checkNum) {
		this.checkNum = checkNum;
	}
	public List<Integer> getConpiece() {
		return conpiece;
	}
	public void setConpiece(List<Integer> conpiece) {
		this.conpiece = conpiece;
	}
	public int getCountMax() {
		return countMax;
	}
	public void setCountMax(int countMax) {
		this.countMax = countMax;
	}

	
}
