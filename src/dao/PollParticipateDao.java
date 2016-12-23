package dao;

import java.util.ArrayList;
import java.util.List;

import bean.survey.PollParticipate;
import Utility.SQLManager;

public class PollParticipateDao extends SQLManager{
	
	// 관리자 : 회원별 참가 폴 내역 가져오기
	public List<PollParticipate> selectAllByNumber(int memberNumber)
	{
		List<PollParticipate> pollParticipateList = new ArrayList<PollParticipate>();
		
		try {
			
			pollParticipateList = (List<PollParticipate>)getSqlMap().queryForList("selectPollParticipateAllByNum", memberNumber);
			
		} catch (Exception e) {
			return null;
		}
		
		return pollParticipateList;
	}

}
