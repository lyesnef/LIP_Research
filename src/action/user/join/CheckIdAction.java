package action.user.join;

import com.opensymphony.xwork2.Action;

import dao.LogDao;

public class CheckIdAction implements Action {

	private String message;
	private String userid;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMessage() {
		return message;
	}
		
	@Override
	public String execute() throws Exception {
		
		LogDao logDao = new LogDao();
		int cnt = logDao.selectNumById(userid);
		
		if(cnt == 0){
			message = "사용 가능한 아이디입니다.";
		}else if(cnt >0){
			message = "중복된 아이디입니다. 다시 입력해주세요.";
		}
		
		return SUCCESS;
	}

}
