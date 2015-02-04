package Utility.RESTful;

import java.util.ArrayList;

import org.simpleframework.xml.Element;
import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.Root;

@Root(name="SimTest")
public class SimTest {
	@Element(name="Name")
	private String name="TEST";
	
	@ElementList(inline=true, required=false)
	//public ArrayList<Member> member	=	new ArrayList<Member>();
	
	@Element(name="Address", required=false)
	private String address;
	
	
	@ElementList(inline=true, required=false)
	public ArrayList<Member2> member2	=	new ArrayList<SimTest.Member2>();
	
	@Root
	public static class Member2{
		@Element(required=false)
		public String name;
	}//내부클래스로 사용할 경우 static으로 선언되어야한다
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

/*	public ArrayList<Member> getMember() {
		return member;
	}

	public void setMember(ArrayList<Member> member) {
		this.member = member;
	}*/
	
	
	
	
}
