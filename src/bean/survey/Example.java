package bean.survey;

public class Example {

	private int exampleNumber;// key
	private int exampleOrder; //순서
	private String exampleLink; //주소 null 가능
	private String exampleContant; //보기내용
	private int exampleType; //
	private int exampleCounter;
	private int pollExampleNumber; // 폴보기번호
	private String conString; 		// 권역내용
	private int totalValue;			// 선택답
	
	
	
	public String getConString() {
		return conString;
	}
	public void setConString(String conString) {
		this.conString = conString;
	}
	public int getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(int totalValue) {
		this.totalValue = totalValue;
	}
	public int getPollExampleNumber() {
		return pollExampleNumber;
	}
	public void setPollExampleNumber(int pollExampleNumber) {
		this.pollExampleNumber = pollExampleNumber;
	}
	public int getExampleCounter() {
		return exampleCounter;
	}
	public void setExampleCounter(int exampleCounter) {
		this.exampleCounter = exampleCounter;
	}
	public int getExampleNumber() {
		return exampleNumber;
	}
	public void setExampleNumber(int exampleNumber) {
		this.exampleNumber = exampleNumber;
	}
	public int getExampleOrder() {
		return exampleOrder;
	}
	public void setExampleOrder(int exampleOrder) {
		this.exampleOrder = exampleOrder;
	}
	public String getExampleLink() {
		return exampleLink;
	}
	public void setExampleLink(String exampleLink) {
		this.exampleLink = exampleLink;
	}
	public String getExampleContant() {
		return exampleContant;
	}
	public void setExampleContant(String exampleContant) {
		this.exampleContant = exampleContant;
	}
	public int getExampleType() {
		return exampleType;
	}
	public void setExampleType(int exampleType) {
		this.exampleType = exampleType;
	}
	
}
