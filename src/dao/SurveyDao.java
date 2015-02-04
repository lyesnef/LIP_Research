package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Utility.SQLManager;
import bean.member.Age;
import bean.member.LipMember;
import bean.member.Region;
import bean.point.PointIncome;
import bean.point.SurveyPoint;
import bean.point.pointOutcome;
import bean.survey.AddConstraint;
import bean.survey.AllObject;
import bean.survey.Example;
import bean.survey.LimitParticipate;
import bean.survey.MailSendList;
import bean.survey.Multipoll;
import bean.survey.MultipollPollExample;
import bean.survey.PollExample;
import bean.survey.Question;
import bean.survey.QuestionExample;
import bean.survey.ResultSurvey;
import bean.survey.SetConstraint;
import bean.survey.Survey;
import bean.survey.SurveyConstraint;
import bean.survey.SurveyParticipate;

public class SurveyDao extends SQLManager{
	private int limitKey = 0;
	private int surveyNumber = 0;
	private int pollNumber = 0;
	private int exampleNumber = 0;
	private int pollViewNumber = 0;
	private int multiPollNumber = 0;
	private int questionNumber = 0;
	// 관리자 : 전체 서베이 리스트 (회원으로 검색)
	public List<Survey> selectAllByNumber(String memberId)
	{
		List<Survey> surveyList = new ArrayList<Survey>();
		
		try {
			
			surveyList = (List<Survey>)getSqlMap().queryForList("selectSurveyAllById", memberId);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return surveyList;
	}
	
	// 관리자 : 전체 서베이 리스트 (서베이상태로 검사)
	public List<Survey> selectSurveyAllByCondition(int param)
	{
		List<Survey> surveyList = new ArrayList<Survey>();
		
		try {
			
			surveyList = (List<Survey>)getSqlMap().queryForList("selectSurveyAllByCondition", param);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return surveyList;
	}
	
	// key 값으로 서베이 객체 가져오기
	public Survey selectSurveyAllByNum(int surveyNum)
	{
		Survey survey = new Survey();
		
		try {
			survey = (Survey) getSqlMap().queryForObject("selectSurveyAllByNum", surveyNum);
			
		} catch (Exception e) {
			return null;
		}
		
		return survey;
	}
	
	//생성
	public List<Age> selectAgeAll() throws SQLException{
		return (ArrayList<Age>)this.getSqlMap().queryForList("selectAgeAllSurvey");
	}
	public List<Region> selectRegionAll() throws SQLException{
		return (ArrayList<Region>)this.getSqlMap().queryForList("selectRegionAllSurvey");
	}
	
	// 권역가져오기
	public List<SurveyConstraint> selectSurveyConstraintbyNum(int surveyNum) throws SQLException{
		
		return (ArrayList<SurveyConstraint>)this.getSqlMap().queryForList("selectSurveyConstraintbyNum", surveyNum);
	}
	
	public List<Integer> getLimitNum(Map<String, Integer> map) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("getLimitNum", map);
	}
	
	// 서베이 카운트 확인하기
	public LimitParticipate getLimitCount(int limitNum)
	{
		LimitParticipate limit = new LimitParticipate();
		
		try {
			limit = (LimitParticipate) getSqlMap().queryForObject("getLimitCount", limitNum);
			
		} catch (Exception e) {
			return limit;
		}
		
		return limit;
	}
	
	// 문제가져오기
	public List<Question> selectQuestionNum(int surveyNum) throws SQLException{
		
		return (ArrayList<Question>)this.getSqlMap().queryForList("selectQuestionNum", surveyNum);
	}
	
	// 참가 결과 인서트
	public void insertSurveyParticipate(SurveyParticipate surveyParticipate) throws SQLException {
			getSqlMap().insert("insertSurveyParticipate", surveyParticipate);
		}
	
	// 리미트카운트 1증가 시키기
	public void updateLimitCount(int limitNum) throws SQLException {
		getSqlMap().update("updateLimitCount", limitNum);
	}
	
	// 포인트 입고 계좌에 인서트+자기정보수정
	public void surveyRegIncomeProcess(PointIncome pi) throws SQLException{
		Map< String, Integer> map	=	new HashMap<String, Integer>();
		map.put("point", pi.getPointIncomePoint());
		map.put("memberNumber", pi.getMemberNumber());
		
		this.getSqlMap().insert("PollRegPointIncome", pi);
		this.getSqlMap().update("modifyMemberPoint", map);
	}
	
	// 포인트 출고 계좌에 인서트 + 자기정보수정
	public void surveyRegOutcomeProcess(pointOutcome po) throws SQLException	{
		Map< String, Integer> map	=	new HashMap<String, Integer>();
		map.put("point", po.getPointOutcomePoint()*-1);
		map.put("memberNumber", po.getMemberNumber());
		
		this.getSqlMap().insert("PollRegPointOutcome", po);
		this.getSqlMap().update("modifyMemberPoint", map);
	}
	
	public void surveyPointProcess(SurveyPoint surveyPoint) throws SQLException	{
		Map< String, Integer> map	=	new HashMap<String, Integer>();
		map.put("point", surveyPoint.getSurveyPointPoint());
		map.put("surveyNumber", surveyPoint.getSurveyNumber());
		
		this.getSqlMap().insert("insertSurveyPoint", surveyPoint);
		this.getSqlMap().update("updateSurveyPoint", map);
	}
	// 서베이 상태 종료시키기
	public void updateSurveyCondition(Map<String, Integer> map) throws SQLException {
		getSqlMap().update("updateSurveyCondition", map);
	}
	
	public List<Survey> selectOngoingSurvey() throws SQLException{
		return this.getSqlMap().queryForList("selectOngoingSurvey");
	}

	public Survey selectSurveyByNumber(int surveyNumber) throws SQLException {
		// TODO Auto-generated method stub
		return (Survey) this.getSqlMap().queryForObject("selectSurveyByNumber", surveyNumber);
	}
	
	public List<String> getSetConstraintName(int conNum) throws SQLException{
		return this.getSqlMap().queryForList("getSetConstraintName", conNum);
	}
	
	public List<Example> getResultList(Map<String, Integer> map) throws SQLException{
		return this.getSqlMap().queryForList("getResultList", map);
	}
	
	public int getSelectConsNum(String conNum) throws SQLException{
		return (Integer) this.getSqlMap().queryForObject("getSelectConsNum", conNum);
	}
	
	public List<String> getBasicSetConName(Map<String, Integer> map) throws SQLException{
		return this.getSqlMap().queryForList("getBasicSetConName", map);
	}
	
	public List<Example> getResultListGender(int surveyNum) throws SQLException{
		return this.getSqlMap().queryForList("getResultListGender", surveyNum);
	}
	
	public List<Example> getResultListAge(int surveyNum) throws SQLException{
		return this.getSqlMap().queryForList("getResultListAge", surveyNum);
	}
	
	public List<Example> getResultListPost(int surveyNum) throws SQLException{
		return this.getSqlMap().queryForList("getResultListPost", surveyNum);
	}
	
	public List<SetConstraint> selectSetConbyName(String consName) throws SQLException{
		return this.getSqlMap().queryForList("selectSetConbyName", consName);
	}
	
	public boolean checkMailList(int surveyNumber, int memberNumber) throws SQLException{
		MailSendList msl	=	new MailSendList();
		msl.setMemberNumber(memberNumber);
		msl.setSurveyNumber(surveyNumber);
		
		int count	=	(Integer) this.getSqlMap().queryForObject("checkMailList", msl);
		
		return count==0 ? false : true;//참가 목록에 없으면 false 있으면 true;
	}
	
	public List<ResultSurvey> downSurveyResutl(int surveyNum) throws SQLException{
		return this.getSqlMap().queryForList("downSurveyResutl", surveyNum);
	}
	
	public List<Integer> selectMailListPre(int surveyNum) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMailListPre", surveyNum);
	}
	
