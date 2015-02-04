package Utility.RESTful;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class HelloWorld2 implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		RestClient rc	=	new RestClient("203.233.196.171", "8080", "/Project_Base/helloWorld.action");
		Object ob	=	null;
		
		
		
		HttpServletRequest request	=	ServletActionContext.getRequest();
		RestServer rs	=	new RestServer(request);
		
		String method	=	request.getMethod().toUpperCase();
		System.out.println("method = "+method);
		
		if(method.equals("GET")){
			//검색
		}else if(method.equals("POST")){
			//수정	
			//ob=(Member)	rs.parseIntoObject(Member.class);
				
				//dao.insertMember(ob);
		}else if(method.equals("PUT")){
				//생성
		}else if(method.equals("DELETE")){
			//삭제
		}
		
		rc.execute(RestMethod.GET);
		
		String res	=	rc.getResponse();
		
		request.setAttribute("message", res);
		
		return SUCCESS;
	}

}
