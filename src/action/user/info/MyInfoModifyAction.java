package action.user.info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.member.LipMember;
import bean.member.Postcode;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dao.InfoDao;
import dao.MailSendListDao;

public class MyInfoModifyAction implements Action{
	private String userid;
	private String userPW;
	private String userCell;
	private String userCellCo;
	private int postcode1;
	private int postNumber;
	private String userDetailpost;
	private String agreeMail;
	private LipMember lipMember;
	private Postcode pc;

	@Override
	public String execute() throws Exception {
		System.out.println("postNumber : " + postNumber);
		Map<String, Object> session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		int cnt = 0;
		lipMember = new LipMember();
		lipMember = (LipMember)request.getSession().getAttribute("lipMember");
		System.out.println("원래 비번 : " + lipMember.getMemberPw());
		
		if(userPW != null && !userPW.trim().equals("")){
			if(!userPW.trim().equals(lipMember.getMemberPw())){
				lipMember.setMemberPw(userPW);
				cnt++;
				System.out.println("유저비밀번호수정");
			}
		}
		if(userCell != null && !userCell.trim().equals("")){
			if(!userCell.trim().equals(lipMember.getMemberCellphoneNumber())){
				lipMember.setMemberCellphoneCo(userCellCo.trim());
				lipMember.setMemberCellphoneNumber(userCell.trim());
				cnt++;
			}
		}
		if(postNumber != 0){
			if(postNumber == lipMember.getPostcodeNumber()){
				lipMember.setPostcodeNumber(postNumber);
				lipMember.setMemberDetailAddress(userDetailpost);
				int regionNumber = 0;
				if(postcode1 >=100 && postcode1 <=199){
					regionNumber = 1;
				}else if(postcode1 >=200 && postcode1 <=299){
					regionNumber =2;
				}else if(postcode1 >=300 && postcode1 <=399){
					regionNumber = 3;
				}else if(postcode1 >=400 && postcode1 <=499){
					regionNumber = 4;
				}else if(postcode1 >=500 && postcode1 <=599){
					regionNumber = 5;
				}else if(postcode1 >=600 && postcode1 <=689){
					regionNumber = 6;
				}else if(postcode1 >=690 && postcode1 <=699){
					regionNumber = 7;
				}else if(postcode1 >=700 && postcode1 <=799){
					regionNumber = 6;
				}
				if(regionNumber != 0){
					lipMember.setRegionNumber(regionNumber);
				}
				cnt++;
			}
		}
		if(agreeMail.trim().equals("false")){
			agreeMail = "F";
		}else{
			agreeMail = "T";
		}
		if(!agreeMail.equals(lipMember.getMemberEmailRecieve())){
			lipMember.setMemberEmailRecieve(agreeMail);
			cnt++;
		}
		
		if(cnt>0){
			System.out.println("정보업데이트함");
			InfoDao infodao = new InfoDao();
			lipMember = infodao.updateInfoMemberByID(lipMember);
			System.out.println("세션처리");
			session.put("lipMember", lipMember);
			List<Integer> enterList = new ArrayList<Integer>();
			MailSendListDao mailSendDoa = new MailSendListDao();
			enterList=mailSendDoa.selectByMemberNum(lipMember.getMemberNumber());
			session.put("enterList", enterList);
		}
		pc = new Postcode();
		InfoDao infodao = new InfoDao();
		pc = infodao.selectPostcodeByNum(lipMember.getPostcodeNumber());
		System.out.println("pw : " + lipMember.getMemberPw());
		System.out.println("email agree : " + lipMember.getMemberEmailRecieve());
		System.out.println("포스트넘버 : " + postNumber);
		System.out.println("정보수정끝");
		
		return SUCCESS;
	}

	public String getUserCellCo() {
		return userCellCo;
	}

	public void setUserCellCo(String userCellCo) {
		this.userCellCo = userCellCo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserCell() {
		return userCell;
	}

	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}

	public int getPostcode1() {
		return postcode1;
	}

	public void setPostcode1(int postcode1) {
		this.postcode1 = postcode1;
	}

	public int getPostNumber() {
		return postNumber;
	}

	public void setPostNumber(int postNumber) {
		this.postNumber = postNumber;
	}

	public String getUserDetailpost() {
		return userDetailpost;
	}

	public void setUserDetailpost(String userDetailpost) {
		this.userDetailpost = userDetailpost;
	}

	public String getAgreeMail() {
		return agreeMail;
	}

	public void setAgreeMail(String agreeMail) {
		this.agreeMail = agreeMail;
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