	public List<Integer> selectMailGendePre(int genderNum) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMailGendePre", genderNum);
	}
	
	public List<Integer> selectMailGendeAll() throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMailGendeAll");
	}
	
	public List<Integer> selectMailAgePre(int ageNum) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMailAgePre", ageNum);
	}
	
	public List<Integer> selectMailLocatePre(int locate) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMailLocatePre", locate);
	}
	
	public int getOneLimitNum(int survey) throws SQLException{
		return (Integer) this.getSqlMap().queryForObject("getOneLimitNum", survey);
	}
	
	public int deletePaticipate(Map<String, Integer> map) throws SQLException{
		return (Integer) this.getSqlMap().delete("deletePaticipate", map);
	}
	
	public List<Integer> selectMultiPoll(int suveyNum) throws SQLException{
		
		return (ArrayList<Integer>)this.getSqlMap().queryForList("selectMultiPoll", suveyNum);
	}
	
	public void updateMultiPollCondition(int pollNum) throws SQLException {
		getSqlMap().update("updateMultiPollCondition", pollNum);
	}
	
	//서베이 생성
		public int surveyCreateByObject(Survey sur, Multipoll mp, AddConstraint ac, SurveyPoint sp, LipMember mem){
			try {
				//트랜잭션 시작
				this.getSqlMap().startTransaction();
				
				Multipoll mptemp;
				//서베이번호
				surveyNumber = (Integer) this.getSqlMap().insert("insertSurveyCreateBySuvey", sur);
				
				//권역설정
				//기본&추가권역이 없는 경우
				int limitParticipateNumber = 0;
				if(ac.getLimitParticipateList() != null){
					for(int i=0; i<ac.getLimitParticipateList().size(); i++){
						//참가제한테이블 만들기
						limitParticipateNumber = (Integer)this.getSqlMap().insert("insertLimitParticipateByNum",ac.getLimitParticipateList().get(i));
						if(limitParticipateNumber !=0){
							//서베이 권역 추가
							ac.setLimitParticipateNumber(limitParticipateNumber);
							ac.setSurveyNumber(surveyNumber);
							this.getSqlMap().insert("insertAddConstraintByNumber", ac);
						}
					}
				}
				
				//복합폴 생성
				if(mp != null && surveyNumber != 0){
					for(int i=0; i<mp.getPollList().size();i++){
						//폴번호
						pollNumber = (Integer) this.getSqlMap().insert("RegPoll", mp.getPollList().get(i));
						for(int j = 0; j<mp.getPollList().get(i).getExampleList().size();j++){
							//보기번호
							exampleNumber = (Integer) this.getSqlMap().insert("insertExample", mp.getPollList().get(i).getExampleList().get(j));
							PollExample pe = new PollExample();
							if(exampleNumber != 0){
								pe.setExampleNumber(exampleNumber);
								pe.setPollNumber(pollNumber);
								//폴보기번호
								pollViewNumber = (Integer) this.getSqlMap().insert("insertPollViewByNumber", pe);	
								
								
								
							}
							if(mp.getPollList().get(i).getExampleList().get(j).getTotalValue() != 0){
								System.out.println("선택답 : " + mp.getPollList().get(i).getExampleList().get(j).getTotalValue());
								if(pollViewNumber != 0){
									mptemp = new Multipoll();
									mptemp.setPollExampleNumber(pollViewNumber);
									mptemp.setPollNumber(pollNumber);
									mptemp.setSurveyNumber(surveyNumber);
									//복합폴번호
									multiPollNumber = (Integer) this.getSqlMap().insert("insertMultipollByNumber", mptemp);
								}
								
								if(multiPollNumber != 0){
									//멀티폴 권역 셋팅
									MultipollPollExample mpe = new MultipollPollExample();
									mpe.setMultipollNumber(multiPollNumber);
									mpe.setPollExampleNumber(pollViewNumber);
									System.out.println("보기 답 : " + exampleNumber  + ", 멀티폴번호 : " + multiPollNumber);
									this.getSqlMap().insert("insertMultipollPollExampleByNumber", mpe);
								}
							}
							exampleNumber = 0;
							pollViewNumber = 0;
						}					
					}
				}
				//문제 생성
				if(sur.getQuestionList() != null){
					for(int i=0; i<sur.getQuestionList().size(); i++){
						if(surveyNumber !=0){
							sur.getQuestionList().get(i).setSurveyNumber(surveyNumber);
							questionNumber = (Integer)this.getSqlMap().insert("insertQuestionByNumber", sur.getQuestionList().get(i));
							if(questionNumber != 0){
								for(int j=0; j<sur.getQuestionList().get(i).getExampleList().size();j++){
									exampleNumber = (Integer) this.getSqlMap().insert("insertExample", sur.getQuestionList().get(i).getExampleList().get(j));
									QuestionExample qe = new QuestionExample();
									if(exampleNumber != 0){
										qe.setExampleNumber(exampleNumber);
										qe.setQuestionNumber(questionNumber);
										this.getSqlMap().insert("insertQuestionViewByNumber", qe);
									}
								}
							}
						}
						exampleNumber = 0;
					}
					
				}
				
				//포인트 관리
				if(surveyNumber != 0){
					sp.setSurveyNumber(surveyNumber);
					this.getSqlMap().insert("insertSurveyPointByNumber", sp);
				}
				//포인트 인컴
				PointIncome pi = new PointIncome();
				//서베이 번호를 받아야 함 && 서베이 입력 완료 후 멤버 포인트 차감
				//전부 포인트 입고 테이블에 입력 -> 관리자
				pi.setMemberNumber(1);
				pi.setPointIncomePoint(sur.getSurveyPoint()*2);
				pi.setPointIncomeDetail(mem.getMemberId() + "님이 "+ surveyNumber +"번 서베이를 만드셨습니다.");
				pi.setPointIncomeList("서베이생성");
				surveyRegIncomeProcess(pi);
				
				//포인트 아웃컴
				pointOutcome po = new pointOutcome();
				//전부 포인트 출고 테이블에 입력 -> 회원
				po.setPointOutcomePoint(sur.getSurveyPoint()*2);
				po.setPointOutcomeDetail(surveyNumber + "번 서베이를 만드셨습니다.");
				po.setPointOutcomeList("서베이생성");
				po.setMemberNumber(mem.getMemberNumber());
				surveyRegOutcomeProcess(po);
				
				//트랜잭션 커밋
				this.getSqlMap().commitTransaction();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			} finally {
				try {
					//트랜잭션 종료
					this.getSqlMap().endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
					return 0;
				}
			}
		}
		
		//서베이 생성
		public int surveyCreateByAddCons(Survey sur, Multipoll mp, List<SurveyConstraint> listSc, SurveyPoint sp, LipMember mem){
			try {
				//트랜잭션 시작
				this.getSqlMap().startTransaction();
				/*//서베이 생성
				int surveyNumber = 0;
				int pollNumber = 0;
				int exampleNumber = 0;
				int pollViewNumber = 0;
				int multiPollNumber = 0;
				int questionNumber = 0;*/
				Multipoll mptemp;
				//서베이번호
				surveyNumber = (Integer) this.getSqlMap().insert("insertSurveyCreateBySuvey", sur);
				
				//권역설정
				//기본권역이 없는 경우
				int surveyConsKey = 0;
				int setConsKey = 0;
				int limitParticipateKey = 0;
				for(int i=0; i<listSc.size(); i++){
					surveyConsKey = (Integer) this.getSqlMap().insert("insertSurveyConstraintName", listSc.get(i));
					if(surveyConsKey != 0){
						for(int j=0; j<listSc.get(i).getSetConstraintList().size();j++){
							System.out.println(listSc.get(i).getSetConstraintList().get(j).getConstraintName());
							listSc.get(i).getSetConstraintList().get(j).setConstraintNumber(surveyConsKey);
							System.out.println(listSc.get(i).getSetConstraintList().get(j).getConstraintName());
							setConsKey = (Integer) this.getSqlMap().insert("insertSetConstraintName", listSc.get(i).getSetConstraintList().get(j));
							limitParticipateKey = (Integer) this.getSqlMap().insert("insertLimitParticipateNumber", listSc.get(i).getLimitParticipateList().get(j));
							AddConstraint acVal = new AddConstraint();
							acVal.setSetConstraintNum(setConsKey);
							acVal.setSurveyNumber(surveyNumber);
							acVal.setLimitParticipateNumber(limitParticipateKey);
							this.getSqlMap().insert("insertAddConstraintObject", acVal);
						}
					}
				}
				
				//복합폴 생성
				if(mp != null && surveyNumber != 0){
					for(int i=0; i<mp.getPollList().size();i++){
						//폴번호
						pollNumber = (Integer) this.getSqlMap().insert("RegPoll", mp.getPollList().get(i));
						for(int j = 0; j<mp.getPollList().get(i).getExampleList().size();j++){
							//보기번호
							exampleNumber = (Integer) this.getSqlMap().insert("insertExample", mp.getPollList().get(i).getExampleList().get(j));
							PollExample pe = new PollExample();
							if(exampleNumber != 0){
								pe.setExampleNumber(exampleNumber);
								pe.setPollNumber(pollNumber);
								//폴보기번호
								pollViewNumber = (Integer) this.getSqlMap().insert("insertPollViewByNumber", pe);	
								
								
								
							}
							if(mp.getPollList().get(i).getExampleList().get(j).getTotalValue() != 0){
								System.out.println("선택답 : " + mp.getPollList().get(i).getExampleList().get(j).getTotalValue());
								
								if(pollViewNumber != 0){
									mptemp = new Multipoll();
									mptemp.setPollExampleNumber(pollViewNumber);
									mptemp.setPollNumber(pollNumber);
									mptemp.setSurveyNumber(surveyNumber);
									//복합폴번호
									multiPollNumber = (Integer) this.getSqlMap().insert("insertMultipollByNumber", mptemp);
									
									
									//멀티폴 권역 셋팅
									MultipollPollExample mpe = new MultipollPollExample();
									mpe.setMultipollNumber(multiPollNumber);
									mpe.setPollExampleNumber(pollViewNumber);
									System.out.println("보기 답 : " + exampleNumber  + ", 멀티폴번호 : " + multiPollNumber);
									this.getSqlMap().insert("insertMultipollPollExampleByNumber", mpe);
								}
							}
							exampleNumber = 0;
							pollViewNumber = 0;
						}					
					}
				}
				//문제 생성
				if(sur.getQuestionList() != null){
					for(int i=0; i<sur.getQuestionList().size(); i++){
						if(surveyNumber !=0){
							sur.getQuestionList().get(i).setSurveyNumber(surveyNumber);
							questionNumber = (Integer)this.getSqlMap().insert("insertQuestionByNumber", sur.getQuestionList().get(i));
							if(questionNumber != 0){
								for(int j=0; j<sur.getQuestionList().get(i).getExampleList().size();j++){
									exampleNumber = (Integer) this.getSqlMap().insert("insertExample", sur.getQuestionList().get(i).getExampleList().get(j));
									QuestionExample qe = new QuestionExample();
									if(exampleNumber != 0){
										qe.setExampleNumber(exampleNumber);
										qe.setQuestionNumber(questionNumber);
										this.getSqlMap().insert("insertQuestionViewByNumber", qe);
									}
								}
							}
						}
						exampleNumber = 0;
					}
					
				}
				
				//포인트 관리
				if(surveyNumber != 0){
					sp.setSurveyNumber(surveyNumber);
					this.getSqlMap().insert("insertSurveyPointByNumber", sp);
				}
				//포인트 인컴
				PointIncome pi = new PointIncome();
				//서베이 번호를 받아야 함 && 서베이 입력 완료 후 멤버 포인트 차감
				//전부 포인트 입고 테이블에 입력 -> 관리자
				pi.setMemberNumber(1);
				pi.setPointIncomePoint(sur.getSurveyPoint()*2);
				pi.setPointIncomeDetail(mem.getMemberId() + "님이 "+ surveyNumber +"번 서베이를 만드셨습니다.");
				pi.setPointIncomeList("서베이생성");
				surveyRegIncomeProcess(pi);
				
				//포인트 아웃컴
				pointOutcome po = new pointOutcome();
				//전부 포인트 출고 테이블에 입력 -> 회원
				po.setPointOutcomePoint(sur.getSurveyPoint()*2);
				po.setPointOutcomeDetail(surveyNumber + "번 서베이를 만드셨습니다.");
				po.setPointOutcomeList("서베이생성");
				po.setMemberNumber(mem.getMemberNumber());
				surveyRegOutcomeProcess(po);
				
				//트랜잭션 커밋
				this.getSqlMap().commitTransaction();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			} finally {
				try {
					//트랜잭션 종료
					this.getSqlMap().endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
					return 0;
				}
			}
		}
		
		//서베이 생성
		public int surveyCreateByAddConsByOb(Survey sur, Multipoll mp, List<SurveyConstraint> surveyConsList, SurveyPoint sp, LipMember mem){
			try {
				//트랜잭션 시작
				this.getSqlMap().startTransaction();
				/*//서베이 생성
				int surveyNumber = 0;
				int pollNumber = 0;
				int exampleNumber = 0;
				int pollViewNumber = 0;
				int multiPollNumber = 0;
				int questionNumber = 0;*/
				Multipoll mptemp;
				//서베이번호
				surveyNumber = (Integer) this.getSqlMap().insert("insertSurveyCreateBySuvey", sur);
				
				//권역과 추가권역이 있는 경우
				int surveyConsKey = 0;
				int exampleSetConsKey = 0;
				
				
				for(int i=0; i<surveyConsList.size();i++){
					surveyConsKey = (Integer) this.getSqlMap().insert("insertSurveyConstraintName", surveyConsList.get(i));
					if(surveyConsKey != 0){
						for(int j = 0; j<surveyConsList.get(i).getSetConstraintList().size(); j++){
							surveyConsList.get(i).getSetConstraintList().get(j).setConstraintNumber(surveyConsKey);
							exampleSetConsKey = (Integer) this.getSqlMap().insert("insertSetConstraintName", surveyConsList.get(i).getSetConstraintList().get(j));
							for(int k = 0; k<surveyConsList.get(i).getSetConstraintList().get(j).getAddConstraintList().size();k++){
								
								for(int l = 0; l < surveyConsList.get(i).getSetConstraintList().get(j).getAddConstraintList().get(k).size(); l++ ){
									
									if(l==0){		
										limitKey = (Integer) this.getSqlMap().insert("insertLimitParticipateNumber", surveyConsList.get(i).getSetConstraintList().get(j).getAddConstraintList().get(k).get(l).getLimitParticipateList().get(0));
										//셋팅되지 않은 값
										AddConstraint addConsNew = new AddConstraint();
										addConsNew.setSetConstraintNum(exampleSetConsKey);
										addConsNew.setSurveyNumber(surveyNumber);
										addConsNew.setLimitParticipateNumber(limitKey);
										this.getSqlMap().insert("insertAddConstraintObject", addConsNew);
									}else{
										AddConstraint addConsNew = new AddConstraint();
										addConsNew.setSetConstraintNum(surveyConsList.get(i).getSetConstraintList().get(j).getAddConstraintList().get(k).get(l).getSetConstraintNum());
										addConsNew.setSurveyNumber(surveyNumber);
										addConsNew.setLimitParticipateNumber(limitKey);
										this.getSqlMap().insert("insertAddConstraintObject", addConsNew);
									}
								}
								
							}
						}
					}
					surveyConsKey = 0;
				}
				
				
				
				//복합폴 생성
				
				if(mp != null && surveyNumber != 0){
					for(int i=0; i<mp.getPollList().size();i++){
						//폴번호
						pollNumber = (Integer) this.getSqlMap().insert("RegPoll", mp.getPollList().get(i));
						for(int j = 0; j<mp.getPollList().get(i).getExampleList().size();j++){
							//보기번호
							exampleNumber = (Integer) this.getSqlMap().insert("insertExample", mp.getPollList().get(i).getExampleList().get(j));
							PollExample pe = new PollExample();
							if(exampleNumber != 0){
								pe.setExampleNumber(exampleNumber);
								pe.setPollNumber(pollNumber);
								//폴보기번호
								pollViewNumber = (Integer) this.getSqlMap().insert("insertPollViewByNumber", pe);	
								
								
								
							}
							if(mp.getPollList().get(i).getExampleList().get(j).getTotalValue() != 0){
								System.out.println("선택답 : " + mp.getPollList().get(i).getExampleList().get(j).getTotalValue());
								
								if(pollViewNumber != 0){
									mptemp = new Multipoll();
									mptemp.setPollExampleNumber(pollViewNumber);
									mptemp.setPollNumber(pollNumber);
									mptemp.setSurveyNumber(surveyNumber);
									//복합폴번호
									multiPollNumber = (Integer) this.getSqlMap().insert("insertMultipollByNumber", mptemp);
									
									
									//멀티폴 권역 셋팅
									MultipollPollExample mpe = new MultipollPollExample();
									mpe.setMultipollNumber(multiPollNumber);
									mpe.setPollExampleNumber(pollViewNumber);
									System.out.println("보기 답 : " + exampleNumber  + ", 멀티폴번호 : " + multiPollNumber);
									this.getSqlMap().insert("insertMultipollPollExampleByNumber", mpe);
									
								}
							}
							exampleNumber = 0;
							pollViewNumber = 0;
						}					
					}
				}
				//문제 생성
				if(sur.getQuestionList() != null){
					for(int i=0; i<sur.getQuestionList().size(); i++){
						if(surveyNumber !=0){
							sur.getQuestionList().get(i).setSurveyNumber(surveyNumber);
							questionNumber = (Integer)this.getSqlMap().insert("insertQuestionByNumber", sur.getQuestionList().get(i));
							if(questionNumber != 0){
								for(int j=0; j<sur.getQuestionList().get(i).getExampleList().size();j++){
									exampleNumber = (Integer) this.getSqlMap().insert("insertExample", sur.getQuestionList().get(i).getExampleList().get(j));
									QuestionExample qe = new QuestionExample();
									if(exampleNumber != 0){
										qe.setExampleNumber(exampleNumber);
										qe.setQuestionNumber(questionNumber);
										this.getSqlMap().insert("insertQuestionViewByNumber", qe);
									}
								}
							}
						}
						exampleNumber = 0;
					}
					
				}
				
				//포인트 관리
				if(surveyNumber != 0){
					sp.setSurveyNumber(surveyNumber);
					this.getSqlMap().insert("insertSurveyPointByNumber", sp);
				}
				//포인트 인컴
				PointIncome pi = new PointIncome();
				//서베이 번호를 받아야 함 && 서베이 입력 완료 후 멤버 포인트 차감
				//전부 포인트 입고 테이블에 입력 -> 관리자
				pi.setMemberNumber(1);
				pi.setPointIncomePoint(sur.getSurveyPoint()*2);
				pi.setPointIncomeDetail(mem.getMemberId() + "님이 "+ surveyNumber +"번 서베이를 만드셨습니다.");
				pi.setPointIncomeList("서베이생성");
				surveyRegIncomeProcess(pi);
				
				//포인트 아웃컴
				pointOutcome po = new pointOutcome();
				//전부 포인트 출고 테이블에 입력 -> 회원
				po.setPointOutcomePoint(sur.getSurveyPoint()*2);
				po.setPointOutcomeDetail(surveyNumber + "번 서베이를 만드셨습니다.");
				po.setPointOutcomeList("서베이생성");
				po.setMemberNumber(mem.getMemberNumber());
				surveyRegOutcomeProcess(po);
				
				//트랜잭션 커밋
				this.getSqlMap().commitTransaction();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			} finally {
				try {
					//트랜잭션 종료
					this.getSqlMap().endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
					return 0;
				}
			}
		}
	
	
}