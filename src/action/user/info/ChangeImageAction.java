package action.user.info;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Utility.FileManager;
import Utility.FileUpload;

import bean.member.LipMember;

import com.opensymphony.xwork2.Action;

import dao.InfoDao;
import dao.LogDao;

public class ChangeImageAction implements Action {
	private File image;
	private String imageContentType;
	private String imageFileName;
	private int result;
	private String titleMessage;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
	
		String img_path	=	"D://upload/member/";
		FileManager fm	=	new FileManager();
		FileUpload fu	=	new FileUpload(img_path);
		InfoDao id	=	new InfoDao();
		System.out.println("1");
		String fname	=	fm.getExtenstion(UUID.randomUUID().toString(), imageFileName);
		fname	=	fname.replaceAll("-", "_");
		fu.saveFile(image, fname);
		fname	=	img_path+fname;
		System.out.println("2");
		HttpSession session	=	ServletActionContext.getRequest().getSession();
		
		LipMember lm	=	(LipMember) session.getAttribute("lipMember");
		lm.setMemberImage(fname);
		System.out.println("3");
		session.removeAttribute("lipMember");
		session.setAttribute("lipMember", lm);
		System.out.println("4");
		System.out.println(fname);
		id.updateMemberImg(lm);
		titleMessage	=	"사진변경 성공";
		System.out.println("11");
		result	=	1;
		System.out.println("11");
		
		LogDao ld	=	new LogDao();
		
		String result2 = ld.selectByNumber(lm.getMemberNumber()).getMemberImage();
		
		if(result2!=fname){
			result	=	2;
			 titleMessage	=	"사진변경 실패";
		}
			
			 System.out.println("2");
			
			
		System.out.println("11");
		
		return SUCCESS;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getTitleMessage() {
		return titleMessage;
	}
	public void setTitleMessage(String titleMessage) {
		this.titleMessage = titleMessage;
	}
	
	

}
