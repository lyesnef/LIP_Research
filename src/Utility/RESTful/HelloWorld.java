package Utility.RESTful;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;

import com.opensymphony.xwork2.Action;

public class HelloWorld implements Action{
	private String message;
	
	
	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request	=	ServletActionContext.getRequest();
		RestServer rs	=	new RestServer(request);
		SimTest sim1	=	null;
		
		String requestBody	=	"";
		if(request.getMethod().toUpperCase().equals("GET")){
			this.message	=	"GET";
		
		}else if(request.getMethod().toUpperCase().equals("POST")){
			this.message	=	"POST";
				sim1=(SimTest)	rs.parseIntoObject(SimTest.class);
		}else if(request.getMethod().toUpperCase().equals("PUT")){
			this.message	=	"PUT";
			
		}else if(request.getMethod().toUpperCase().equals("DELETE")){
			this.message	=	"DELETE";
		}
		SimTest.Member2	member2	=	new SimTest.Member2();
		
		System.out.println("name = "+sim1.getName());
	
		/*System.out.println(message);
		System.out.println(sim.getName());
		System.out.println(sim.getAddress());*/
		/*Member sim	=	new Member();
		sim.setName("박상식");
		sim.setAge(300);
		sim.setPhone("폰 없음");
		sim.setSex(true);
		*/
		//String xmlBody = rs.parseIntoXML(sim);
		message	=rs.parseIntoXML(sim1);
		//message	=	xmlBody;
		
		request.setAttribute("message", message);
		
		return SUCCESS;
	}
	
	
	
}
