package action.poll.create;

import java.io.File;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.struts2.ServletActionContext;

import Utility.ConvertDate;
import Utility.FileManager;
import Utility.FileUpload;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;
import bean.survey.Example;
import bean.survey.Poll;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import dao.PollDao;

public class RegPollAction extends ActionSupport {
	private String question;//문제내용
	private String question_detail;//문제세부설명
	private File question_img_file;
	private String question_img_fileContentType;
	private String question_img_fileFileName;
	
	private String img_url;
	private String youtubefileURL;
	private String[] picAnswer;
	private File[] picAnswerFile;
	private String[] picAnswerFileContentType;
	private String[] picAnswerFileFileName;
	
	private int multi_answer_value;//중복답변 허용? 1:한개 답변 2:중복답변
	
	private String[] answer;//답변 리스트
	private int question_type;//1.텍스트형 2. 사진형 3. 동영상형
	private int answer_type;//1.기본형 2. 사진형 3. 좋아요?싫어요? 4.별점형
	private String start_date;//시작일
	private String  end_date;//종료일
	private int point_bet;//투자한 보인트 1:예 2:아니오
	private int category;//카테고리번호
	private int bettingPoint;//건 포인트 수
	private String message;//오류시 보여줄 메세지
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		int[] star_num_arr	=	{37,38,39,40,41};
		int[] prefer_num_arr	=	{35, 36};
		PollDao pd	=	new PollDao();
		List<Integer> exampleNumberList	=	new ArrayList<Integer>();
		try{

		System.out.println(question_type);
		System.out.println(answer_type);
		
		
		System.out.println("1");
		pd.getSqlMap().startTransaction();
		String answer_path	=	"D://upload/example/";
		String question_path	=	"D://upload/question/";
		
		HttpSession session	=	ServletActionContext.getRequest().getSession();
		LipMember lm	=	(LipMember) session.getAttribute("lipMember");
		

		if(lm==null||lm.getMemberNumber()==0){
			pd.getSqlMap().endTransaction();
			return LOGIN;
		}
		
		int left_point	=	lm.getMemberPoint();
		ConvertDate cd	=	new ConvertDate();
		FileUpload afu	=	new FileUpload(answer_path);
		FileUpload qfu	=	new FileUpload(question_path);
		FileManager fm	=	new FileManager();
		
		Poll poll	=	new Poll();
		poll.setPollQuestion(question);
		poll.setPollExplain(question_detail);
		poll.setPollStartDate(cd.StringToUtilDate(start_date));
		poll.setPollEndDate(cd.StringToUtilDate(end_date));
		poll.setPollCondition(1);
		poll.setMemberNumber(lm.getMemberNumber());
		poll.setCategoryNumber(category);
		poll.setPollViewType(question_type);
		
		if(point_bet==1){
			if(left_point<bettingPoint){
				System.out.println("6");
				pd.getSqlMap().endTransaction();
				message	=	"배당 포인트가 잔여액 보다 작습니다.\n포인트를 충전하세요.";
				return INPUT;
			}else{
				poll.setPollBalancePoint(bettingPoint);
				
				PointIncome pi	=	new PointIncome();
				System.out.println("7");
				pi.setPointIncomePoint(bettingPoint);
				pi.setPointIncomeDetail("회원번호 "+lm.getMemberNumber()+"님이 "+question+" 폴을 등록했습니다");
				pi.setPointIncomeList("폴 등록");
				pi.setMemberNumber(1);
				System.out.println("a");
				pd.pollRegIncomeProcess(pi);
				System.out.println("b");
				pointOutcome po	=	new pointOutcome();
				po.setMemberNumber(lm.getMemberNumber());
				po.setPointOutcomePoint(bettingPoint);
				po.setPointOutcomeDetail("회원번호 "+lm.getMemberNumber()+"님이 "+question+" 폴을 등록했습니다");
				po.setPointOutcomeList("폴 등록");
				System.out.println("c");
				pd.pollRegOutcomeProcess(po);
				System.out.println("d");
			}
		}
		System.out.println("8");
		System.out.println("question_type = "+question_type);
		System.out.println(question_img_file==null);
		switch(question_type){
		//문제 타입이 사진이면 사진을 저장하고 사진 경로를 객체에 입력
		case 2:
			if(question_img_file!=null){
				String fname	=	fm.getExtenstion(UUID.randomUUID().toString(), question_img_fileFileName);
				fname	=	fname.replaceAll("-", "_");
				System.out.println("fname : "+fname);
				qfu.saveFile(question_img_file, fname);
				poll.setPollLink(question_path+fname);
			}else{
				poll.setPollLink(img_url);
			}
			break;
			//문제 타입이 동영상이면 동영상 경로를 저장
		case 3:
			String newval	=	youtubefileURL.substring(youtubefileURL.lastIndexOf("/")+1);
			poll.setPollLink(newval);
			break;
		
		default:
		}
		List<Example> list	=	new ArrayList<Example>();
		System.out.println("9");
		switch(answer_type){
		case 1: //보기타입이 단답형
		if(multi_answer_value==1){
			poll.setPollQuestionType(1);
		}else{
			poll.setPollQuestionType(2);
		}
		poll.setExampleType(1);
		
		System.out.println("a");
		for(int i=0; i<answer.length; i++){
			Example ex	=	new Example();
			ex.setExampleType(1);
			ex.setExampleContant(answer[i]);
			ex.setExampleOrder(i+1);
			list.add(ex);
		}
		poll.setExampleList(list);
		exampleNumberList = pd.insertExamples(poll.getExampleList());
			break;
		case 2://보기 타입이 사진형
			if(multi_answer_value==1){
				poll.setPollQuestionType(1);
			}else{
				poll.setPollQuestionType(2);
			}
			System.out.println("b");
			System.out.println("picAnswerFileFileName = "+(picAnswerFileFileName==null));
			System.out.println("picAnswerFile = "+(picAnswerFile==null));
			for(int i=0; i<picAnswer.length; i++){
				Example ex	=	new Example();
				ex.setExampleType(2);
				ex.setExampleContant(picAnswer[i]);
				ex.setExampleOrder(i+1);
				
				String picName	=	fm.getExtenstion(UUID.randomUUID().toString(), picAnswerFileFileName[i]);
				picName	=	picName.replaceAll("-", "_");
				System.out.println("picName : "+picName);
				afu.saveFile(picAnswerFile[i], picName);
			
				ex.setExampleLink(answer_path+picName);
				list.add(ex);
			}
			System.out.println("c");
			poll.setExampleList(list);
			poll.setExampleType(2);
			exampleNumberList = pd.insertExamples(poll.getExampleList());
			//poll.setPollLink(i)
			break;
			
		case 3:
			poll.setPollQuestionType(answer_type);
			
			
			for(int i : prefer_num_arr){
				exampleNumberList.add(i);
			}
		break;
		
		case 4:
			poll.setPollQuestionType(answer_type);
			for(int i: star_num_arr){
				exampleNumberList.add(i);	
			}
			break;
		default:
			pd.getSqlMap().endTransaction();
			return INPUT;
		}
		System.out.println("d");
		int pollKey = pd.insertPoll(poll);
		
		 
		System.out.println("e");
		pd.mappingPollWithExample(pollKey, exampleNumberList);
		System.out.println("f");
		pd.getSqlMap().commitTransaction();
		pd.getSqlMap().endTransaction();
		System.out.println("g");
		}catch(Exception e){
			pd.getSqlMap().endTransaction();
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	/*	
	@Override
	public void validate(){

		if(question==null||"".equals(question)){
			addFieldError("question", "질문은 필수 입력사항입니다.");
		}
		
		if(question_detail==null||"".equals(question_detail)){
			addFieldError("question_detail", "질문 상세 사항은 필수 입력사항입니다.");
		
		}
		
		switch(question_type){
		
		case 2:

			if(question_img_file==null||"".equals(question_img_fileContentType)||
					question_img_fileContentType==null||"".equals(question_img_fileFileName)||
						question_img_fileFileName==null){

				addFieldError("question_img_file", "사진 타입 문제는 사진 파일을 첨부해야합니다.");
			}else if(img_url.equals("")||img_url==null){
				addFieldError("img_url", "사진을 URL로 업로드시에는 값을 입력해주셔야합니다.");

			}
			break;
		case 3:

			if(youtubefileURL.equals("")||youtubefileURL==null){

				addFieldError("youtubefileURL", "동영상을 업로드시에는 Youtube의 URL을 입력해주세요");
			}
		}

		
		switch(answer_type){
		case 1:
		
			for(int i=0; i<answer.length; i++){
				if(answer[i].equals("")||answer[i]==null){
				
					addFieldError("answer", "보기 내용들을 모두 채워주세요");
					return;
				}
			}
			break;
		case 2:
		System.out.println(picAnswer.length);
			for(int i=0; i<picAnswer.length;i++){
				System.out.println("picAnswer["+i+"] = "+picAnswer[i]);
				if(picAnswer[i].equals("")||picAnswer[i]==null){
					addFieldError("picAnswer", "사진 보기들을 모두 입력해주세요.");
					return;
				}
			}
			
			break;
		default:
	
		}
		
		
		if(point_bet==1){

			if(bettingPoint<10){
				
				addFieldError("bettingPoint", "포인트는 10포인트 이상부터 사용할 수 있습니다.");
			}

		}

	}*/
	
	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String[] getAnswer() {
		return answer;
	}

	public void setAnswer(String[] answer) {
		this.answer = answer;
	}

	public int getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}

