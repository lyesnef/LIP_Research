package action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 웹 상에 서버의 하드디스크에 저장된 이미지를 표시하기 위한 클래스
 * 웹상에서 프로젝트 안의 폴더가 아닌 경우 이미지를 표시하지 못하는
 * 경우가 있는데 그런 경우를 위해 입출력을 통해 강제 표시해 준다.
 */
public class ReadImage extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String imgName;//이미지 파일 명
	private HttpServletResponse response;//리스폰스 객체
	public String execute() throws Exception {
		response = ServletActionContext.getResponse();//리스폰스 객체의 인스턴스를 가져온다
		System.out.println(imgName);
	
			
		try {
			FileInputStream fis = new FileInputStream(new File(imgName));//파일 인풋 스트림으로 파일 리소스에 접근
			BufferedInputStream bis = new BufferedInputStream(fis);//버퍼를 통한 안정적 입출력
			BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
			for (int data; (data = bis.read()) > -1;) {            
				 output.write(data);
			}//데이터를 출력스트림에 끝까지 쓴다
			bis.close();
			fis.close();
		}catch (IOException e) {}
		return SUCCESS;
	}
	 
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	
}
