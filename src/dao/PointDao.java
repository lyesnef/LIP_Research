package dao;

import java.util.ArrayList;
import java.util.List;

import Utility.SQLManager;
import bean.point.PointIncome;

public class PointDao extends SQLManager{

	public List<PointIncome> selectAllByNumber(int memberNumber) {
		
		List<PointIncome> pointIncomeList = new ArrayList<PointIncome>();
		
		try {
			pointIncomeList = (List<PointIncome>)getSqlMap().queryForList("selectPointAllByNum", memberNumber);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return pointIncomeList;
	}

}
