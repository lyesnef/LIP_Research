package action.poll.event;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import Utility.MailSender;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;
import bean.survey.MailSendList;
import bean.survey.PollParticipate;
import bean.survey.Survey;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.EventDao;
import dao.GetPollDao;
import dao.LogDao;
import dao.MailSendListDao;
import dao.PollDao;
import dao.SurveyDao;

public class EventPollRegAction implements Action {
	private int surveyNumber;
	Map<Integer, Integer> answer;//key=폴번호, value=사용자가 선택한 폴보기번호
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		GetPollDao gpd	=	new GetPollDao();
		EventDao ed	=	new EventDao();
		LogDao ld	=	new LogDao();
		SurveyDao sd	=	new SurveyDao();
		LipMember admin	=	ld.selectById("admin");
		boolean	flag	=	true;
		LipMember lm	=	(LipMember) ServletActionContext.getRequest().getSession().getAttribute("lipMember");
		Set<Integer> arr	=	answer.keySet();
		Survey	sur	=	sd.selectSurveyByNumber(surveyNumber);
		System.out.println("answer.size() = "+answer.size());
		for(Integer key : arr){
			System.out.println("key = "+key);
			System.out.println("answer.get(key) = "+answer.get(key));
			gpd.insertPollParticipate(new PollParticipate(lm.getMemberNumber(), key, answer.get(key)));
			//등록한 답변을 바탕으로 폴참여를 시킨다
			List<Integer> list	=	ed.getMultipollPollExampleNumberByPollNumber(key);
			//해당 폴 번호로 등록된 답변리스트를 가져온다
			for(Integer i : list){
				int x	=	i;
				int y	=	answer.get(key);
				//이유는 모르겠지만 바로 비교가 안되서 기본 타입으로 변경
				
				if(x!=y){
					//해당 폴에서 기대하는 답변과 하나라도 다를 경우 메일 발송 리스트에 추가하지 않는다 
					flag	=	false;
				}
			}
		}//일단 폴참여는 모두 시켜준다
		
		if(flag){
			//모든 답이 원하는 답변과 일치 했을 경우 이메일을 전송하고 메일 발송 리스트에 추가한다
			
			MailSender ms	=	new MailSender();
			String subject	=	"서베이 번호 "+sur.getSurveyNumber()+", "+sur.getSurveyTitle()+"에 참여해주세요.";
			String message	=	"서베이 번호 "+sur.getSurveyNumber()+", "+sur.getSurveyTitle()+"의 조사 대상에 해당되셨습니다. \n" +
					"아래의 링크를 클릭하시면 해당 화면으로 이동합니다.\n\n\n" +
					"http://http://203.233.196.183:8090/LIP_Research/OnGoingSurvey.action?memberNumber="+lm.getMemberNumber();
			
			ms.sendEmail(admin.getMemberEmail(), lm.getMemberEmail(), subject, message);
			
			ed.insertMailSendList(new MailSendList(lm.getMemberNumber(), sur.getSurveyNumber()));
		}
		PollDao pd	=	new PollDao();
		PointIncome pi	=	new PointIncome();
		pi.setMemberNumber(lm.getMemberNumber());
		pi.setPointIncomePoint(10);
		pi.setPointIncomeDetail("회원번호 "+lm.getMemberNumber()+"님이 서베이 번호 " +sur.getSurveyNumber()+"의 복합폴 참여하셨습니다.");
		pi.setPointIncomeList("복합폴 참여");
		pd.pollRegIncomeProcess(pi );
		
		
		pointOutcome po	=	new pointOutcome();
		po.setMemberNumber(1);
		po.setPointOutcomeDetail("회원번호 "+lm.getMemberNumber()+"님이 서베이 번호 " +sur.getSurveyNumber()+"의 복합폴 참여하셨습니다.");
		po.setPointOutcomeList("복합폴 참여");
		po.setPointOutcomePoint(10);
		pd.pollRegOutcomeProcess(po);
		
		Map<String, Object> session = ActionContext.getContext().getSession();	
		
		List<Integer> enterList = new ArrayList<Integer>();
		
		MailSendListDao mailSendDoa = new MailSendListDao();
		enterList=mailSendDoa.selectByMemberNum(lm.getMemberNumber());
		session.put("enterList", enterList);
		
		return SUCCESS;
	}
	
	public int getSurveyNumber() {
		return surveyNumber;
	}

	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}

	public Map<Integer, Integer> getAnswer() {
		return answer;
	}
	public void setAnswer(Map<Integer, Integer> answer) {
		this.answer = answer;
	}
	
	
}
