package action.point;



import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ResponseExchangeAction implements Preparable, ModelDriven<Member>, Action {
	private Member member;
	private String result;

	 String id = "gghaaa";
	String pwd ="1234";
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	public String checkMember(){
		//회원을 확인하고 결과를 전송한다 회원번호 ()
		System.out.println(member.getId());
		System.out.println(member.getPwd());
		if (id.equals(member.getId()) && pwd.equals(member.getPwd()) ) {
			result = "true";
			return SUCCESS;
		}
		
		result = "fales";
		return SUCCESS;
	}
	public String changePoint() {
		//포인트를 바꾸준다.
		result = "true";
		return SUCCESS;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	@Override
	public Member getModel() {
		// TODO Auto-generated method stub
		return member;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		member = new Member();
	}
}
