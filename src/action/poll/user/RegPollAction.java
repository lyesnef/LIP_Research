package action.poll.user;

import com.opensymphony.xwork2.Action;

public class RegPollAction implements Action {
	private String question;
	private String answer1;
	private String answer2;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("question : "+question);
		System.out.println("answer1 : "+answer1);
		System.out.println("answer2 : "+answer2);
		
		return SUCCESS;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	
}
