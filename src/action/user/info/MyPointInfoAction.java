package action.user.info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.etc.MemberLog;
import bean.member.LipMember;
import bean.member.Postcode;
import bean.point.PointIncome;
import bean.survey.PollParticipate;
import bean.survey.SurveyParticipate;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.InfoDao;
import dao.LogDao;
import dao.MemberLogDao;
import dao.PointDao;
import dao.PollParticipateDao;
import dao.SurveyParticipateDao;

public class MyPointInfoAction implements Action{
	
	private List<PointIncome> pointIncomeList;

	
	public List<PointIncome> getPointIncomeList() {
		return pointIncomeList;
	}


	public void setPointIncomeList(List<PointIncome> pointIncomeList) {
		this.pointIncomeList = pointIncomeList;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		// memberLogList = memberLogDao.selectByNumber(memberNumber);
		
		int memberNum = 0;
		memberNum = memberUpdate();
		System.out.println(memberNum);
		if (memberNum != 0) {
			PointDao pointDao = new PointDao();
			pointIncomeList = pointDao.selectAllByNumber(memberNum);
			for (PointIncome pointIncome : pointIncomeList) {
				System.out.println("detail " + pointIncome.getPointIncomeDetail() + " ");
				//System.out.print("detail" + pointIncome.getPointIncomeDate() + " ");
				System.out.println("incom " + pointIncome.getPointIncomePoint() + " ");
				System.out.println("outcom " + pointIncome.getPointOutcomePoint() + " ");
				System.out.println("list " + pointIncome.getPointIncomeList());
				System.out.println();
				System.out.println();
			}
		}

		
		return SUCCESS;
	}
	private int memberUpdate() {
		// TODO Auto-generated method stub
		Map<String, LipMember> session = ActionContext.getContext()
				.getSession();
		if (session.get("lipMember") != null) {
			return session.get("lipMember").getMemberNumber();
		}
		return 0;
	}

}
