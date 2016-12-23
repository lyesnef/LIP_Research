package action.survey;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ParameterAware;

import Utility.ConvertDate;
import Utility.FileManager;
import Utility.FileUpload;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.SurveyPoint;
import bean.point.pointOutcome;
import bean.survey.AddConstraint;
import bean.survey.AllObject;
import bean.survey.ConstraintTemp;
import bean.survey.Example;
import bean.survey.LimitParticipate;
import bean.survey.Multipoll;
import bean.survey.Poll;
import bean.survey.Question;
import bean.survey.SetConstraint;
import bean.survey.Survey;
import bean.survey.SurveyConstraint;

import com.opensymphony.xwork2.Action;
import com.sun.swing.internal.plaf.basic.resources.basic;

import dao.SurveyDao;


public class PaySurveyAction implements Action, ParameterAware{

	private Map parameters;
	private String surveyTitle;							//서베이타이틀
	private int limitParticipateNumber;					//대상인원
	private int setLimitNumber;							//설정인원
	private int hiddenQueCnt;							//문제갯수
	private int addConstraintCnt;						//추가 권역 갯수
	private List<List<Integer>> addConstraintVal;		//추가 권역 설정 값(기본 권역 없는 경우)
	private List<List<List<Integer>>> addConstraintBasicVal;		//추가 권역 설정 값(기본 권역 없는 경우)
	private List<LimitParticipate> setLimitParticipate;	//참가제한
	private List<AddConstraint> surveyAddCons;			//서베이권역추가
	private String answer_path	=	"D://upload/example/";			//보기 경로 명
	private String question_path	=	"D://upload/question/";		//질문 경로 명 
	//이벤트폴
	private File question_img_file_poll[];
	private String question_img_file_pollFileName[];
	//서베이문제
	private File question_img_file_que[];
	private String question_img_file_queFileName[];
	//보기 리스트
	private File picAnswerFile[];
	private String picAnswerFileFileName[];
	//파일 카운트
	private int pollFileCnt = 0;
	private int queFileCnt = 0;
	private int exampleCnt = 0;
	
	private String message;
	
	public String getMessage() {
		return message;
	}

	@Override
	public void setParameters(Map parameters) {
		this.parameters = parameters;		
	}

