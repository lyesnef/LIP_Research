package dao;

import java.util.ArrayList;
import java.util.List;

import Utility.SQLManager;
import bean.member.LipMember;

public class LogDao extends SQLManager{

	// 로그인 : 아이디로 멤버객체 한개 가져오기
	public LipMember selectById(String memberId)
	{
		LipMember lipmember = new LipMember();
		
		try {
			lipmember = (LipMember) getSqlMap().queryForObject("selectLipMemberById", memberId);
			
		} catch (Exception e) {
			return lipmember;
		}
		
		return lipmember;
	}
	
	public LipMember selectByNumber(int memberNumber) {
		LipMember lipmember = new LipMember();
		
		try {
			lipmember = (LipMember) getSqlMap().queryForObject("selectLipMemberByNumber", memberNumber);
		} catch (Exception e) {
			return lipmember;
		}
		
		return lipmember;
	}
	
	public List<LipMember> selectAllById(String memberId)
	{
		List<LipMember> lipmemberList = new ArrayList<LipMember>();
		
		try {
			
			lipmemberList = (List<LipMember>)getSqlMap().queryForList("selectLipMemberAllById", memberId);
			
		} catch (Exception e) {
			return lipmemberList;
		}
		
		return lipmemberList;
	}
	
	public List<LipMember> selectSendMailbySurvey(int surveyNum)
	{
		List<LipMember> lipmemberList = new ArrayList<LipMember>();
		
		try {
			
			lipmemberList = (List<LipMember>)getSqlMap().queryForList("selectSendMailbySurvey", surveyNum);
			
		} catch (Exception e) {
			return lipmemberList;
		}
		
		return lipmemberList;
	}
	
	public int selectNumById(String memberId){
		int cnt = 0;
		try {
			cnt = (Integer)this.getSqlMap().queryForObject("checkId", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int selectNumByEmail(String memberEmail){
		int cnt = 0;
		try{
			cnt = (Integer)this.getSqlMap().queryForObject("checkEmail", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public String selectAgeNum(int ageNum)
	{
		
		String ageName = null;
		try {
			ageName = (String) getSqlMap().queryForObject("selectAgeNum", ageNum);
			
		} catch (Exception e) {
			return ageName;
		}
		
		return ageName;
	}
	
	public String selectRegionName(int regionNum)
	{
		
		String regionName = null;
		try {
			regionName = (String) getSqlMap().queryForObject("selectRegionName", regionNum);
			
		} catch (Exception e) {
			return regionName;
		}
		
		return regionName;
	}
	
}