	public int getAnswer_type() {
		return answer_type;
	}

	public void setAnswer_type(int answer_type) {
		this.answer_type = answer_type;
	}

	

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getQuestion_detail() {
		return question_detail;
	}

	public void setQuestion_detail(String question_detail) {
		this.question_detail = question_detail;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getBettingPoint() {
		return bettingPoint;
	}

	public void setBettingPoint(int bettingPoint) {
		this.bettingPoint = bettingPoint;
	}

	public File getQuestion_img_file() {
		return question_img_file;
	}

	public void setQuestion_img_file(File question_img_file) {
		this.question_img_file = question_img_file;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getYoutubefileURL() {
		return youtubefileURL;
	}

	public void setYoutubefileURL(String youtubefileURL) {
		this.youtubefileURL = youtubefileURL;
	}

	public File[] getPicAnswerFile() {
		return picAnswerFile;
	}

	public void setPicAnswerFile(File[] picAnswerFile) {
		this.picAnswerFile = picAnswerFile;
	}

	
	public int getMulti_answer_value() {
		return multi_answer_value;
	}

	public void setMulti_answer_value(int multi_answer_value) {
		this.multi_answer_value = multi_answer_value;
	}

	public int getPoint_bet() {
		return point_bet;
	}

	public void setPoint_bet(int point_bet) {
		this.point_bet = point_bet;
	}

	public String[] getPicAnswer() {
		return picAnswer;
	}

	public void setPicAnswer(String[] picAnswer) {
		this.picAnswer = picAnswer;
	}

	public String getQuestion_img_fileContentType() {
		return question_img_fileContentType;
	}

	public void setQuestion_img_fileContentType(String question_img_fileContentType) {
		this.question_img_fileContentType = question_img_fileContentType;
	}

	public String getQuestion_img_fileFileName() {
		return question_img_fileFileName;
	}

	public void setQuestion_img_fileFileName(String question_img_fileFileName) {
		this.question_img_fileFileName = question_img_fileFileName;
	}

	public String[] getPicAnswerFileContentType() {
		return picAnswerFileContentType;
	}

	public void setPicAnswerFileContentType(String[] picAnswerFileContentType) {
		this.picAnswerFileContentType = picAnswerFileContentType;
	}

	public String[] getPicAnswerFileFileName() {
		return picAnswerFileFileName;
	}

	public void setPicAnswerFileFileName(String[] picAnswerFileFileName) {
		this.picAnswerFileFileName = picAnswerFileFileName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
}
