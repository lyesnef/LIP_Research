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

public class RestServer {
	private HttpServletRequest request;
	
	public RestServer(){}
	
	//HTTPREQUEST를 생성자로 받아온다
	public RestServer(HttpServletRequest request){
		this.request	=	request;
	}
	/*
	 * HttpRequest로 들어온 파라메터들로 지정한 타입의 객체를 만든다
	 * 
	 */
	public Object parseIntoObject(Class c){
		String requestBody	=	findBody();
		Serializer sr	=	new Persister();
		requestBody.replaceAll("&", "&amp");
		Object result=null;
		try {
			result = sr.read(c, requestBody);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 	result;
	}
	
	public String parseIntoXML(Object ob){
		String result	=	"";
		StringBuilder sb	=	new StringBuilder("<?xml version='1.0' encoding='UTF-8' ?>\r\n" );
		Serializer serializer	=	new Persister();
		StringWriter sw	=	new StringWriter();
		try{
			serializer.write(ob, sw);	
		}catch(Exception e){
			System.out.println(e.toString());
		}
		sb.append(sw.toString());
		
		result	=	sb.toString();
		System.out.println("result = "+result);
		return result;
	}
	
	private String findBody() {

		Map map = (HashMap) request.getParameterMap();
		Set set = map.keySet();
		String requestBody = "";
		Iterator<String> it = set.iterator();
		System.out.println(map.size());

		while (it.hasNext()) {
			String key = it.next();
			String s1[] = (String[]) map.get(key);
			System.out.println("key : " + key);
			requestBody = s1[0];
		}
		System.out.println("requestBody : "+requestBody);
		return requestBody;
	}
}
