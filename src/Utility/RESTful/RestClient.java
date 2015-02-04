package Utility.RESTful;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

public class RestClient {
	/*
	 * NameValuePair	=	네임과 밸류를 캡슐화시키는 간단한 클래스
	 * HttpEntity	=	Http 메세지와 함께 보내지거나 받을 수 있는 엔티티
	 * 엔티티들은 선택적으로 Request나 Response에서 볼 수 있다.
	 * 엔티티는 그들의 기원에 따라 세가지 타입의 엔티티들이 HttpCore에 있다.
	 * 
    streamed: The content is received from a stream, 
    Streamed : 스트림으로 부터 받은 콘텐트거나 광고지로 부터 발생된 것들
    특히 이 카테고리는 커넥션으로 부터 받은 엔티티들을 포함한다.
    스트림드 엔티티들은 일반적으로 반복적이지 않다
    self-contained :  컨텐트가 메모리거나 커넥션 또는 다른 엔티티들로부터 독립적인 방법으로 얻어온 경우
    일반적으로 반복적이다
    Wrapping : 다른 엔티티로 부터 얻어온 컨텐트
   
	 */
	private ArrayList<NameValuePair> params;//JSON 방식, key=value 형식으로 들어있다.
	private String rawBody;
	
	private ArrayList<NameValuePair> headers;
	
	{
		params	=	new ArrayList<NameValuePair>();
		headers	=	new ArrayList<NameValuePair>();
	}
	
	private String url;
	private int responseCode;
	private String message;
	private String response;
	private byte[] rawDataBytes;//원본데이터바이트
	
	public RestClient(String url){
		this.url	=	url;
	}//생성자
	
	public RestClient(){}
	
	public RestClient(String host, String port, String path){
		response	=	null;
		this.url	=	"http://"+host+":"+port;
		if(path.substring(0,1).equals("/")){//Path에 /를 붙여서 입력했는가 안했는가
			this.url	+= path;
		}else{
			this.url	+=	"/"+path;//붙여준다
		}
	}
	
	public void addParam(String name, String value){
		params.add(new BasicNameValuePair(name, value));//NameValuePair 인터페이스를 구현한 클래스 키와 값 쌍으로 http message에 추가된다
	}//파라미터를 추가한다.
	
	public void addBody(String body){
		if(this.rawBody==null){
			this.rawBody	=	"";
		}
		this.rawBody+=body;
	}//바디를 추가한다
	
	public void setBody(String body){
		this.rawBody	=	body;
	}
	
	public void addHeader(String name, String value){
		headers.add(new BasicNameValuePair(name, value));
	}//헤더를 추가한다
	
	public void execute(RestMethod method) throws Exception{
		if(method==RestMethod.GET){//겟방식으로 들어오면
			String combinedParams	=	"";//복합파라메터 변수
			if(!params.isEmpty()){//파라미터가 비어있지 않으면 
				combinedParams+="?";//파라미터 뒤에 물음표를 붙이고
				for(NameValuePair p : params){//파라미터에 들어있는 네임밸류쌍을 하나씩 꺼내서
					String paramString	=	p.getName()+"="+URLEncoder.encode(p.getValue(), "UTF-8");
					//이름=UTF-8로 인코딩한 값으로 해서 파라미터 스트링을 만들고
					if(combinedParams.length()>1){
						combinedParams+="&"+paramString; 
					}else{
						combinedParams+=paramString;
					}
				}
			}
			HttpGet request	=	new HttpGet(url+combinedParams);//겟방식 리퀘스트에 url과 파라미터 입력하고
			//url에 파라미터를 붙여서 전송한다
			for(NameValuePair h : headers){
				request.addHeader(h.getName(), h.getValue());
			}//헤더에 네임밸류를 입력한다
			executeRequest(request, url);
			//리퀘스트를 실행한다
			}else if(method==RestMethod.POST){//포스트 방식이면
				HttpPost request	=	new HttpPost(url);//포스트 객체에 url넣고
				for(NameValuePair h : headers){
					request.addHeader(h.getName(), h.getValue());
				}//헤더셋팅하고
				if(!params.isEmpty()){
					request.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
				}//파라미터를 리퀘스트에 Entity로 첨부한다
				if(rawBody!=null){
					request.setEntity(new StringEntity(rawBody));
				}//바디가 있는 경우 바디도 덧붙인다
				executeRequest(request, url);//실행
		}else if(method==RestMethod.PUT){//PUT방식일 때
			HttpPut request	=	new HttpPut(url);//PUT객체 생성해서
			for(NameValuePair h : headers){
				request.addHeader(h.getName(), h.getValue());
			}//헤더셋팅하고
			if(!params.isEmpty()){
				String en	=	"";
				for(NameValuePair p : params){
					en+=p.getValue();
				}//파라미터가 있는 경우에 파라미터 밸류들을 다 가져와서 스트링객체로 보관후
				StringEntity input	=	new StringEntity(en);
				//StringEntity를 생성해서 안에 입력한다
				request.setEntity(input);//그리고 리퀘스트에 세팅한다
			}
			if(rawBody!=null){
				request.setEntity(new StringEntity(rawBody));
			}//바디도 있으면 적재
			executeRequest(request, url);//실행
		}else if(method==RestMethod.DELETE){//삭제시
			String combinedParams	=	"";
			if(!params.isEmpty()){//파라미터가 있으면 
				combinedParams+="?";
				for(NameValuePair p : params){
					String paramString = p.getName()+"="+URLEncoder.encode(p.getValue(), "UTF-8");
					if(combinedParams.length()>1){
						combinedParams+="&"+paramString;
					}else{
						combinedParams+=paramString;
					}
				} 
			}
			HttpDelete request	=	new HttpDelete(url+combinedParams);
			for(NameValuePair h : headers){
				request.addHeader(h.getName(), h.getValue());
			}
			executeRequest(request, url);
		}
	}
	
	private void executeRequest(HttpUriRequest request, String url){
		HttpClient client	=	new DefaultHttpClient();
		HttpResponse httpResponse;
		
		try{
			httpResponse	=	client.execute(request);
			responseCode	= httpResponse.getStatusLine().getStatusCode();
			message	=	httpResponse.getStatusLine().getReasonPhrase();
			HttpEntity entity	=	httpResponse.getEntity();
			
			if(entity != null){
				InputStream in	=	entity.getContent();
				response	=	convertStreamToString(in);
				response	=	response.replaceAll("&", "&amp;");
				in.close();
			}
		}catch(ClientProtocolException e){
			client.getConnectionManager().shutdown();
		}catch(IOException e){
			client.getConnectionManager().shutdown();
		}
	}
	
	private static String convertStreamToString(InputStream is){
		BufferedReader reader	=	new BufferedReader(new InputStreamReader(is));
		StringBuilder sb	=	new StringBuilder();
		String line	=	null;
		
		try{
			while((line=reader.readLine())!=null){
				sb.append(line+"\n");
			}
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				is.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	public int getResponseCode(){
		return responseCode;
	}
	
	public String getMessage(){
		return message;
	}
	
	public String getResponse(){
		return response;
	}
	
	public void setRawDataBytes(byte[] rawDataBytes){
		this.rawDataBytes	=	rawDataBytes;
	}
	
}
