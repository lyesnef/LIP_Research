package action.survey;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;

import com.opensymphony.xwork2.Action;

import dao.PollDao;

public class SetConstraintAction implements Action, ParameterAware{

	private Map parameters;
	private int pollCnt;
	
	public int getPollCnt() {
		return pollCnt;
	}

	public void setPollCnt(int pollCnt) {
		this.pollCnt = pollCnt;
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
		
		
		return SUCCESS;
	}

}
