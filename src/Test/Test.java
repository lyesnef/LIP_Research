package Test;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import bean.point.PointIncome;
import bean.survey.Example;
import bean.survey.Poll;
import dao.GetPollDao;
import dao.MailSendListDao;
import dao.PollDao;

public class Test {
	public static void main(String[] args) throws SQLException {

		GetPollDao gpd = new GetPollDao();
		MailSendListDao mailSendDoa = new MailSendListDao();

//		gpd.insertPollPoint_info(20, 32, 1);
		//		
//		PollDao pb = new PollDao();
//		PointIncome pi = new PointIncome();
//		pi.setMemberNumber(32);
//		pi.setPointIncomePoint(1);
//		pi.setPointIncomeDetail("Poll participated");
//		pi.setPointIncomeList("?");
//		pb.pollRegIncomeProcess(pi);
		
//		gpd.updatePollPoint(20);
//		
//		gpd.updateMemberPoint(2);
		
//		List<Integer> enterList = gpd.getparticipatedPollList(2);
//	
//		for (Integer integer : enterList) {
//			System.out.println(integer);
//		}
//		
//		PollDao pb = new PollDao();
//		PointIncome pi = new PointIncome();
//		pi.setMemberNumber(2);
//		pi.setPointIncomePoint(1);
//
//		pb.pollRegIncomeProcess(pi);
//		String dir = System.getProperty("user.dir");
//		System.out.println(dir+"\\upload\\");
//
//		//폴전체 검사
		List<Poll> polls = gpd.selectIndexPolls();
		
		System.out.println(polls.isEmpty());
		for (Poll poll : polls) {
			System.out.println(poll.getPollNumber());
		}
//		List<Poll> polls = gpd.selectPollConditionOne();
//		List<Poll> polls = gpd.selectPoll(41);
		
	
//		System.out.println("폴 번호" + poll.getMemberId());
//		System.out.println("카테보리 이름 " + poll.getCategoryName());
//		for (Poll poll : polls) {
//		
//			System.out.println("폴 번호" + poll.getPollNumber());
//			System.out.println("폴 번호" + poll.getMemberId());
//			System.out.println("카테보리 이름 " + poll.getCategoryName());
//			List<Example> examples = poll.getExampleList();
//			for (Example example : examples) {
//				System.out.println(example.getExampleContant());
//			}
//
//			
//		}
//		
		
//		//인설드 회원번호 2 폴넘버 28 결과 1, 3, 4 
//
//		PollParticipate pp = new PollParticipate();
//		List<Integer> result = new ArrayList<Integer>();
//		result.add(1);
//		result.add(3);
//		result.add(4);
//		
//		pp.setMemberNumber(2);
//		pp.setPollNumber(28);
//		pp.setResults(result);
//		pp.setPollExampleNumber(1);
//		System.out.println(pp.getPollExampleNumber());
//		System.out.println(pp.getPollNumber());
//		System.out.println("맴버넘버 " + pp.getMemberNumber());
//		
//		gpd.insertPollParticipate(pp);
//		
		
	}
	}
