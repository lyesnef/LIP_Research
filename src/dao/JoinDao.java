package dao;

import java.sql.SQLException;
import java.util.List;

import Utility.SQLManager;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;

public class JoinDao extends SQLManager{
	public List selectPostcode(String postcode_address) throws SQLException{
		return (List)this.getSqlMap().queryForList("getPostcode", postcode_address);
	}
	/*public int insertMember(LipMember member){
		try {
			return (Integer)this.getSqlMap().insert("insertMember", member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int updateRecommendPoint(String member_id){
		try {
			this.getSqlMap().update("updateRecommend", member_id);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public int selectRecommendNum(String member_id) {
		try {
			return (Integer)this.getSqlMap().queryForObject("selectRecommendNum", member_id);
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	public int joinPointIncome(PointIncome pi){
		try {
			this.getSqlMap().insert("joinPointIncome", pi);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	public int joinPointOutcome(pointOutcome po){
		try {
			this.getSqlMap().insert("joinPointOutcome", po);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}*/
	
	public int joinProcessAllRec(LipMember mem, String recommendId){
		try {
			this.getSqlMap().startTransaction();
			//멤버 인서트
			int memNum = -1;
			int recommendNum = -1;
			int adminNum = -1;
			memNum = (Integer)this.getSqlMap().insert("insertMember", mem);
			this.getSqlMap().update("updateRecommend", recommendId.trim());
			recommendNum = (Integer)this.getSqlMap().queryForObject("selectRecommendNum", recommendId.trim());
			adminNum = (Integer)this.getSqlMap().queryForObject("selectRecommendNum", "admin");
			PointIncome pi = new PointIncome();
			pointOutcome po = new pointOutcome();
			pi.setPointIncomePoint(1000);
			pi.setPointIncomeDetail("회원가입으로 클립을 받았습니다.");
			pi.setPointIncomeList("회원가입");
			pi.setMemberNumber(memNum);
			this.getSqlMap().insert("joinPointIncome", pi);
			po.setPointOutcomePoint(1000);
			po.setPointOutcomeDetail(mem.getMemberId() + "님의 회원가입으로 클립 지출.");
			po.setPointOutcomeList("회원가입");
			po.setMemberNumber(adminNum);
			this.getSqlMap().insert("joinPointOutcome", po);
			pi = new PointIncome();
			po = new pointOutcome();
			pi.setPointIncomePoint(1000);
			pi.setPointIncomeDetail(mem.getMemberId() + "님의 가입추천으로 클립을 받았습니다.");
			pi.setPointIncomeList("가입추천");
			pi.setMemberNumber(recommendNum);
			this.getSqlMap().insert("joinPointIncome", pi);
			po.setPointOutcomePoint(1000);
			po.setPointOutcomeDetail(recommendId.trim() + "님이 " + mem.getMemberId() + "님을 가입추천하여 클립을 지출.");
			po.setPointOutcomeList("가입추천");
			po.setMemberNumber(adminNum);
			this.getSqlMap().insert("joinPointOutcome", po);
			this.getSqlMap().commitTransaction();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				this.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
				return -1;
			}
			
		}
	}
	
	public int joinProcessAll(LipMember mem){
		try {
			this.getSqlMap().startTransaction();
			//멤버 인서트
			int memNum = -1;
			int recommendNum = -1;
			int adminNum = -1;
			memNum = (Integer)this.getSqlMap().insert("insertMember", mem);
			adminNum = (Integer)this.getSqlMap().queryForObject("selectRecommendNum", "admin");
			PointIncome pi = new PointIncome();
			pointOutcome po = new pointOutcome();
			pi.setPointIncomePoint(1000);
			pi.setPointIncomeDetail("회원가입으로 클립을 받았습니다.");
			pi.setPointIncomeList("회원가입");
			pi.setMemberNumber(memNum);
			this.getSqlMap().insert("joinPointIncome", pi);
			po.setPointOutcomePoint(1000);
			po.setPointOutcomeDetail(mem.getMemberId() + "님의 회원가입으로 클립을지출.");
			po.setPointOutcomeList("회원가입");
			po.setMemberNumber(adminNum);			
			this.getSqlMap().insert("joinPointOutcome", po);
			this.getSqlMap().commitTransaction();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				this.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
				return -1;
			}
			
		}
	}
}
