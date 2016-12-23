package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.member.Age;
import bean.member.Gender;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;
import bean.survey.Category;
import bean.survey.Example;
import bean.survey.Poll;
import bean.survey.PollComment;
import bean.survey.PollResult;

import Utility.SQLManager;

public class PollDao extends SQLManager {
	
	/*public boolean insertPoll(Poll poll){
		this.getSqlMap().insert("makePoll", poll);
	}*/
	
	public List getCategories() throws SQLException{
		return this.getSqlMap().queryForList("getCategory");
	}
	
	public int getLeftPoint(int member_number) throws SQLException{
		return (Integer)this.getSqlMap().queryForObject("getLeftPoint", member_number);
	}
	
	public int insertPoll(Poll poll) throws SQLException{
		return (Integer)this.getSqlMap().insert("RegPoll", poll);
	}
	
	public void insertExample(Example ex) throws SQLException{
		this.getSqlMap().insert("insertExample", ex);
	}
	
	public List<Integer> insertExamples(List<Example> list) throws SQLException{
		List<Integer> result	=	new ArrayList<Integer>();
		
	//	try{
	//	this.getSqlMap().startTransaction();
		this.getSqlMap().startBatch();
		
		
		for(Example ex : list){
			
			result.add((Integer)this.getSqlMap().insert("insertExample", ex ));
		}
		
		this.getSqlMap().executeBatch();
		/*this.getSqlMap().commitTransaction();
		}finally{
			this.getSqlMap().endTransaction();
		}*/
		return result;
	}
	
	public void mappingPollWithExample(int pollNumber, List<Integer> list) throws SQLException{

			//this.getSqlMap().startTransaction();
			this.getSqlMap().startBatch();
			
			Map<String, Integer> map;
			for(Integer exampleNumber : list){
				map	=	new HashMap<String, Integer>();
				map.put("pollNumber", pollNumber);
				map.put("exampleNumber", exampleNumber);
				
				this.getSqlMap().insert("mappingPollWithExample", map);
			}
			
			this.getSqlMap().executeBatch();
			//this.getSqlMap().commitTransaction();
			
	}
	
	public void pollRegIncomeProcess(PointIncome pi) throws SQLException{
		Map< String, Integer> map	=	new HashMap<String, Integer>();
		map.put("point", pi.getPointIncomePoint());
		map.put("memberNumber", 1);
		
		this.getSqlMap().insert("PollRegPointIncome", pi);
		this.getSqlMap().update("modifyMemberPoint", map);
	}
	
	public void pollRegOutcomeProcess(pointOutcome po) throws SQLException	{
		Map< String, Integer> map	=	new HashMap<String, Integer>();
		map.put("point", po.getPointOutcomePoint()*-1);
		map.put("memberNumber", po.getMemberNumber());
		
		this.getSqlMap().insert("PollRegPointOutcome", po);
		this.getSqlMap().update("modifyMemberPoint", map);
	}
	
	public PollResult getPollResult(int pollNumber) throws SQLException{
		PollResult	pr	=	(PollResult) this.getSqlMap().queryForObject("getPollResult", pollNumber);
		List<Age> al	=	this.getAgeList();
		List<Age> al2	=	new ArrayList<Age>();
		List<Gender> gl	=	this.getGenderList();
		List<Gender> gl2	=	new ArrayList<Gender>();
		for(Age a : al){
			Map map	=	new HashMap<String, Integer>();
			map.put("pollNumber", pr.getPollNumber());
			map.put("ageNumber", a.getAgeNumber());
			
			a.setAgeCounter(this.getAgeCounter(map));
			al2.add(a);
		}
		
		for(Gender g : gl){
			Map map	=	new HashMap<String, Integer>();
			map.put("pollNumber", pr.getPollNumber());
			map.put("genderNumber", g.getGenderNumber());
			
			g.setGenderCounter(this.getGenderCounter(map));
			gl2.add(g);
		}
		List<PollComment> pcl	=	this.getCommentList(pollNumber);
		List<PollComment> pcl2	=	new ArrayList<PollComment>();
		
		for(PollComment pc : pcl){
			pc.setMember(this.getMemberByNumber(pc.getMemberNumber()));
			pcl2.add(pc);
		}
		
		pr.setAgeList(al2);
		List<Example> el	=	this.getExampleList(pollNumber);
		List<Example> el2	=	new ArrayList<Example>();
		
		for(Example ex : el){
			Map map	=	new HashMap<String, Integer>();
			map.put("pollNumber", pr.getPollNumber());
			map.put("exampleNumber", ex.getExampleNumber());
			ex.setExampleCounter(this.getExampleCount(map));
			el2.add(ex);
		}
		
		pr.setExampleList(el2);
		pr.setGenderList(gl2);
		pr.setPollCommentList(pcl2);
		
		pr.setMember(this.getMemberByNumber(pr.getMemberNumber()));
		pr.setCategoryName(this.getCategoryByNumber(pr.getCategoryNumber()).getCategoryName());
		return pr;
	}
	
	public List<PollComment> getCommentList(int pollNumber) throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMap().queryForList("getCommentList", pollNumber);
	}

	public int getGenderCounter(Map map) throws SQLException{
		int result	=	(Integer) this.getSqlMap().queryForObject("getGenderCounter", map)==null?0:(Integer) this.getSqlMap().queryForObject("getGenderCounter", map);
		
		return result;
	}
	
	public int getAgeCounter(Map map) throws SQLException{
		int result	=	(Integer) this.getSqlMap().queryForObject("getAgeCounter", map)==null?0 :(Integer) this.getSqlMap().queryForObject("getAgeCounter", map);
		return result;
	}
	
	public List getExampleList(int pollNumber) throws SQLException{
		return (List)this.getSqlMap().queryForList("getExampleList", pollNumber);
	}
	
	public int getExampleCount(Map map) throws SQLException{
		int result	=	(Integer) this.getSqlMap().queryForObject("getExampleCount", map)==null?0:(Integer) this.getSqlMap().queryForObject("getExampleCount", map);
		return result;
	}
	
	public void insertPollComment(PollComment pc) throws SQLException{
		this.getSqlMap().insert("regPollMessage", pc);
	}
	
	public Category getCategoryByNumber(int categoryNumber) throws SQLException{
		return (Category) this.getSqlMap().queryForObject("getCategoryByNumber", categoryNumber);
	}
	
	public LipMember getMemberByNumber(int memberNumber) throws SQLException{
		return (LipMember) this.getSqlMap().queryForObject("selectLipMemberByNumber", memberNumber);
	}
	
	public List<Age> getAgeList() throws SQLException{
		return this.getSqlMap().queryForList("getAgeList");
	}
	
	public List<Gender> getGenderList() throws SQLException{
		return this.getSqlMap().queryForList("getGenderList");
	}
	
}
