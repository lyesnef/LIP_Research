package action.poll.ongoing;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;
import bean.survey.Poll;
import bean.survey.PollParticipate;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.GetPollDao;
import dao.PollDao;



public class ParticipatePollAction implements Preparable, ModelDriven<PollParticipate>{
	
	private PollParticipate pollparticipate;

	
	public PollParticipate getPollparticipate() {
		return pollparticipate;
	}

	public void setPollparticipate(PollParticipate pollparticipate) {
		this.pollparticipate = pollparticipate;
	}

	public String execute() throws SQLException {
		GetPollDao gpd = new GetPollDao();
		
		
		
		pollparticipate.setMemberNumber(getMemberNumber());
		List<Integer> results = pollparticipate.getResult();
		System.out.println("회원 번호 " + getMemberNumber());
		System.out.println("폴넘버 " + pollparticipate.getPollNumber());
		System.out.println("결과 : " + pollparticipate.getResult());
		
		//트렌젝션
		
		//결과 입력
		for (Integer integer : results) {
			
			pollparticipate.setPollExampleNumber(integer);
			try {
				gpd.insertPollParticipate(pollparticipate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 포인트 삭삼
		if (pollparticipate.getPollBalancePoint() != 0) {
					
			gpd.updatePollPoint(pollparticipate.getPollNumber());
			gpd.updateMemberPoint(pollparticipate.getMemberNumber(), 1);

			//나머지 3개
			
			//회원 포인트 기록시키기
			PollDao pb = new PollDao();
			PointIncome pi = new PointIncome();
			pi.setMemberNumber(pollparticipate.getMemberNumber());
			pi.setPointIncomePoint(1);
			pi.setPointIncomeDetail(pollparticipate.getPollNumber() +  "번 폴에 참여 하셨습니다.");
			pi.setPointIncomeList("?");
			pb.pollRegIncomeProcess(pi);
			
			//폴 기록하기 
			gpd.insertPollPoint_info(pollparticipate.getPollNumber(), pollparticipate.getMemberNumber(), 1);
			
			
		}
		 
		
		
		
		//트렌젝션끝 
		System.out.println(pollparticipate.getPollBalancePoint());
		return "success";
	}
	
	private int getMemberNumber() {
		// TODO Auto-generated method stub
		Map<String, LipMember> session = ActionContext.getContext().getSession();
		
		if (session.get("lipMember") != null) {
			return session.get("lipMember").getMemberNumber();
		}
		return 0;
	}


	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		pollparticipate = new PollParticipate();
	}


	@Override
	public PollParticipate getModel() {
		// TODO Auto-generated method stub
		return pollparticipate;
	}

}



