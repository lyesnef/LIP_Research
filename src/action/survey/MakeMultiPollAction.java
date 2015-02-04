package action.survey;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;

import com.opensymphony.xwork2.Action;

import dao.PollDao;

public class MakeMultiPollAction implements Action, ParameterAware{

	private Map parameters;
	
	private String queCnt;

	public String getQueCnt() {
		return queCnt;
	}

	public void setQueCnt(String queCnt) {
		this.queCnt = queCnt;
	}

	@Override
	public void setParameters(Map parameters) {
		this.parameters = parameters;		
	}

	@Override
	public String execute() throws Exception {
		for (int i=0; i<parameters.size(); i++) {
			System.out.println(parameters.get(i));
		}
		
		queCnt = "Que" + queCnt;
		
		return SUCCESS;
	}

}
