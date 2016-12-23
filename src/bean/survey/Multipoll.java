package bean.survey;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.EventDao;
import dao.GetPollDao;


public class Multipoll {

	private int surveyNumber;
	private Map<Integer, List<Integer>> pollExampleNumberMap;//key = 폴번호, value=원하는 대답들
	private List<Poll> pollList;
	private int isParticipated;//이 복합폴에 참여했는지에 대한 값 1:참여 2:미참여
	private int pollNumber;
	private int pollExampleNumber;
	private int multipollNumber;
	
	public Multipoll(){}
	
	public Multipoll(int surveyNumber){
		this.surveyNumber	=	surveyNumber;
		
		EventDao ed	=	new EventDao();
		GetPollDao gpd	=	new GetPollDao();
		pollList	=	new ArrayList<Poll>();
		
		try {
			List<Integer> pollNumList	=	ed.getPollNumberInMultiPollBySurveyNumber(surveyNumber);
			//서베이 번호로 멀티폴에 해당하는 폴 번호들을 가져온다
			pollExampleNumberMap = new HashMap<Integer, List<Integer>>();
			for(Integer i : pollNumList){
				Poll poll	=	(Poll) gpd.selectPoll(i).get(0);//폴 번호를 가지고 폴을 가져온다
				pollList.add(poll);//폴을 리스트에 등록한다
			
				List<Integer> pollExampleNumberList	=	ed.getMultipollPollExampleNumberByPollNumber(i);
				//폴들의 권역 선정 보기들을 가져온다
				List<Integer> exampleNumberList	=	new ArrayList<Integer>(); 
				for(Integer j : pollExampleNumberList){
					exampleNumberList.add(j);
					//문제 번호와 권역 선정 보기를 맵핑한다
				}
				pollExampleNumberMap.put(i, exampleNumberList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
	public int getMultipollNumber() {
		return multipollNumber;
	}

	public void setMultipollNumber(int multipollNumber) {
		this.multipollNumber = multipollNumber;
	}

	public int getPollNumber() {
		return pollNumber;
	}

	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}

	public int getPollExampleNumber() {
		return pollExampleNumber;
	}

	public void setPollExampleNumber(int pollExampleNumber) {
		this.pollExampleNumber = pollExampleNumber;
	}

	public int getSurveyNumber() {
		return surveyNumber;
	}

	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}

	

	public Map<Integer, List<Integer>> getPollExampleNumberMap() {
		return pollExampleNumberMap;
	}

	public void setPollExampleNumberMap(
			Map<Integer, List<Integer>> pollExampleNumberMap) {
		this.pollExampleNumberMap = pollExampleNumberMap;
	}

	public List<Poll> getPollList() {
		return pollList;
	}

	public void setPollList(List<Poll> pollList) {
		this.pollList = pollList;
	}

	public int getIsParticipated() {
		return isParticipated;
	}

	public void setIsParticipated(int isParticipated) {
		this.isParticipated = isParticipated;
	}


	
	
}
