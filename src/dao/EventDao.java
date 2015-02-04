package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.survey.MailSendList;

import Utility.SQLManager;

public class EventDao extends SQLManager {
	public List<Integer> getPollNumberInMultiPollBySurveyNumber(int surveyNumber) throws SQLException{
		return this.getSqlMap().queryForList("getMultipollBySurveyNumber", surveyNumber);
	}
	
	public List<Integer> getMultipollPollExampleNumberByPollNumber(int pollNumber) throws SQLException{
		return  this.getSqlMap().queryForList("getMultipollPollExampleNumberByPollNumber", pollNumber);
	}

	public void insertMailSendList(MailSendList mailSendList) throws SQLException {
		// TODO Auto-generated method stub
		this.getSqlMap().insert("insertMailSendList", mailSendList);
	}
	
	public boolean getConditionNumber(int surveyNumber, String constraintName) throws SQLException{
		//해당 권역의 이름으로 검색했을 때 값이 있는가를 비교해서 없으면 false 있으면 true
		Map<String, Object> map	=	new HashMap<String, Object>();
		map.put("surveyNumber", surveyNumber);
		map.put("constraintName", constraintName);
		return ((Integer)this.getSqlMap().queryForObject("getConditionNumber", map)==0) ? false  :  true;
	}

	public boolean findMailList(int surveyNumber, int memberNumber) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Integer> map	=	new HashMap<String, Integer>();
		map.put("surveyNumber", surveyNumber);
		map.put("memberNumber", memberNumber);
		return (Integer)this.getSqlMap().queryForObject("findMailList", map)==0 ? false : true;
	}

	public List<String> getSetConstraint(int surveyNumber, String constraintName) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map	=	new HashMap<String, Object>();
		map.put("surveyNumber", surveyNumber);
		map.put("constraintName", constraintName);
		return this.getSqlMap().queryForList("getSetConstraint", map);
	}

	public String getMemberRegionOrAge(String str, int memberNumber) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map	=	new HashMap<String, Object>();
		map.put("str", str);
		map.put("memberNumber", memberNumber);
		String result	=	"";
		if(str.equals("지역")){
			result	=	(String) this.getSqlMap().queryForObject("getMemberRegionValue", map);
		}else if(str.equals("나이")){
			result	=	(String) this.getSqlMap().queryForObject("getMemberAgeValue", map);
		}
		return result;
	}
	
	public String getMemberGender(int memberNumber) throws SQLException{
		return (Integer) this.getSqlMap().queryForObject("getMemberGender", memberNumber)==1 ? "남".trim() : "여".trim();
	}
	
	public List<Integer> cehckBySurveyNumber(int surveyNum) throws SQLException{
		return (List<Integer>) this.getSqlMap().queryForList("cehckBySurveyNumber", surveyNum);
	}
	
}
