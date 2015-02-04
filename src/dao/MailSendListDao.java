package dao;

import java.util.ArrayList;
import java.util.List;


import Utility.SQLManager;

public class MailSendListDao extends SQLManager{
	
	
	// 참가한 폴 리스트
	public List<Integer> selectByMemberNum(int memberNum)
	{
		List<Integer> enterList = new ArrayList<Integer>();
		
		try {
			System.out.println("참가했니?");
			enterList = (List<Integer>)getSqlMap().queryForList("selectByMemberNum", memberNum);
			System.out.println("참가 리스트 : " +enterList.get(0));
			
		} catch (Exception e) {
			return enterList=null;
		}
		return enterList;
	}
}