	@Override
	public String execute() throws Exception {
		//Map is not Null
		//세션정보 가져오기
		HttpServletRequest request = ServletActionContext.getRequest();
		//멤버빈 선언
		LipMember lipMember = new LipMember();
		//세션 멤버 값
		ServletRequest re	=	ServletActionContext.getRequest();
		
		Map ex	=	re.getParameterMap();
		
		parameters = ex;
		
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		
		if(parameters != null  && parameters.size() != 0){
			System.out.println("여기들어옴");
			//서베이 생성------------------------------------------------------------
			//모든 객체 트랜젝션에서 받아가야 함
			//빈 선언
			Survey sv = new Survey();
			SurveyPoint sp = new SurveyPoint();
			Multipoll mp = new Multipoll();
			//포인트
			String[] paymentSurvey = (String[]) parameters.get("paymentTotal");
			int payment = Integer.parseInt(paymentSurvey[0]);
			//서베이 타이틀 1개
			String[] surveyTitle = (String[])parameters.get("surveyTitle");
			this.surveyTitle = surveyTitle[0];
			//서베이 시작 시간
			String[] startDate = (String[])parameters.get("start_date");
			String start_date = "";
			if(startDate != null){
				start_date = startDate[0];
			}
			//서베이 종료 시간
			String[] endDate = (String[])parameters.get("end_date");
			String end_date = "";
			if(endDate != null){
				end_date = endDate[0];
			}
			//카테고리
			String[] categoryTemp = (String[]) parameters.get("category");
			int category = 0;
			if(categoryTemp != null){
				category = Integer.parseInt(categoryTemp[0].trim());
			}
			//반은 서베이에 입력
			sv.setSurveyPoint(payment/2);
			sv.setSurveyTitle(this.surveyTitle);
			ConvertDate cd = new ConvertDate();
			Date startDateVal = cd.StringToUtilDate(start_date);
			Date endDateVal = cd.StringToUtilDate(end_date);
			sv.setSurveyStartDate(startDateVal);
			sv.setSurveyEndDate(endDateVal);
			sv.setMemberNumber(lipMember.getMemberNumber());
			sv.setCategoryNumber(category);
			//서베이 시작 전
			sv.setSurveyCondition(1);
			//------------------------------서베이 생성 완료----------------------------
			
			
			//서베이 인원설정-----------------------------------------------------------
			//대상인원
			String[] limitParticipateNumber = (String[])parameters.get("limitParticipateNumber");
			this.limitParticipateNumber = Integer.parseInt(limitParticipateNumber[0]);
			//설정인원
			String[] setLimitNumber = (String[])parameters.get("setLimitNumber");
			this.setLimitNumber = Integer.parseInt(setLimitNumber[0]);
			System.out.println("세팅 인원 : " + this.setLimitNumber);
			
			//문제갯수----------------------------------------------------------------
			String[] hiddenQueCnt = (String[])parameters.get("hiddenQueCnt");
			this.hiddenQueCnt = Integer.parseInt(hiddenQueCnt[0]);
			//------------------------------참가 제한 번호-----------------------------
			//기본 권역 & 추가 권역 인원 설정 묶기
			//기본 권역 값
			//리미트 인원 값
			String[] textBox = (String[])parameters.get("textBox");
			//리미트 키 값
			String[] hiddenBox = (String[])parameters.get("hiddenBox");
			//추가 권역 셋팅 갯수
			String[] addCons = (String[])parameters.get("addCons");
			
			LimitParticipate lp;
			AddConstraint acTemp;
			List<LimitParticipate> limitListP;
			List<AddConstraint> listAddConsTem = new ArrayList<AddConstraint>();
			//###########기본 권역 설정 안한 경우###########
			if(this.setLimitNumber == 0){
				//리미트 숫자 있는 경우
				if(this.limitParticipateNumber != 0){
					
					if(addCons == null){
						System.out.println("1번 경우");
						//1번 기본 권역 & 추가 권역이 없는 경우
						//참가 제한 테이블에 값을 넣고 뽑아준다.
						lp = new LimitParticipate();
						//참가 제한 번호 입력
						lp.setLimitParticipateLimit(this.limitParticipateNumber);
						//참가인원초기값 0으로 셋팅
						lp.setLimitParticipateCount(0);
						
						limitListP = new ArrayList<LimitParticipate>();
						limitListP.add(lp);
						//서베이 권역추가
						acTemp = new AddConstraint();
						acTemp.setLimitParticipateList(limitListP);
						
						//복합폴
						mp = multiPoll(lipMember);
						//서베이 문제
						sv.setQuestionList(questionAll());
						
						//서베이에 입력한 포인트를 서베이 포인트 페이지에 입력 -> 회원번호
						sp.setMemberNumber(lipMember.getMemberNumber());
						//sp.setSurveyNumber();
						sp.setSurveyPointPoint(payment/2);
						
						SurveyDao sd = new SurveyDao();
						//서베이, 멀티폴, 권역, 서베이 포인트, 멤법정보
						int returnNumber = 	sd.surveyCreateByObject(sv, mp, acTemp, sp, lipMember);
					
						if(returnNumber == 0){
							System.out.println("DB 에러");
						}else{
							System.out.println("DB 성공");
						}
					}else{
						System.out.println("2번 경우");
						//2번 기본권역 없고 추가 권역만 있는 경우
						//추가 권역 갯수
						this.addConstraintCnt = Integer.parseInt(addCons[0]);
						System.out.println(this.addConstraintCnt);
						//추가 권역명
						String[] AddConsName = new String[this.addConstraintCnt];
						//추가 권역 설정명
						String[][] example = new String[this.addConstraintCnt][5];
						//추가 권역 키 값
						int[][] hiddenBar = new int[this.addConstraintCnt][5];
						
						//추가권역숫자만큼 데이터 가공
						SurveyConstraint surveyConstraintTemp;
						List<SurveyConstraint> listSurveyCons = new ArrayList<SurveyConstraint>();
						//추가 권역 설정명 데이터 가공
						SetConstraint setConsTemp;
						
						//추가 권역 제한 수 값
						LimitParticipate limitParticipateTemp;
						
						
						for(int i=0; i<this.addConstraintCnt; i++){
							surveyConstraintTemp = new SurveyConstraint();
							String[] textAddCons = (String[])parameters.get("textAddCons" + (i+1));
							AddConsName[i] = textAddCons[0];
							//서베이 권역명
							surveyConstraintTemp.setConstraintName(AddConsName[i]);
							
							//권역 설정 명 배열 값
							List<SetConstraint> listSetConsTemp = new ArrayList<SetConstraint>();
							//추가 권역 제한 수 값 리스트
							List<LimitParticipate> listLimitTemp = new ArrayList<LimitParticipate>();
							example[i] = (String[])parameters.get("example" + (i+1));
							for(int j = 0; j<example[i].length; j++){
								setConsTemp = new SetConstraint();
								System.out.println("권역값 : " + example[i][j] + "/ i :" + i +"/j" + j);
								setConsTemp.setConstraintName(example[i][j]);
								listSetConsTemp.add(setConsTemp);
								//추가권역 퍼센트 값
								String[] hiddenBarTemp = (String[])parameters.get("hiddenBar"+(i+1)+"-"+(j+1));
								limitParticipateTemp = new LimitParticipate();
								if(hiddenBarTemp!=null){
									hiddenBar[i][j] = Integer.parseInt(hiddenBarTemp[0]);
									limitParticipateTemp.setLimitParticipateLimit(hiddenBar[i][j]);
									limitParticipateTemp.setLimitParticipateCount(0);
									listLimitTemp.add(limitParticipateTemp);
								}	
							}
							surveyConstraintTemp.setSetConstraintList(listSetConsTemp);
							surveyConstraintTemp.setLimitParticipateList(listLimitTemp);
							listSurveyCons.add(surveyConstraintTemp);
							
						}
						//DB작업
						//복합폴
						mp = multiPoll(lipMember);
						//서베이 문제
						sv.setQuestionList(questionAll());
						//서베이에 입력한 포인트를 서베이 포인트 페이지에 입력 -> 회원번호
						sp.setMemberNumber(lipMember.getMemberNumber());
						//sp.setSurveyNumber();
						sp.setSurveyPointPoint(payment/2);
						
						SurveyDao sd = new SurveyDao();
						//서베이, 멀티폴, 권역, 서베이 포인트, 멤법정보
						int returnNumber = 	sd.surveyCreateByAddCons(sv, mp, listSurveyCons, sp, lipMember);
					
						if(returnNumber == 0){
							System.out.println("DB 에러");
						}else{
							System.out.println("DB 성공");
						}
						
					}
					
					
				}
			}else{
				
				if(addCons == null){
					//기본 권역이 있고 추가 권역이 없는 경우
					//######################아직 못함########################
				}else{
					//기본 권역이 있으며 추가 권역도 있는 경우 
					//권역 설정 갯수 
					String[] hiddenSetBasicCntVal = (String[])parameters.get("hiddenSetBasicCntVal");
					//권역 갯수로 객체화					
					if(hiddenSetBasicCntVal != null){
						int setBasicCntNum = Integer.parseInt(hiddenSetBasicCntVal[0]);
						System.out.println("기본 설정 권역 갯수 값 : " + setBasicCntNum);
						if(setBasicCntNum == 1){
							//기본 권역 리미트 키값 : hiddenBox
							if(hiddenBox != null){
								//추가 설정 값 계산하기
								//추가 권역 갯수
								this.addConstraintCnt = Integer.parseInt(addCons[0]);
								//추가 권역명
								String[] AddConsName = new String[this.addConstraintCnt];
								//추가 권역 설정명
								String[][] example = new String[this.addConstraintCnt][5];
								int[][] hiddenBar = new int[this.addConstraintCnt][5];
								
								//추가 권역 1~3개
								List<SurveyConstraint> basicSurveySet = new ArrayList<SurveyConstraint>();
								for(int i=0; i<this.addConstraintCnt; i++){
									SurveyConstraint basicSurveySetting = new SurveyConstraint();
									//추가 권역 명
									String[] textAddCons = (String[])parameters.get("textAddCons" + (i+1));
									AddConsName[i] = textAddCons[0];
									basicSurveySetting.setConstraintName(AddConsName[i]);
									
									//추가 권역 설정 명
									example[i] = (String[])parameters.get("example" + (i+1));
									//추가 권역 리미트 값
									//추가권역으로 묶어주기
									
									List<SetConstraint> basicSetSet = new ArrayList<SetConstraint>();
									for(int j=0; j<example[i].length; j++){
										SetConstraint basicSetSetting = new SetConstraint();
										String[] hiddenBarTemp = (String[])parameters.get("hiddenBar"+(i+1)+"-"+(j+1));
										String str = example[i][j];
										basicSetSetting.setConstraintName(str);
										hiddenBar[i][j] = Integer.parseInt(hiddenBarTemp[0]);

										//기본 권역 설정 갯수 만큼
										List<List<AddConstraint>> basicSetAll = new ArrayList<List<AddConstraint>>();
										for(int k=0; k<textBox.length; k++){
											//나이/지역/성별
											String[] temp2 = hiddenBox[k].split("/");
											//기본 권역 갯수만큼
											//3번 포문으로 돌아감
											//리스트로 객체에 담기
											List<AddConstraint> basicSet = new ArrayList<AddConstraint>();
											List<LimitParticipate> basicLimitSet = new ArrayList<LimitParticipate>();
											for(int l=0; l<temp2.length;l++){
												AddConstraint basicSetting = new AddConstraint();
												//사용자 설정 권역
												if(l==0){
													basicSetting.setSetConstraintNum(-1);
													LimitParticipate basicLimitSetting = new LimitParticipate();
													//리미트 셋팅 한번만
													int val = (int)(Integer.parseInt(textBox[k])*hiddenBar[i][j]/100);
													basicLimitSetting.setLimitParticipateLimit(val);
													basicLimitSetting.setLimitParticipateCount(0);
													basicLimitSet.add(basicLimitSetting);
													basicSetting.setLimitParticipateList(basicLimitSet);
													basicSet.add(basicSetting);
												}
												//기본 설정 권역
												basicSetting.setSetConstraintNum(Integer.parseInt(temp2[l].trim()));
												basicSet.add(basicSetting);
											}
											//서베이 권역 설정으로 묶기
											basicSetAll.add(basicSet);
											
										}
										basicSetSetting.setAddConstraintList(basicSetAll);
										basicSetSet.add(basicSetSetting);
									}
									basicSurveySetting.setSetConstraintList(basicSetSet);
									basicSurveySet.add(basicSurveySetting);
								}
								//DB작업
								//복합폴
								mp = multiPoll(lipMember);
								//서베이 문제
								sv.setQuestionList(questionAll());
								//서베이에 입력한 포인트를 서베이 포인트 페이지에 입력 -> 회원번호
								sp.setMemberNumber(lipMember.getMemberNumber());
								//sp.setSurveyNumber();
								sp.setSurveyPointPoint(payment/2);
								
								SurveyDao sd = new SurveyDao();
								//서베이, 멀티폴, 권역, 서베이 포인트, 멤법정보
								int returnNumber = 	sd.surveyCreateByAddConsByOb(sv, mp, basicSurveySet, sp, lipMember);
							
								if(returnNumber == 0){
									System.out.println("DB 에러");
								}else{
									System.out.println("DB 성공");
								}
							}
						}else if(setBasicCntNum == 2){
							//기본권역 키값과 리미트 값 객체화
							LimitParticipate limitBasicKey;
							AddConstraint addConsVasicKey;
							List<AddConstraint> addConsBasicList = new ArrayList<AddConstraint>();
							//기본 권역 리미트 키값 : hiddenBox
							if(hiddenBox != null){
								
								
								//추가 설정 값 계산하기
								//추가 권역 갯수
								this.addConstraintCnt = Integer.parseInt(addCons[0]);
								//추가 권역명
								String[] AddConsName = new String[this.addConstraintCnt];
								//추가 권역 설정명
								String[][] example = new String[this.addConstraintCnt][5];
								int[][] hiddenBar = new int[this.addConstraintCnt][5];
								
								//추가 권역 1~3개
								List<SurveyConstraint> basicSurveySet = new ArrayList<SurveyConstraint>();
								for(int i=0; i<this.addConstraintCnt; i++){
									SurveyConstraint basicSurveySetting = new SurveyConstraint();
									//추가 권역 명
									String[] textAddCons = (String[])parameters.get("textAddCons" + (i+1));
									AddConsName[i] = textAddCons[0];
									basicSurveySetting.setConstraintName(AddConsName[i]);
									
									//추가 권역 설정 명
									example[i] = (String[])parameters.get("example" + (i+1));
									//추가 권역 리미트 값
									//추가권역으로 묶어주기
									
									List<SetConstraint> basicSetSet = new ArrayList<SetConstraint>();
									for(int j=0; j<example[i].length; j++){
										SetConstraint basicSetSetting = new SetConstraint();
										String[] hiddenBarTemp = (String[])parameters.get("hiddenBar"+(i+1)+"-"+(j+1));
										String str = example[i][j];
										basicSetSetting.setConstraintName(str);
										hiddenBar[i][j] = Integer.parseInt(hiddenBarTemp[0]);

										//기본 권역 설정 갯수 만큼
										List<List<AddConstraint>> basicSetAll = new ArrayList<List<AddConstraint>>();
										for(int k=0; k<textBox.length; k++){
											//나이/지역/성별
											String[] temp2 = hiddenBox[k].split("/");
											//기본 권역 갯수만큼
											//3번 포문으로 돌아감
											//리스트로 객체에 담기
											List<AddConstraint> basicSet = new ArrayList<AddConstraint>();
											List<LimitParticipate> basicLimitSet = new ArrayList<LimitParticipate>();
											for(int l=0; l<temp2.length;l++){
												AddConstraint basicSetting = new AddConstraint();
												//사용자 설정 권역
												if(l==0){
													basicSetting.setSetConstraintNum(-1);
													LimitParticipate basicLimitSetting = new LimitParticipate();
													//리미트 셋팅 한번만
													int val = (int)(Integer.parseInt(textBox[k])*hiddenBar[i][j]/100);
													basicLimitSetting.setLimitParticipateLimit(val);
													basicLimitSetting.setLimitParticipateCount(0);
													basicLimitSet.add(basicLimitSetting);
													basicSetting.setLimitParticipateList(basicLimitSet);
													basicSet.add(basicSetting);
												}
												//기본 설정 권역
												basicSetting.setSetConstraintNum(Integer.parseInt(temp2[l].trim()));
												basicSet.add(basicSetting);
											}
											//서베이 권역 설정으로 묶기
											basicSetAll.add(basicSet);
											
										}
										basicSetSetting.setAddConstraintList(basicSetAll);
										basicSetSet.add(basicSetSetting);
									}
									basicSurveySetting.setSetConstraintList(basicSetSet);
									basicSurveySet.add(basicSurveySetting);
								}
								//DB작업
								//복합폴
								mp = multiPoll(lipMember);
								//서베이 문제
								sv.setQuestionList(questionAll());
								//서베이에 입력한 포인트를 서베이 포인트 페이지에 입력 -> 회원번호
								sp.setMemberNumber(lipMember.getMemberNumber());
								//sp.setSurveyNumber();
								sp.setSurveyPointPoint(payment/2);
								
								SurveyDao sd = new SurveyDao();
								//서베이, 멀티폴, 권역, 서베이 포인트, 멤법정보
								int returnNumber = 	sd.surveyCreateByAddConsByOb(sv, mp, basicSurveySet, sp, lipMember);
							
								if(returnNumber == 0){
									System.out.println("DB 에러");
								}else{
									System.out.println("DB 성공");
								}
							}
						}else if(setBasicCntNum == 3){
							//기본 권역 리미트 키값 : hiddenBox
							if(hiddenBox != null){
								//추가 설정 값 계산하기
								//추가 권역 갯수
								this.addConstraintCnt = Integer.parseInt(addCons[0]);
								//추가 권역명
								String[] AddConsName = new String[this.addConstraintCnt];
								//추가 권역 설정명
								String[][] example = new String[this.addConstraintCnt][5];
								int[][] hiddenBar = new int[this.addConstraintCnt][5];
								
								
								
								
								//추가 권역 1~3개
								List<SurveyConstraint> basicSurveySet = new ArrayList<SurveyConstraint>();
								for(int i=0; i<this.addConstraintCnt; i++){
									SurveyConstraint basicSurveySetting = new SurveyConstraint();
									//추가 권역 명
									String[] textAddCons = (String[])parameters.get("textAddCons" + (i+1));
									AddConsName[i] = textAddCons[0];
									basicSurveySetting.setConstraintName(AddConsName[i]);
									
									//추가 권역 설정 명
									example[i] = (String[])parameters.get("example" + (i+1));
									//추가 권역 리미트 값
									//추가권역으로 묶어주기
									
									List<SetConstraint> basicSetSet = new ArrayList<SetConstraint>();
									for(int j=0; j<example[i].length; j++){
										SetConstraint basicSetSetting = new SetConstraint();
										String[] hiddenBarTemp = (String[])parameters.get("hiddenBar"+(i+1)+"-"+(j+1));
										String str = example[i][j];
										basicSetSetting.setConstraintName(str);
										hiddenBar[i][j] = Integer.parseInt(hiddenBarTemp[0]);

										//기본 권역 설정 갯수 만큼
										List<List<AddConstraint>> basicSetAll = new ArrayList<List<AddConstraint>>();
										for(int k=0; k<textBox.length; k++){
											//나이/지역/성별
											String[] temp2 = hiddenBox[k].split("/");
											//기본 권역 갯수만큼
											//3번 포문으로 돌아감
											//리스트로 객체에 담기
											List<AddConstraint> basicSet = new ArrayList<AddConstraint>();
											List<LimitParticipate> basicLimitSet = new ArrayList<LimitParticipate>();
											for(int l=0; l<temp2.length;l++){
												AddConstraint basicSetting = new AddConstraint();
												//사용자 설정 권역
												if(l==0){
													basicSetting.setSetConstraintNum(-1);
													LimitParticipate basicLimitSetting = new LimitParticipate();
													//리미트 셋팅 한번만
													int val = (int)(Integer.parseInt(textBox[k])*hiddenBar[i][j]/100);
													basicLimitSetting.setLimitParticipateLimit(val);
													basicLimitSetting.setLimitParticipateCount(0);
													basicLimitSet.add(basicLimitSetting);
													basicSetting.setLimitParticipateList(basicLimitSet);
													basicSet.add(basicSetting);
												}
												//기본 설정 권역
												basicSetting.setSetConstraintNum(Integer.parseInt(temp2[l].trim()));
												basicSet.add(basicSetting);
											}
											//서베이 권역 설정으로 묶기
											basicSetAll.add(basicSet);
											
										}
										basicSetSetting.setAddConstraintList(basicSetAll);
										basicSetSet.add(basicSetSetting);
									}
									basicSurveySetting.setSetConstraintList(basicSetSet);
									basicSurveySet.add(basicSurveySetting);
								}
								//DB작업
								//복합폴
								mp = multiPoll(lipMember);
								//서베이 문제
								sv.setQuestionList(questionAll());
								//서베이에 입력한 포인트를 서베이 포인트 페이지에 입력 -> 회원번호
								sp.setMemberNumber(lipMember.getMemberNumber());
								//sp.setSurveyNumber();
								sp.setSurveyPointPoint(payment/2);
								
								SurveyDao sd = new SurveyDao();
								//서베이, 멀티폴, 권역, 서베이 포인트, 멤법정보
								int returnNumber = 	sd.surveyCreateByAddConsByOb(sv, mp, basicSurveySet, sp, lipMember);
							
								if(returnNumber == 0){
									System.out.println("DB 에러");
								}else{
									System.out.println("DB 성공");
								}
							}
						}else{
							System.out.println("기본 권역 설정 에러");
						}
					}
				}
				
				
			}
			
		}else{
			//Map is null
		}
		
		Random rd = new Random();
		int randNum = rd.nextInt(10);
		message = Integer.toString(randNum);
		
		return SUCCESS;
	}

