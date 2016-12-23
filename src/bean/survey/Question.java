package bean.survey;

import java.util.List;

public class Question {

	private int questionNumber;		//문제번호
	private int questionOrder;		//문제순서
	private String questionContant;	//문제내용
	private String questionImage;	//문제이미지
	private int questionType;		//문제타입
	private int questionViewType;	//문제보기타입
	private int surveyNumber;		//서베이 넘버
	
	//resultMap
	private List<Example> exampleList;	//문제 보기 리스트

	public int getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	public int getQuestionOrder() {
		return questionOrder;
	}
	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}
	public String getQuestionContant() {
		return questionContant;
	}
	public void setQuestionContant(String questionContant) {
		this.questionContant = questionContant;
	}
	public String getQuestionImage() {
		return questionImage;
	}
	public void setQuestionImage(String questionImage) {
		this.questionImage = questionImage;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	public int getQuestionViewType() {
		return questionViewType;
	}
	public void setQuestionViewType(int questionViewType) {
		this.questionViewType = questionViewType;
	}
	public int getSurveyNumber() {
		return surveyNumber;
	}
	public void setSurveyNumber(int surveyNumber) {
		this.surveyNumber = surveyNumber;
	}
	public List<Example> getExampleList() {
		return exampleList;
	}
	public void setExampleList(List<Example> exampleList) {
		this.exampleList = exampleList;
	}
}
