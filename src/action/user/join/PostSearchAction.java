package action.user.join;

import java.util.ArrayList;
import java.util.List;

import bean.member.Postcode;

import com.opensymphony.xwork2.Action;

import dao.JoinDao;

public class PostSearchAction implements Action {
	private String codename;
	private List<Postcode> list;
	
	public List<Postcode> getList() {
		return list;
	}

	public void setList(List<Postcode> list) {
		this.list = list;
	}

	public String getCodename() {
		return codename;
	}

	public void setCodename(String codename) {
		this.codename = codename;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("?!?!?!?!");
		JoinDao jd = new JoinDao();
		int cnt;
		String str = "";
		cnt = codename.indexOf("동");
		System.out.println(cnt);
		if(cnt==-1){
			list = new ArrayList<Postcode>();
			list = (ArrayList<Postcode>)jd.selectPostcode(codename);
		}else{
			str = codename.substring(0, cnt);
			System.out.println(str);
			list = new ArrayList<Postcode>();
			list = (ArrayList<Postcode>)jd.selectPostcode(str);
			
		}
		
		
		
		return SUCCESS;
	}
	
}