	//복합폴메서드
	public Multipoll multiPoll(LipMember lip){
		//파일 업로드 
		FileUpload afu	=	new FileUpload(answer_path);
		FileUpload qfu	=	new FileUpload(question_path);
		FileManager fm	=	new FileManager();
		//복합폴 생성
		Multipoll mp;

		//폴갯수
		String[] addPoll = (String[])parameters.get("addPoll");
		int addPollCnt;
		
		//폴이 있을경우
		if(addPoll != null){
			mp = new Multipoll();
			//이벤트 폴의 갯수(1~3개)
			addPollCnt = Integer.parseInt(addPoll[0]);
			//폴생성
			Poll pl;
			List<Poll> pollList = new ArrayList<Poll>();
			for(int i=0; i<addPollCnt; i++){
				pl = new Poll();
				//폴질문
				String[] questionTepm = (String[])parameters.get("question" + (i+1));
				if(questionTepm != null){
					pl.setPollQuestion(questionTepm[0]);
				}else{
					System.out.println("폴질문에러 : " + i);
				}
				//폴질문부가설명
				String[] queDetail = (String[])parameters.get("question_detail" + (i+1));
				if(queDetail != null){
					pl.setPollExplain(queDetail[0]);
				}else{
					System.out.println("폴 부가 설명 에러 : " + i);
				}
				//폴 시작 시간
				String[] startDate = (String[])parameters.get("start_date");
				String start_date = "";
				if(startDate != null){
					start_date = startDate[0];
				}else{
					System.out.println("폴 시작 시간 에러 : " + i);
				}
				//폴 종료 시간
				String[] endDate = (String[])parameters.get("end_date");
				String end_date = "";
				if(endDate != null){
					end_date = endDate[0];
				}else{
					System.out.println("폴 종료 시간 에러 : " + i);
				}
				ConvertDate cd = new ConvertDate();
				Date startDateVal = cd.StringToUtilDate(start_date);
				Date endDateVal = cd.StringToUtilDate(end_date);
				if(startDateVal != null && endDateVal != null){
					pl.setPollStartDate(startDateVal);
					pl.setPollEndDate(endDateVal);
				}else{
					System.out.println("폴 시간 에러 : " + i);
				}
				//시작전
				pl.setPollCondition(5);
				//폴 작성자
				if(lip != null){
					pl.setMemberNumber(lip.getMemberNumber());
				}
				//카테고리
				String[] categoryTemp = (String[]) parameters.get("category");
				int category = 0;
				if(categoryTemp != null){
					category = Integer.parseInt(categoryTemp[0].trim());
					pl.setCategoryNumber(category);
				}else{
					System.out.println("카테고리 에러 : " + i);
				}
				//폴타입 체킹 1.텍스트 2.이미지 3.동영상
				String[] pollQueType = (String[])parameters.get("question_type" + (i+1));
				if(pollQueType != null){
					if(Integer.parseInt(pollQueType[0]) == 1){
						pl.setPollQuestionType(1);
					}else if(Integer.parseInt(pollQueType[0]) == 2){
						pl.setPollQuestionType(2);
						if(question_img_file_poll[pollFileCnt] != null){
							String fname	=	fm.getExtenstion(UUID.randomUUID().toString(), question_img_file_pollFileName[pollFileCnt]);
							fname	=	fname.replaceAll("-", "_");
							qfu.saveFile(question_img_file_poll[pollFileCnt++], fname);
							pl.setPollLink(question_path+fname);
						}else{
							String[] img_urlTemp = (String[])parameters.get("img_url" + (i+1));
							if(img_urlTemp != null){
								String urlLinkCheck = img_urlTemp[0];
								if(urlLinkCheck.substring(0, 6).toLowerCase().equals("http://")){
									pl.setPollLink(img_urlTemp[0]);
								}else{
									String httpVal = "http://";
									httpVal += urlLinkCheck;
									pl.setPollLink(httpVal);
								}
							}else{
								System.out.println("이미지 url 경로 에러 : " + i);
							}
						}
					}else if(Integer.parseInt(pollQueType[0]) == 3){
						pl.setPollQuestionType(3);
						String[] youtubefileURLTemp = (String[])parameters.get("youtubefileURL" + (i+1));
						if(youtubefileURLTemp != null){
							pl.setPollLink(youtubefileURLTemp[0]);
						}else{
							System.out.println("동영상 경로 에러 : " + i);
						}
					}else{
						System.out.println("폴타입 1,2,3번 아님");
					}
				}else{
					System.out.println("폴타입 에러 : " + i);
				}
				
				//폴 보기 리스트
				List<Example> exampleList = new ArrayList<Example>();
				Example exam;
				//폴 답변 타입
				String[] pollAnsType = (String[])parameters.get("answer_type" + (i+1));
				if(pollAnsType != null){
					if(Integer.parseInt(pollAnsType[0]) == 1){
						//텍스트형
						System.out.println("복합폴 보기 텍스트형 선언");
						pl.setPollViewType(1);
						String[] exampleListTemp = (String[])parameters.get("answer_" + (i+1));
						if(exampleListTemp != null){
							for(int j=0; j<exampleListTemp.length; j++){
								exam = new Example();
								exam.setExampleOrder(j+1);
								exam.setExampleContant(exampleListTemp[j]);
								exam.setExampleType(1);
								String[] checkedVal = (String[])parameters.get("answerRadio_" + (i+1) + "_" + (j+1));
								if(checkedVal != null){
									System.out.println("checkedVal : " + checkedVal + "/ " + j);
									exam.setTotalValue(j+1);
								}else{
									System.out.println("텍스트 선택한 답 아님 : " + j);
									exam.setTotalValue(0);
								}
								exampleList.add(exam);
							}
						}
						
					}else if(Integer.parseInt(pollAnsType[0]) == 2){
						//사진형
						System.out.println("복합폴 사진형 답변");
						pl.setPollViewType(2);
						String[] picExampleListTemp = (String[])parameters.get("picAnswer_"+(i+1));
						if(picExampleListTemp!=null){
							for(int j=0; j<picExampleListTemp.length; j++){
								exam = new Example();
								exam.setExampleOrder(j+1);
								exam.setExampleContant(picExampleListTemp[j]);
								exam.setExampleType(2);
								String[] checkedVal = (String[])parameters.get("picAnswerRadio_" + (i+1) + "_" + (j+1));
								if(checkedVal != null){
									System.out.println("checkedVal : " + checkedVal + "/ " + j);
									exam.setTotalValue(j+1);
								}else{
									System.out.println("선택한 답 아님" + j);
									exam.setTotalValue(0);
								}
								//보기 사진형 파일
								String picName	=	fm.getExtenstion(UUID.randomUUID().toString(), picAnswerFileFileName[exampleCnt]);
								picName	=	picName.replaceAll("-", "_");
								System.out.println("picName : "+picName);
								afu.saveFile(picAnswerFile[exampleCnt++], picName);
								exam.setExampleLink(answer_path+picName);
								exampleList.add(exam);
							}
						}
					}else{
						System.out.println("보기 타입 에러 : " + i);
					}
				}else{
					System.out.println("보기타입 없음 : " + i);
				}
				pl.setExampleList(exampleList);
				pollList.add(pl);
			}
			mp.setPollList(pollList);
			//PollList
			
			return mp;
		}else{
			return null;
		}
		
	}
	
