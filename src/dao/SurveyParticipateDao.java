package dao;

import java.util.ArrayList;
import java.util.List;

import Utility.SQLManager;
import bean.survey.SurveyParticipate;

public class SurveyParticipateDao extends SQLManager{
	
	// 관리자 : 회원별 참가 서베이 참가 내역 가져오기
	public List<SurveyParticipate> selectAllByNumber(int memberNumber)
	{
		List<SurveyParticipate> surveyParticipate = new ArrayList<SurveyParticipate>();
		
		try {
			
			surveyParticipate = (List<SurveyParticipate>)getSqlMap().queryForList("selectSurveyParticipateAllByNum", memberNumber);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return surveyParticipate;
	}
}
