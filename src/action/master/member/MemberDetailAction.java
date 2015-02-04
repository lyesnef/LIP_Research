package action.master.member;

import java.util.ArrayList;
import java.util.List;

import bean.etc.MemberLog;
import bean.member.LipMember;
import bean.member.Postcode;
import bean.point.PointIncome;
import bean.survey.PollParticipate;
import bean.survey.SurveyParticipate;

import com.opensymphony.xwork2.Action;

import dao.InfoDao;
import dao.LogDao;
import dao.MemberLogDao;
import dao.PointDao;
import dao.PollParticipateDao;
import dao.SurveyParticipateDao;

public class MemberDetailAction implements Action{

	int memberNumber;
	List<PointIncome> pointIncomeList = new ArrayList<PointIncome>();
	List<MemberLog> memberLogList = new ArrayList<MemberLog>();
	List<PollParticipate> pollParticipateList = new ArrayList<PollParticipate>();
	List<SurveyParticipate> surveyParticipateList = new ArrayList<SurveyParticipate>();
	LipMember lipMember = new LipMember();
	private Postcode pc;



	@Override
	public String execute() throws Exception {
		
		LogDao logDao = new LogDao();
		MemberLogDao memberLogDao = new MemberLogDao();
		PointDao pointDao = new PointDao();
		PollParticipateDao pollParticipateDao = new PollParticipateDao();
		SurveyParticipateDao surveyParticipateDao = new SurveyParticipateDao();
		InfoDao infodao = new InfoDao();
		
		
		// 기본정보
		lipMember = logDao.selectByNumber(memberNumber);
		
		// 우편번호 정보
		pc = new Postcode();
		pc = infodao.selectPostcodeByNum(lipMember.getPostcodeNumber());
		
		// 로그정보
		memberLogList = memberLogDao.selectByNumber(memberNumber);
		
		// 포인트 정보
		pointIncomeList = pointDao.selectAllByNumber(memberNumber);
		
		// 폴 참여 정보
		pollParticipateList = pollParticipateDao.selectAllByNumber(memberNumber);
		
		// 서베이 참여정보
		surveyParticipateList = surveyParticipateDao.selectAllByNumber(memberNumber);
		
		return SUCCESS;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	
	public List<PointIncome> getPointIncomeList() {
		return pointIncomeList;
	}

	public void setPointIncomeList(List<PointIncome> pointIncomeList) {
		this.pointIncomeList = pointIncomeList;
	}

	public List<MemberLog> getMemberLogList() {
		return memberLogList;
	}

	public void setMemberLogList(List<MemberLog> memberLogList) {
		this.memberLogList = memberLogList;
	}

	public List<PollParticipate> getPollParticipateList() {
		return pollParticipateList;
	}

	public void setPollParticipateList(List<PollParticipate> pollParticipateList) {
		this.pollParticipateList = pollParticipateList;
	}

	public List<SurveyParticipate> getSurveyParticipateList() {
		return surveyParticipateList;
	}

	public void setSurveyParticipateList(
			List<SurveyParticipate> surveyParticipateList) {
		this.surveyParticipateList = surveyParticipateList;
	}

	public LipMember getLipMember() {
		return lipMember;
	}

	public void setLipMember(LipMember lipMember) {
		this.lipMember = lipMember;
	}

	public Postcode getPc() {
		return pc;
	}

	public void setPc(Postcode pc) {
		this.pc = pc;
	}
	
}
