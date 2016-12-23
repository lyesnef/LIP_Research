package action.user.join;

import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.StringTokenizer;

import Utility.ConvertDate;
import bean.member.LipMember;
import bean.point.PointIncome;
import bean.point.pointOutcome;

import com.opensymphony.xwork2.ActionSupport;

import dao.JoinDao;

@SuppressWarnings("serial")
public class SuccessJoinAction extends ActionSupport{
	private String agreement;
	private String userid;
	private String pw;
	private String emailVal;
	private String mobileco;
	private String firstnum;
	private String secondnum;
	private String lastnum;
	private int postNumber;
	private int postcodeVal;
	private String detailaddress;
	private String gender;
	private String birth;
	private String recommend;
	private String agreeMail;
	private String message;

	public int getPostcodeVal() {
		return postcodeVal;
	}

	public void setPostcodeVal(int postcodeVal) {
		this.postcodeVal = postcodeVal;
	}

	public String getMessage() {
		return message;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String execute() throws Exception {
		int memberPoint = 1000;
		int regionNumber = 0;
		int age = 0;
		if(postcodeVal >=100 && postcodeVal <=199){
			regionNumber = 1;
		}else if(postcodeVal >=200 && postcodeVal <=299){
			regionNumber =2;
		}else if(postcodeVal >=300 && postcodeVal <=399){
			regionNumber = 3;
		}else if(postcodeVal >=400 && postcodeVal <=499){
			regionNumber = 4;
		}else if(postcodeVal >=500 && postcodeVal <=599){
			regionNumber = 5;
		}else if(postcodeVal >=600 && postcodeVal <=689){
			regionNumber = 6;
		}else if(postcodeVal >=690 && postcodeVal <=699){
			regionNumber = 7;
		}else if(postcodeVal >=700 && postcodeVal <=799){
			regionNumber = 6;
		}
		StringTokenizer st = new StringTokenizer(birth,"-");
		int year;
		String yearStr = "";
		for (int i = 0; i < 1; i++) {
			yearStr = st.nextToken();
		}
		year = Integer.parseInt(yearStr);		
		Calendar calendar = Calendar.getInstance();
		int curYear = calendar.get(Calendar.YEAR);
		int ageDetail = 0;
		ageDetail = curYear - year;
		if(ageDetail >=10 && ageDetail <20){
			age = 1;
		}else if(ageDetail >=20 && ageDetail <30){
			age = 2;
		}else if(ageDetail >=30 && ageDetail <40){
			age = 3;
		}else if(ageDetail >=40 && ageDetail <50){
			age = 4;
		}else if(ageDetail >=50 && ageDetail <60){
			age = 5;
		}else{
			age = 6;
		}
		
		String cellPhone = firstnum+"-"+secondnum+"-"+lastnum;
		ConvertDate cd = new ConvertDate();
		Date birthVal = cd.StringToUtilDate(birth);
		LipMember mem = new LipMember();
		mem.setMemberDetailAddress(detailaddress);
		mem.setMemberPoint(memberPoint);
		mem.setMemberCellphoneCo(mobileco);
		mem.setMemberCellphoneNumber(cellPhone);
		mem.setMemberEmail(emailVal);
		if(agreeMail == null || agreeMail.trim().equals("")){
			mem.setMemberEmailRecieve("F");
		}else if(agreeMail.trim().equals("true")){
			mem.setMemberEmailRecieve("T");
		}
		mem.setMemberBirth(birthVal);
		mem.setMemberPw(pw);
		mem.setMemberId(userid);
		mem.setPostcodeNumber(postNumber);
		mem.setRegionNumber(regionNumber);
		if(gender.trim().equals("male")){
			mem.setGenderNumber(1);
		}else{
			mem.setGenderNumber(2);
		}
		mem.setAgeNumber(age);
		if(agreement.trim().equals("agree")){
			mem.setMemberAgree("T");
			System.out.println("memberAgree : " + mem.getMemberAgree());
		}
		JoinDao jd = new JoinDao();
		int resultValue = 0;
		if(recommend.trim() == null || recommend.trim().equals("")){
			resultValue = jd.joinProcessAll(mem);
		}else{
			resultValue = jd.joinProcessAllRec(mem, recommend);
		}
		if(resultValue == -1){
			addFieldError("result", "회원가입에 실패하였습니다.");
		}else{
			System.out.println("회원가입성공");
			Random rd = new Random();
			int randNum = rd.nextInt(10);
			message = Integer.toString(randNum);
		}
		/*int resultNum = jd.insertMember(mem);
		
		
		System.out.println(resultNum);
		if(resultNum == 0){
			addFieldError("result", "회원가입에 실패하였습니다.");
		}*/
		
		/*int rpRecommend;
		int recommendNum = 0;
		if(!recommend.trim().equals("") || recommend != null){
			rpRecommend = jd.updateRecommendPoint(recommend.trim());
			System.out.println("rpRecommend : " + rpRecommend);
			recommendNum = jd.selectRecommendNum(recommend.trim());
			System.out.println("recommendNum : " + recommendNum);
		}*/
		
		/*int pointIncomeJoin;
		int pointIncomeRec;
		PointIncome pi = new PointIncome();
		pi.setPointIncomePoint(1000);
		pi.setPointIncomeDetail("회원가입");
		pi.setPointIncomeList("회원가입으로 1000포인트를 받았습니다.");
		pi.setMemberNumber(resultNum);
		pointIncomeJoin = jd.joinPointIncome(pi);
		pi = new PointIncome();
		pi.setPointIncomePoint(1000);
		pi.setPointIncomeDetail("가입추천");
		pi.setPointIncomeList("가입추천으로 1000포인트를 받았습니다.");
		pi.setMemberNumber(recommendNum);
		pointIncomeRec = jd.joinPointIncome(pi);
		
		int pointOutcomJoin;
		int pointOutcomRec;
		pointOutcome po = new pointOutcome();
		po.setPointOutcomePoint(1000);
		po.setPointOutcomeDetail("회원가입");
		po.setPointOutcomeList(userid + "님의 회원가입으로 1000포인트 지출하였습니다.");
		po.setMemberNumber(1);
		pointOutcomJoin = jd.joinPointOutcome(po);
		po = new pointOutcome();
		po.setPointOutcomePoint(1000);
		po.setPointOutcomeDetail("가입추천");
		po.setPointOutcomeList(recommend.trim() + "님이 " + userid + "님을 가입추천하여 1000포인트를 지출하였습니다.");
		po.setMemberNumber(1);*/
		
		return SUCCESS;
	}
	
	@Override
	public void validate(){
		
	}

	public String getAgreement() {
		return agreement;
	}

	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	

	public String getEmailVal() {
		return emailVal;
	}

	public void setEmailVal(String emailVal) {
		this.emailVal = emailVal;
	}

	public String getMobileco() {
		return mobileco;
	}

	public void setMobileco(String mobileco) {
		this.mobileco = mobileco;
	}

	public int getPostNumber() {
		return postNumber;
	}

	public void setPostNumber(int postNumber) {
		this.postNumber = postNumber;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getAgreeMail() {
		return agreeMail;
	}

	public void setAgreeMail(String agreeMail) {
		this.agreeMail = agreeMail;
	}

	public String getFirstnum() {
		return firstnum;
	}

	public void setFirstnum(String firstnum) {
		this.firstnum = firstnum;
	}

	public String getSecondnum() {
		return secondnum;
	}

	public void setSecondnum(String secondnum) {
		this.secondnum = secondnum;
	}

	public String getLastnum() {
		return lastnum;
	}

	public void setLastnum(String lastnum) {
		this.lastnum = lastnum;
	}
	
}
