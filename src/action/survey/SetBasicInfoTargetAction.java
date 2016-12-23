package action.survey;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;

import com.opensymphony.xwork2.Action;

public class SetBasicInfoTargetAction implements Action, ParameterAware{

	private Map parameters;
	private String surveyTitle;
	private String questionCount;
	private String limitSetNum;
	private List<String> consName;
	private List<String> consNameNum;
	private List<String> consNameCnt;
	
	public String getSurveyTitle() {
		return surveyTitle;
	}

	public String getQuestionCount() {
		return questionCount;
	}

	public String getLimitSetNum() {
		return limitSetNum;
	}

	public List<String> getConsName() {
		return consName;
	}

	public List<String> getConsNameNum() {
		return consNameNum;
	}

	public List<String> getConsNameCnt() {
		return consNameCnt;
	}

	@Override
	public void setParameters(Map parameters) {
		this.parameters = parameters;
	}

	@Override
	public String execute() throws Exception{
		String consText[];
		String consValue[];
		String consNum[];
		String surTitle[];
		String setNum[];
		String queCount[];
		
		
		if(parameters != null && parameters.size() != 0){
			consText = (String[])parameters.get("textName");
			consName = new ArrayList<String>();
			
			for (String string : consText) {
				consName.add(string);
				System.out.println(string);
			}
			consValue = (String[])parameters.get("textBox");
			consNameCnt = new ArrayList<String>();
			for (String string : consValue) {
				consNameCnt.add(string);
				System.out.println(string);
			}
			consNum = (String[])parameters.get("hiddenBox");
			consNameNum = new ArrayList<String>();
			for (String string : consNum) {
				consNameNum.add(string);
				System.out.println(string);
			}
			surTitle = (String[])parameters.get("surveyTitle");
			for (String string : surTitle) {
				System.out.println(string);
			}
			setNum = (String[])parameters.get("setLimitNumber");
			for (String i : setNum) {
				System.out.println(i);
			}
			queCount = (String[])parameters.get("questionCount");
			for (String i : queCount) {
				System.out.println(i);
			}
			if(surTitle.length != 0 ){
				surveyTitle = surTitle[0];
			}
			if(queCount.length != 0){
				questionCount = queCount[0];
			}
			if(setNum.length != 0){
				limitSetNum = setNum[0];
			}
			
			
		}
		
		return SUCCESS;
	}
	
}
