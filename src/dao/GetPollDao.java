package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import Utility.SQLManager;
import bean.member.ResultExcel;
import bean.survey.Poll;
import bean.survey.PollParticipate;

public class GetPollDao extends SQLManager{
	
		 
		public List<Poll> selectAllPoll(int start, int end) throws SQLException{
			HashMap<String, Integer> params = new HashMap(); 
			params.put("start", start); 
			params.put("end", end);
			return (List<Poll>) getSqlMap().queryForList("selectAllPoll", params);
		}
		public void insertPollParticipate(PollParticipate pollParticipate) throws SQLException {
		   System.out.println(pollParticipate.getPollNumber());
			getSqlMap().insert("insertPollParticipate", pollParticipate);
		}
		public List<Integer> getparticipatedPollList(int memberNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (List<Integer>) getSqlMap().queryForList("selectparticipatedPollList", memberNumber);
		}
		public List<Poll> selectPollConditionOne(int condition) throws SQLException {
			// TODO Auto-generated method stub
			return (List<Poll>) getSqlMap().queryForList("selectPollConditionOne", condition);
		}
		public List<Poll> selectPoll(int pollNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (List<Poll>) getSqlMap().queryForList("selectPoll", pollNumber);
		}
		public List<Poll> selectPollbyMemberNum(int memberNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (List<Poll>) getSqlMap().queryForList("selectPollbyMemberNum", memberNumber);
		}
		public void updatePollCondition(int pollNumber, int result) throws SQLException {
			// TODO Auto-generated method stub
			HashMap<String, Integer> params = new HashMap(); 
			params.put("pollNumber", pollNumber); 
			params.put("result", result);
			getSqlMap().update("updatePollCondition", params);
		}
		public void updatePollPoint(int pollNumber) throws SQLException {
			// TODO Auto-generated method stub
			getSqlMap().update("updatePonllPoint", pollNumber);
		}
		public void updateMemberPoint(int memberNumber, int point) throws SQLException {
			// TODO Auto-generated method stub
			HashMap<String, Integer> params = new HashMap(); 
			params.put("memberNumber", memberNumber); 
			params.put("point", point);
			getSqlMap().update("updateMemberPoint", params);
		}
		public void insertPollPoint_info(int pollNumber, int memberNumber, int point) throws SQLException {
			// TODO Auto-generated method stub
			HashMap<String, Integer> params = new HashMap(); 
			params.put("pollNumber", pollNumber); 
			params.put("memberNumber", memberNumber);
			params.put("point", point);
			getSqlMap().insert("insertPollPoint_info", params);
			
		}
		public void updatePollConditionEnd() throws SQLException {
			// TODO Auto-generated method stub
			getSqlMap().update("updatePollConditionEnd");
		}
		public List<Poll> selectFinishedPoll() throws SQLException {
			// TODO Auto-generated method stub
			return (List<Poll>) getSqlMap().queryForList("selectFinishedPoll");
		}
		public List<Poll> selectIndexPolls() throws SQLException {
			// TODO Auto-generated method stub
			return (List<Poll>) getSqlMap().queryForList("selectIndexPolls",0 ,5);
		}
		public List<ResultExcel> selectResultExcel(int pollNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (List<ResultExcel>) getSqlMap().queryForList("selectResultExcel", pollNumber);
		}
		public String getPollQuestion(int pollNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (String) getSqlMap().queryForObject("selectPollQuestion", pollNumber);
		}
		public int selectMemberPoint(int memberNumber) throws SQLException {
			// TODO Auto-generated method stub
			return (Integer)getSqlMap().queryForObject("selectMemberPoint", memberNumber);
		}
	}
