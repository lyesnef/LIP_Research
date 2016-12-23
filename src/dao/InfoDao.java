package dao;

import java.sql.SQLException;

import Utility.SQLManager;
import bean.member.LipMember;
import bean.member.Postcode;

public class InfoDao extends SQLManager{
	public Postcode selectPostcodeByNum(int postNum) throws SQLException{
		return (Postcode)this.getSqlMap().queryForObject("selectPostcodeByNum", postNum);
	}
	public LipMember updateInfoMemberByID(LipMember mem){
		try {
			this.getSqlMap().startTransaction();
			this.getSqlMap().update("updateInfoMemberById", mem);
			mem = (LipMember)this.getSqlMap().queryForObject("selectLipMemberById", mem.getMemberId());
			this.getSqlMap().commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				this.getSqlMap().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mem;
	}
	
	public void updateMemberImg(LipMember lm) throws SQLException{
		this.getSqlMap().update("updateMemberImg", lm);
	}
}
