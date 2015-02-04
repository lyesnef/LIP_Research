package action.survey;



import java.util.HashMap;
import java.util.Map;

import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.SurveyPoint;
import bean.point.pointOutcome;
import bean.survey.LimitParticipate;
import bean.survey.Survey;
import bean.survey.SurveyParticipate;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.LogDao;
import dao.SurveyDao;

public class RegSurveyAction implements Action{

	String result;
	int surveyNum;			//서베이번호
	int limitNum;			// 참가제한 번호
	int memberNum;			//회원번호
	int piece1;				// 문제수
	String message;			// 전할말
	
	@Override
	public String execute() throws Exception {
		System.out.println("result : "+result);
		System.out.println("survyeNum : "+surveyNum);
		System.out.println("limitNum : "+limitNum);
		
		System.out.println("member : "+memberNum);
		
		int point=0;			// 개인이 받을 포인트
		String insertValue[]=result.split("/");
		
		SurveyDao surveyDao = new SurveyDao(); 
		
		// 카운트 숫자 확인
		LimitParticipate limit = surveyDao.getLimitCount(limitNum);
		// 참가가능하면
		if(limit.getLimitParticipateLimit()>limit.getLimitParticipateCount())
		{
			// 카운트 1 증가시켜준다.
			surveyDao.updateLimitCount(limitNum);
		
			for(int i=0; i<insertValue.length;i++)
			{
				/*System.out.println(insertValue[i]);*/
				String insertValue2[]=insertValue[i].split(",");
				
				//insertValue2[1]==문제번호
				//insertValue2[2]==보기번호
				//insertValue2[3]==문제보기번호
				for(int j=1; j<insertValue2.length; j++)
				{
					System.out.print(insertValue2[j]);
					System.out.println();
				}
				
				// 객체를 만듬
				SurveyParticipate surveyParticipate = new SurveyParticipate();
				surveyParticipate.setSurveyNumber(surveyNum);
				surveyParticipate.setMemberNumber(memberNum);
				surveyParticipate.setQuestionNumber(Integer.parseInt(insertValue2[1]));
				surveyParticipate.setExampleNumber(Integer.parseInt(insertValue2[2]));
				surveyParticipate.setLimitParticipateNumber(limitNum);
				
				//인서트 시킨다.
				surveyDao.insertSurveyParticipate(surveyParticipate);
				
			}
			
			// 포인트 처리를 한다.
			System.out.println("포인트 처리를 한다.");
			point = piece1*100;		// 문제 * 100 포인트
			
			// 포인트 수입 회원->관리자
			PointIncome pi	=	new PointIncome();
			pi.setPointIncomePoint(point);
			pi.setPointIncomeDetail(memberNum+"님이"+surveyNum+"번 서베이에 참가했습니다.");
			pi.setPointIncomeList("서베이 참가");
			pi.setMemberNumber(memberNum);
			surveyDao.surveyRegIncomeProcess(pi);
			
			// 포인트 지출 관리자->회원
			pointOutcome po	=	new pointOutcome();
			po.setMemberNumber(1);
			po.setPointOutcomePoint(point);
			po.setPointOutcomeDetail(memberNum+"님이"+surveyNum+"번 서베이에 참가했습니다.");
			po.setPointOutcomeList("서베이 참가");
			surveyDao.surveyRegOutcomeProcess(po);
			
			// 서베이포인트 인서트 + 서베이포인트 칼럼 업데이트
			SurveyPoint surveyPoint = new SurveyPoint();
			surveyPoint.setMemberNumber(memberNum);
			surveyPoint.setSurveyPointPoint(point*-1);
			surveyPoint.setSurveyNumber(surveyNum);
			surveyDao.surveyPointProcess(surveyPoint);
			
			
			// 서베이포인트가 마지막이(포인트가 적으면)면 서베이상태를 종료로 업데이트 시켜준다.
			Survey survey = surveyDao.selectSurveyAllByNum(surveyNum);
			if(survey.getSurveyPoint() < point)
			{
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("condition", 3);
				map.put("surveyNumber", surveyNum);
				surveyDao.updateSurveyCondition(map);
			}
			
			// 세션 정보를 업데이트 해준다.
			Map<String, Object> session = ActionContext.getContext().getSession();	
			LogDao logDao = new LogDao();
			LipMember lipMember = logDao.selectByNumber(memberNum);
			session.put("lipMember", lipMember);
			message=lipMember.getMemberId()+" 님에게 "+ point + "개 를 지급하였습니다.";
			
			return SUCCESS;
		}
		else{
			message="죄송합니다! 설문이 마감되었습니다.";
			return INPUT;
		}
			
		
		
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getPiece1() {
		return piece1;
	}
	public void setPiece1(int piece1) {
		this.piece1 = piece1;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
