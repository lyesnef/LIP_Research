package dao;

import java.util.ArrayList;
import java.util.List;

import bean.etc.MemberLog;
import Utility.SQLManager;

public class MemberLogDao extends SQLManager{
	
	public int insertMemberLog(MemberLog memberLog)
	{
		try {
			getSqlMap().insert("insertMemberLog", memberLog);
			System.out.println("인서트 성공");
		
		} catch (Exception e) {
			System.out.println("인서트 실패");
			e.printStackTrace();
			return 0;
		}
		return 0;
	}


	// 회원별 로그 데이터 출력
	public List<MemberLog> selectByNumber(int memberNumber) {
		
		List<MemberLog> memberLogList = new ArrayList<MemberLog>();
		
		try {
			memberLogList = (List<MemberLog>)getSqlMap().queryForList("selectMemberLogAllByNum", memberNumber);
			
		} catch (Exception e) {
			e.printStackTrace();
			memberLogList = null;
		}
		return memberLogList;
	}
	

}
