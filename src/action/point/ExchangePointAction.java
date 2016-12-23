package action.point;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import Utility.RESTful.RestClient;

import action.point.Member;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.GetPollDao;
import dao.LogDao;
import dao.PollDao;

public class ExchangePointAction implements Preparable, ModelDriven<Member>,
		Action {
	private Member member;
	private String result;
	private int point;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;

	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		// http://localhost:8090/LIP_Research/rest/Member.action#
		int memberNumber = getMemberNumber();
		// 현재 보인트다 바꾸려는 포인트가 적으면 좋료시간다.
		GetPollDao gpd = new GetPollDao();
		int newPoint = gpd.selectMemberPoint(memberNumber);
		if (member.getPoint() > newPoint) {
			result = "잔여 보인트가 없습니다.";
			return SUCCESS;
		}

		System.out.println("dddddd");
		// 회원의 포인트가 존재하는지 채크한다.
		System.out.println(member.getId());
		System.out.println(member.getPwd());
		String p = Integer.toString(member.getPoint() / 100);
		// 다른 서버로 요청한다.
		RestClient rc = new RestClient("203.233.196.169", "8070",
				"/restful/Rest/" + p);
		HttpServletRequest request = ServletActionContext.getRequest();
		rc.addParam("id", member.getId());
		rc.addParam("pwd", member.getPwd());
		rc.addParam("point", p);
		rc.execute(Utility.RESTful.RestMethod.POST);
		// 회원번호를 받는다.
		result = rc.getResponse().trim();
		System.out.println("result: " + result);
		System.out.println("333");
		// 회원정보가 있을때

		if (result.equals("true") || result == "true") {
			// 회원넘버 가지고 오기

			// 포인트를 전송해서 바꾼다. 내 회원 의 포인트를 깍아준다. 한번 더 전송한다.
			// 회원 포인트 기록시키기

			System.out.println(member.getPoint());
			PollDao pb = new PollDao();
			pointOutcome po = new pointOutcome();
			po.setMemberNumber(memberNumber);

			po.setPointOutcomePoint(member.getPoint());
			po.setPointOutcomeDetail(member.getPoint() + "클립을  " + p
					+ "도토리로 전환 하셨습니다.");
			po.setPointOutcomeList("?");
			pb.pollRegOutcomeProcess(po);

			// 멤버의 포인트를 죽인다.

			// gpd.updateMemberPoint(memberNumber, 1);

			// 새션을 새로온 놈으로 넣어준다.
			memberUpdate();

			newPoint = gpd.selectMemberPoint(memberNumber);

			result = "포인트 전환이 완료 되었습니다.";
			return SUCCESS;

		}

		System.out.println("포인트 전환 실패");
		result = "포인트 등록에 실패 하였습니다.";
		return SUCCESS;

	}

	@Override
	public Member getModel() {
		// TODO Auto-generated method stub
		return member;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		member = new Member();
	}

	private int getMemberNumber() {
		// TODO Auto-generated method stub
		Map<String, LipMember> session = ActionContext.getContext()
				.getSession();
		return session.get("lipMember").getMemberNumber();

	}

	private void memberUpdate() {
		// TODO Auto-generated method stub
		Map<String, LipMember> session = ActionContext.getContext()
				.getSession();
		LogDao logDao = new LogDao();
		if (session.get("lipMember") != null) {
			session.put("lipMember",
					logDao.selectById(session.get("lipMember").getMemberId()));

		}

	}
}