	public List<Question> questionAll(){
		//파일 업로드 
		FileUpload afu	=	new FileUpload(answer_path);
		FileUpload qfu	=	new FileUpload(question_path);
		FileManager fm	=	new FileManager();
		
		//문제갯수
		String[] addQue = (String[])parameters.get("hiddenQueCnt");
		int addQueCnt;
		
		List<Question> pollList = new ArrayList<Question>();
		
		
		//문제가 있을경우
		if(addQue != null){
			//문제의 갯수 (1~20개)
			addQueCnt = Integer.parseInt(addQue[0]);
			//문제 생성
			Question qs;
			
			
			for(int i=0; i<addQueCnt; i++){
				qs = new Question();
				//폴질문
				String[] questionTepm = (String[])parameters.get("questionQue" + (i+1));
				if(questionTepm != null){
					qs.setQuestionContant(questionTepm[0]);
					qs.setQuestionOrder(i+1);
				}else{
					System.out.println("문제질문에러 : " + i);
				}
				/*//폴질문부가설명
				String[] queDetail = (String[])parameters.get("question_detailQue" + (i+1));
				if(queDetail != null){
					pl.setPollExplain(queDetail[0]);
				}else{
					System.out.println("폴 부가 설명 에러 : " + i);
				}*/
				/*//문제 시작 시간
				String[] startDate = (String[])parameters.get("start_date");
				String start_date = "";
				if(startDate != null){
					start_date = startDate[0];
				}else{
					System.out.println("폴 시작 시간 에러 : " + i);
				}
				//폴 종료 시간
				String[] endDate = (String[])parameters.get("end_date");
				String end_date = "";
				if(endDate != null){
					end_date = endDate[0];
				}else{
					System.out.println("폴 종료 시간 에러 : " + i);
				}
				ConvertDate cd = new ConvertDate();
				Date startDateVal = cd.StringToUtilDate(start_date);
				Date endDateVal = cd.StringToUtilDate(end_date);
				if(startDateVal != null && endDateVal != null){
					pl.setPollStartDate(startDateVal);
					pl.setPollEndDate(endDateVal);
				}else{
					System.out.println("폴 시간 에러 : " + i);
				}*/
				/*//시작전
				pl.setPollCondition(1);*/
				/*//폴 작성자
				if(lip != null){
					pl.setMemberNumber(lip.getMemberNumber());
				}*/
				/*//카테고리
				String[] categoryTemp = (String[]) parameters.get("category");
				int category = 0;
				if(categoryTemp != null){
					category = Integer.parseInt(categoryTemp[0].trim());
					pl.setCategoryNumber(category);
				}else{
					System.out.println("카테고리 에러 : " + i);
				}*/
				//폴타입 체킹 1.텍스트 2.이미지 3.동영상
				String[] pollQueType = (String[])parameters.get("question_typeQue" + (i+1));
				if(pollQueType != null){
					if(Integer.parseInt(pollQueType[0]) == 1){
						qs.setQuestionType(1);
					}else if(Integer.parseInt(pollQueType[0]) == 2){
						qs.setQuestionType(2);
						if(question_img_file_que[queFileCnt] != null){
							String fname	=	fm.getExtenstion(UUID.randomUUID().toString(), question_img_file_queFileName[queFileCnt]);
							fname	=	fname.replaceAll("-", "_");
							qfu.saveFile(question_img_file_que[queFileCnt++], fname);
							qs.setQuestionImage(question_path+fname);
						}else{
							String[] img_urlTemp = (String[])parameters.get("image_urlQue" + (i+1));
							if(img_urlTemp != null){
								String urlLinkCheck = img_urlTemp[0];
								if(urlLinkCheck.substring(0, 6).toLowerCase().equals("http://")){
									qs.setQuestionImage(img_urlTemp[0]);
								}else{
									String httpVal = "http://";
									httpVal += urlLinkCheck;
									qs.setQuestionImage(httpVal);
								}
							}else{
								System.out.println("이미지 url 경로 에러 : " + i);
							}
						}
					}else if(Integer.parseInt(pollQueType[0]) == 3){
						qs.setQuestionType(3);
						String[] youtubefileURLTemp = (String[])parameters.get("youtubefileURLQue" + (i+1));
						if(youtubefileURLTemp != null){
							qs.setQuestionImage(youtubefileURLTemp[0]);
						}else{
							System.out.println("동영상 경로 에러 : " + i);
						}
					}else{
						System.out.println("폴타입 1,2,3번 아님");
					}
				}else{
					System.out.println("폴타입 에러 : " + i);
				}
				
				//폴 보기 리스트
				List<Example> exampleList = new ArrayList<Example>();
				Example exam;
				//폴 답변 타입
				String[] pollAnsType = (String[])parameters.get("answer_typeQue" + (i+1));
				if(pollAnsType != null){
					System.out.println("문제 보기 타입 : " + Integer.parseInt(pollAnsType[0]));
					if(Integer.parseInt(pollAnsType[0]) == 1){
						//텍스트형
						qs.setQuestionViewType(1);
						String[] exampleListTemp = (String[])parameters.get("answer_Que" + (i+1));
						if(exampleListTemp != null){
							for(int j=0; j<exampleListTemp.length; j++){
								exam = new Example();
								exam.setExampleOrder(j+1);
								exam.setExampleContant(exampleListTemp[j]);
								exam.setExampleType(1);
								String[] checkedVal = (String[])parameters.get("answerRadio_Que" + (i+1) + "_" + (j+1));
								if(checkedVal != null){
									exam.setTotalValue(j+1);
								}else{
									exam.setTotalValue(0);
								}
								exampleList.add(exam);
							}
						}
						
					}else if(Integer.parseInt(pollAnsType[0]) == 2){
						//사진형
						System.out.println("문제 사진형 답변");
						qs.setQuestionViewType(2);
						String[] picExampleListTemp = (String[])parameters.get("picAnswer_Que"+(i+1));
						if(picExampleListTemp!=null){
							for(int j=0; j<picExampleListTemp.length; j++){
								exam = new Example();
								exam.setExampleOrder(j+1);
								exam.setExampleContant(picExampleListTemp[j]);
								exam.setExampleType(2);
								String[] checkedVal = (String[])parameters.get("picAnswerRadio_Que" + (i+1) + "_" + (j+1));
								if(checkedVal != null){
									exam.setTotalValue(j+1);
								}else{
									exam.setTotalValue(0);
								}
								//보기 사진형 파일
								String picName	=	fm.getExtenstion(UUID.randomUUID().toString(), picAnswerFileFileName[exampleCnt]);
								picName	=	picName.replaceAll("-", "_");
								System.out.println("picName : "+picName);
								afu.saveFile(picAnswerFile[exampleCnt++], picName);
								exam.setExampleLink(answer_path+picName);
								exampleList.add(exam);
							}
						}
					}else{
						System.out.println("보기 타입 에러 : " + i);
					}
				}else{
					System.out.println("보기타입 없음 : " + i);
				}
				qs.setExampleList(exampleList);
				pollList.add(qs);
			}
			
			//문제리스트	
		}
		
		return pollList;
	}
	
	public String getSurveyTitle() {
		return surveyTitle;
	}

	public int getLimitParticipateNumber() {
		return limitParticipateNumber;
	}

	public int getSetLimitNumber() {
		return setLimitNumber;
	}

	public int getHiddenQueCnt() {
		return hiddenQueCnt;
	}

	public int getAddConstraintCnt() {
		return addConstraintCnt;
	}

	public List<List<Integer>> getAddConstraintVal() {
		return addConstraintVal;
	}

	public List<LimitParticipate> getSetLimitParticipate() {
		return setLimitParticipate;
	}

	public List<AddConstraint> getSurveyAddCons() {
		return surveyAddCons;
	}

	public File[] getQuestion_img_file_poll() {
		return question_img_file_poll;
	}

	public void setQuestion_img_file_poll(File[] question_img_file_poll) {
		this.question_img_file_poll = question_img_file_poll;
	}

	public String[] getQuestion_img_file_pollFileName() {
		return question_img_file_pollFileName;
	}

	public void setQuestion_img_file_pollFileName(
			String[] question_img_file_pollFileName) {
		this.question_img_file_pollFileName = question_img_file_pollFileName;
	}

	public File[] getQuestion_img_file_que() {
		return question_img_file_que;
	}

	public void setQuestion_img_file_que(File[] question_img_file_que) {
		this.question_img_file_que = question_img_file_que;
	}

	public String[] getQuestion_img_file_queFileName() {
		return question_img_file_queFileName;
	}

	public void setQuestion_img_file_queFileName(
			String[] question_img_file_queFileName) {
		this.question_img_file_queFileName = question_img_file_queFileName;
	}

	public File[] getPicAnswerFile() {
		return picAnswerFile;
	}

	public void setPicAnswerFile(File[] picAnswerFile) {
		this.picAnswerFile = picAnswerFile;
	}

	public String[] getPicAnswerFileFileName() {
		return picAnswerFileFileName;
	}

	public void setPicAnswerFileFileName(String[] picAnswerFileFileName) {
		this.picAnswerFileFileName = picAnswerFileFileName;
	}

	
	
}
